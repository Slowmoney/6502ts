import { uint_8t } from "./types";

export default class PPU {
    PPUCTRL = 0;
    mask = 0;
    memory = new Uint8Array(0x3fff);
    addr = 0;
    private isLowByte = false;
    scrollLatch = false;
    verticalScroll: number = 0;
    horizontalScroll: number = 0;
    scanline: number = 0;
    cycle: number = 0;

    OAM = new Uint8Array(64*4)

    screen = new ImageData(341, 261);
    constructor() { }
    get baseNametableAddr () {
        return 0x2000 + ((this.PPUCTRL >> 0) & 0b11) * 0x400;
    }
    readStatus () {
        const value = this.PPUCTRL;
        return value;
    }
    writeStatus (value: uint_8t) {
        this.PPUCTRL = value;
    }
    writeAddresPointer (addr: uint_8t) {
        addr &= 255;
        if (!this.isLowByte)
            this.addr = ((addr & 0x3f) << 8) | (this.addr & 0x00ff);
        else this.addr = (this.addr & 0xff00) | addr;
        //console.log(this.addr.toString(16).toUpperCase());
        this.isLowByte = !this.isLowByte;
    }
    writeData (value: uint_8t) {
        //console.log(this.addr.toString(16).toUpperCase(), value.toString(16).toUpperCase());

        this.memory[this.addr] = value;
        this.addr++;
    }
    writeScroll (value: uint_8t) {
        if (!this.scrollLatch) this.horizontalScroll = value;
        else this.verticalScroll = value;
        this.scrollLatch = !this.scrollLatch;
    }
    draw () {
        if (this.scanline >= -1 && this.scanline < 240) {
            if (this.scanline == 0 && this.cycle == 0) {
                // "Odd Frame" cycle skip
                this.cycle = 1;
            }

            if (this.cycle < 256 && this.scanline < 240) {
                let x = Math.ceil((this.cycle + 1) / 8) - 1;
                let y = Math.ceil((this.scanline + 1) / 8) - 1;
                let characterPoint = x + y * 32;
                let char = this.memory[0x2400 + characterPoint];

                const cycleOffset = this.cycle % 8;
                const scanlineOffset = this.scanline % 8;

                const addr = char * 0x10 + scanlineOffset;
                const d = this.memory[addr];
                const d1 = this.memory[addr + 0x8];

                const p1 = (d >> (7 - cycleOffset)) & 0b01;
                const p2 = ((d1 >> (7 - cycleOffset)) & 0b01) << 1;
                const color = p1 | p2;

                //console.log(x%2);
                //console.log(y%2);

                const attrx = Math.ceil((this.cycle + 1) / 32) - 1;
                const attry = Math.ceil((this.scanline + 1) / 30)-1;                
                characterPoint = attrx + attry * 8;
                let attrAddr = 0x2400 + 0x3c0 + characterPoint
                char = this.memory[attrAddr];

                const palette = (char >> (attrx % 2) >> (((attry) % 2))) & 0b11;
                const rgb = this.colorToRGB(
                    this.memory[0x3f00 + (palette << 2) + color] & 0x3f
                );

                const screenAddr = this.cycle * 4 + this.scanline * 341 * 4;

                this.screen.data[screenAddr + 0] = rgb[0];
                this.screen.data[screenAddr + 1] = rgb[1];
                this.screen.data[screenAddr + 2] = rgb[2];
                this.screen.data[screenAddr + 3] = 0xff;
            }
        }
        if (this.scanline == -1 && this.cycle == 1) {
            //this.PPUCTRL &= ~(1 << 7);
        }

        if (this.scanline == 241 && this.cycle == 1) {
            this.PPUCTRL |= 1 << 7;
        }

        this.cycle++;
        if (this.cycle >= 341) {
            this.cycle = 0;
            this.scanline++;
            if (this.scanline >= 261) {
                this.scanline = -1;
            }
        }
    }
    colorToRGB (color: number) {
        //console.log(color);

        if (color == 0x19) return [56, 135, 0];
        else if (color == 0x00) return [102, 102, 102];
        else if (color == 0x0e) return [0, 0, 0];
        else if (color == 0x01) return [0, 42, 136];
        else if (color == 0x21) return [100, 176, 255];
        else {
            throw "0x" + color.toString(16).toUpperCase();
        }
    }
}
