import { uint_8t, uint_16t } from "./types";

export default class PPU {

    PPUSTATUS = 0
    PPUCTRL = 0;
    PPUMASK = 0;

    bg_next_tile_id: uint_8t = 0x00;
    bg_next_tile_attrib: uint_8t = 0x00;
    bg_next_tile_lsb: uint_8t = 0x00;
    bg_next_tile_msb: uint_8t = 0x00;
    bg_shifter_pattern_lo: uint_16t = 0x0000;
    bg_shifter_pattern_hi: uint_16t = 0x0000;
    bg_shifter_attrib_lo: uint_16t = 0x0000;
    bg_shifter_attrib_hi: uint_16t = 0x0000;

    memory = new Uint8Array(0x3fff);
    addr = 0;
    private isLowByte = false;
    scrollLatch = false;
    verticalScroll: number = 0;
    horizontalScroll: number = 0;
    scanline: number = 0;
    cycle: number = 0;
    spriteScanline = new Uint8Array(8 * 4)
    OAM = new Uint8Array(64 * 4)

    screen = new ImageData(341, 261);
    sprite_shifter_pattern_lo: number[] = [0, 0, 0, 0, 0, 0, 0];
    sprite_shifter_pattern_hi: number[] = [0, 0, 0, 0, 0, 0, 0];
    sprite_count: number = 0;
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
            if (this.scanline == -1 && this.cycle == 1) {

                // Effectively start of new frame, so clear vertical blank flag
                this.PPUSTATUS &= ~(1 << 7);

                // Clear sprite overflow flag
                this.PPUSTATUS &= ~(1 << 5);

                // Clear the sprite zero hit flag
                this.PPUSTATUS &= ~(1 << 6);

                // Clear Shifters
                for (let i = 0; i < 8; i++) {
                    this.sprite_shifter_pattern_lo[i] = 0;
                    this.sprite_shifter_pattern_hi[i] = 0;
                }
            }
            if ((this.cycle >= 2 && this.cycle < 258) || (this.cycle >= 321 && this.cycle < 338)) {
                switch ((this.cycle - 1) % 8) {

                }
            }
            if (this.cycle == 257 && this.scanline >= 0) {
                this.sprite_count = 0;
                for (let i = 0; i < 8; i++) {
                    this.sprite_shifter_pattern_lo[i] = 0;
                    this.sprite_shifter_pattern_hi[i] = 0;
                }
                let nOAMEntry = 0;
                let bSpriteZeroHitPossible = false;
                while (nOAMEntry < 64 && this.sprite_count < 9) {
                    let diff: uint_16t = (this.scanline - this.OAM[nOAMEntry * 4]);
                    if (diff >= 0 && diff < (((this.PPUCTRL >> 5) & 1) ? 16 : 8) && this.sprite_count < 8) {
                        // Sprite is visible, so copy the attribute entry over to our
                        // scanline sprite cache. Ive added < 8 here to guard the array
                        // being written to.
                        if (this.sprite_count < 8) {
                            // Is this sprite sprite zero?
                            if (nOAMEntry == 0) {
                                // It is, so its possible it may trigger a 
                                // sprite zero hit when drawn
                                bSpriteZeroHitPossible = true;
                            }
                            //console.log(nOAMEntry, this.OAM.subarray(nOAMEntry*4, (nOAMEntry*4)+4));

                            this.spriteScanline.set(this.OAM.subarray(nOAMEntry * 4, (nOAMEntry * 4) + 4), this.sprite_count * 4)
                            //memcpy(&spriteScanline[sprite_count], &OAM[nOAMEntry * 4], sizeof(sObjectAttributeEntry));						
                        }
                        this.sprite_count++;
                    }
                    nOAMEntry++;
                }
                this.PPUSTATUS |= ((this.sprite_count >= 8) ? 1 : 0) << 5;
            }
            if (this.cycle == 340) {
                for (let i = 0; i < this.sprite_count; i++){
				    let sprite_pattern_addr_lo: uint_8t=0; 
                    let sprite_pattern_addr_hi: uint_8t=0;

                    if(!((this.PPUCTRL >> 5)&1)){
                        if(!(this.spriteScanline[i*4+3]& 0x80)){
                            sprite_pattern_addr_lo = 
                                (((this.PPUCTRL>>3)&1) << 12) | (this.spriteScanline[i*4+1] << 4)| (this.scanline - this.spriteScanline[i*4]);
                        }else{
                            sprite_pattern_addr_lo = 
                                (((this.PPUCTRL>>3)&1) << 12) | (this.spriteScanline[i*4+1] << 4)| (7-this.scanline - this.spriteScanline[i*4]);
                        }
                        
                    }else{

                    }

                    sprite_pattern_addr_hi = sprite_pattern_addr_lo + 8;
                    this.sprite_shifter_pattern_lo[i] = this.memory[sprite_pattern_addr_lo];
                    this.sprite_shifter_pattern_hi[i] =  this.memory[sprite_pattern_addr_hi];
                }
                
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
                const attry = Math.ceil((this.scanline + 1) / 30) - 1;
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
