import { uint_8t } from "./types"

export default class PPU {
    status = 0
    control0 = 0
    control1 = 0
    memory = new Uint8Array(0x3FFF)
    addr = 0
    private isLowByte = false
    scrollLatch = false
    verticalScroll: number = 0
    horizontalScroll: number = 0
    scanline: number = 0
    cycle: number = 0

    screen = new ImageData(341, 261)
    constructor() {

    }
    readStatus () {
        const value = this.status
        this.status = 0
        return value
    }
    writeStatus (value: uint_8t) {
        this.status = value
    }
    writeAddresPointer (addr: uint_8t) {

        addr &= 255
        if (!this.isLowByte) this.addr = ((addr & 0x3F) << 8) | (this.addr & 0x00FF)
        else this.addr = (this.addr & 0xFF00) | addr
        //console.log(this.addr.toString(16).toUpperCase());
        this.isLowByte = !this.isLowByte
    }
    writeData (value: uint_8t) {
        //console.log(this.addr.toString(16).toUpperCase(), value.toString(16).toUpperCase());

        this.memory[this.addr] = value
        this.addr++
    }
    writeScroll (value: uint_8t) {
        if (!this.scrollLatch) this.horizontalScroll = value
        else this.verticalScroll = value
        this.scrollLatch = !this.scrollLatch
    }
    draw (ctx: CanvasRenderingContext2D) {
        //console.log(this.scanline, Math.ceil(((this.scanline+1)/8)));
        
        //console.log(this.memory[0x2400+ Math.ceil(((this.scanline)/8))]);
        const x= Math.ceil(((this.cycle+1)/8))-1
        const y =  Math.ceil(((this.scanline+1)/8))-1
        const character = x + y * (336/8)

        this.memory[0x200+this.memory[0x2400 + character]]

        this.screen.data[((this.cycle)*4)+(this.scanline*341*4)+0] = this.memory[0x2400 + character]
        this.screen.data[((this.cycle)*4)+(this.scanline*341*4)+1] = this.memory[0x200+this.memory[0x2400 + character]]
        this.screen.data[((this.cycle)*4)+(this.scanline*341*4)+2] = 0
        this.screen.data[((this.cycle)*4)+(this.scanline*341*4)+3] = 0xff


        this.cycle++;
        if (this.cycle >= 341) {
            this.cycle = 0;
            this.scanline++;
            if (this.scanline >= 261) {
                this.scanline = 0;
                this.status |= 1 << 7;
                ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height)
                ctx.putImageData(this.screen, -this.horizontalScroll, -this.verticalScroll)
            }
        }
    }
}