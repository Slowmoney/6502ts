import MOS6502 from "./MOS6502";
import nes from "../assets/tutor.nes"
import NesParcer from "./NesParser";
import './style.css'
import Bus from "./Bus";
import PPU from "./PPU";
import GamePad from "./Gamepad";
//https://www.masswerk.at/6502/6502_instruction_set.html#INC
console.log(nes);
const parser = new NesParcer(nes)
console.log(parser);
console.log(parser.headerStr);
console.log(parser.sizePRGROM);

console.log(parser.sizeCHRROM);
console.log(parser.PRGROM);
console.log(parser.CHRROM);

const ppu = new PPU()
ppu.memory.set(parser.CHRROM)
console.log(ppu.memory);
const Joy1 = new GamePad()
const Joy2 = new GamePad()
const bus = new Bus(ppu, Joy1, Joy2)

bus.memory.set(parser.PRGROM, 0xC000)
bus.memory.set(parser.PRGROM, 0x8000)
const cpu = new MOS6502(bus)
bus.cpu = cpu
console.log(ppu);





cpu.PC = 0x8000
console.log(cpu);
const A = document.getElementById("A")
const X = document.getElementById("X")
const Y = document.getElementById("Y")
const PC = document.getElementById("PC")
const SP = document.getElementById("SP")

const N = document.getElementById("N") as HTMLInputElement
const V = document.getElementById("V") as HTMLInputElement
const U = document.getElementById("U") as HTMLInputElement
const B = document.getElementById("B") as HTMLInputElement
const D = document.getElementById("D") as HTMLInputElement
const I = document.getElementById("I") as HTMLInputElement
const Z = document.getElementById("Z") as HTMLInputElement
const C = document.getElementById("C") as HTMLInputElement

const NMI = document.getElementById("nmi") as HTMLInputElement
const RESET = document.getElementById("reset") as HTMLInputElement
const IRQ = document.getElementById("irq") as HTMLInputElement

const canvas = document.getElementById("canvas") as HTMLCanvasElement
const ctx = canvas.getContext('2d')


try {
    A && (A.innerText = cpu.A.toString(16).toUpperCase())
    X && (X.innerText = cpu.X.toString(16).toUpperCase())
    Y && (Y.innerText = cpu.Y.toString(16).toUpperCase())
    PC && (PC.innerText = cpu.PC.toString(16).toUpperCase())
    SP && (SP.innerText = cpu.SP.toString(16).toUpperCase())
    I && (I.checked = cpu.flagI)
    N && (N.checked = cpu.flagN)
    Z && (Z.checked = cpu.flagZ)
    C && (C.checked = cpu.flagC)
    B && (B.checked = cpu.flagB)
    V && (V.checked = cpu.flagV)
    D && (D.checked = cpu.flagD)
    let prevTime = 0
    let prevRender = 0
    function drawInfo(time: number) {
        if (ctx) {
            ctx.fillStyle = "#000"
            ctx.fillText("Time: "+(time - prevTime).toFixed(2), 270, 10)
            ctx.fillText("Draw: "+(time - prevRender).toFixed(2), 270, 20)
            if(prevRender){
                for (let x = 0; x < 16; x++) {
                    for (let y = 0; y < 16; y++) {
                        ctx.textAlign = "center"
                        const value = ppu.OAM[x + y*16]
                        if(value == undefined)continue
                        ctx.fillText((value).toString(16), 270+x*15, 30+y*10)
                    }
                    
                } 
            }
        }
    }

    function run(time: number) {
        for (let i = 0; i < 20000; i++) {
            bus.clock()
            if((ppu.PPUCTRL>>7)>0){
                if(ctx){
                    ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
                    ctx.putImageData(ppu.screen, 0, 0);
                    drawInfo(time)
                    prevRender = time
                }
                if(!cpu.flagI){
                    ppu.PPUCTRL &= ~(1 << 7);
                    cpu.NMI() 
                }
            }
        }
        
        prevTime = time
        
        
        A && (A.innerText = cpu.A.toString(16).toUpperCase())
        X && (X.innerText = cpu.X.toString(16).toUpperCase())
        Y && (Y.innerText = cpu.Y.toString(16).toUpperCase())
        PC && (PC.innerText = cpu.PC.toString(16).toUpperCase())
        SP && (SP.innerText = cpu.SP.toString(16).toUpperCase())
        I && (I.checked = cpu.flagI)
        N && (N.checked = cpu.flagN)
        Z && (Z.checked = cpu.flagZ)
        C && (C.checked = cpu.flagC)
        B && (B.checked = cpu.flagB)
        V && (V.checked = cpu.flagV)
        D && (D.checked = cpu.flagD)
        
        //ppu.writeStatus(0x80)

        
    }
    function step (time: number) {
        run(time)
        requestAnimationFrame(step)
    }

    
    requestAnimationFrame(step)
    NMI.addEventListener("click", () => {
        !cpu.flagI && cpu.NMI()
    })

    IRQ.addEventListener("click", () => {
        //cpu.memory[0x2002] = 0b10000000
        !cpu.flagI && cpu.IRQ()
    })
    RESET.addEventListener("click", () => {
        //cpu.memory[0x2002] = 0b10000000
        cpu.reset()
    })
} catch (error) {
    console.error(error);

}


console.log(cpu);
