import MOS6502 from "./MOS6502";
import nes from "../assets/tutor.nes"
import NesParcer from "./NesParser";
import './style.css'
import Bus from "./Bus";
import PPU from "./PPU";

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

const bus = new Bus(ppu)

bus.memory.set(parser.PRGROM, 0xC000)
bus.memory.set(parser.PRGROM, 0x8000)
const cpu = new MOS6502(bus)
console.log(ppu);


cpu.PC = 0xC000
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
    function run(time: number) {
        //console.log(time - prevTime);

        prevTime = time
        //ctx?.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height)
        for (let i = 0; i < 550; i++) {
            cpu.run()
        }
        for (let i = 0; i < 20000; i++) {
            ctx&&ppu.draw(ctx)

        }
        if((ppu.status>>7)>0){
            if(!cpu.flagI){
                cpu.NMI()
                ppu.status &= ~(1 << 7);
            }
            
        }
        
        
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
        
        ppu.writeStatus(0x80)

        
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
