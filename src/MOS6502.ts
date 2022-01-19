import Bus from "./Bus";
import { uint_8t, uint_16t } from "./types";

export default class MOS6502 {
    A: uint_8t = 0;
    X: uint_8t = 0;
    Y: uint_8t = 0;
    SP: uint_8t = 0x1fa;
    P: uint_8t = 0;

    PC: uint_16t = 0x8000;

    constructor(public bus: Bus) { }
    set flagN (value: boolean) {
        if (value) this.flags |= 1 << 7;
        else this.flags &= ~(1 << 7);
    }
    get flagN () {
        return (this.flags & 0b10000000) > 0;
    }
    set flagV (value: boolean) {
        if (value) this.flags |= 1 << 6;
        else this.flags &= ~(1 << 6);
    }
    get flagV () {
        return (this.flags & 0b01000000) > 0;
    }
    set flagB (value: boolean) {
        if (value) this.flags |= 1 << 4;
        else this.flags &= ~(1 << 4);
    }
    get flagB () {
        return (this.flags & 0b00010000) > 0;
    }
    set flagD (value: boolean) {
        if (value) this.flags |= 1 << 3;
        else this.flags &= ~(1 << 3);
    }
    get flagD () {
        return (this.flags & 0b00001000) > 0;
    }
    set flagI (value: boolean) {
        if (value) this.flags |= 1 << 2;
        else this.flags &= ~(1 << 2);
    }
    get flagI () {
        return (this.flags & 0b00000100) > 0;
    }
    set flagZ (value: boolean) {
        if (value) this.flags |= 1 << 1;
        else this.flags &= ~(1 << 1);
    }
    get flagZ () {
        return (this.flags & 0b00000010) > 0;
    }
    set flagC (value: boolean) {
        if (value) this.flags |= 1 << 0;
        else this.flags &= ~(1 << 0);
    }
    get flagC () {
        return (this.flags & 0b00000001) > 0;
    }

    flags: uint_8t = 0;
    run () {
        /* if (this.PC > 0x8050) {
            debugger
        } */
        const inst = this.bus.read(this.PC);
        switch (inst) {
            case 0xff:
                this.RTI()
                break;
            case 0x78:
                this.flagI = true;
                this.PC++;
                break;
            case 0x58:
                this.flagI = false;
                this.PC++;
                break;
            case 0xa2:
                this.LDXImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xa6:
                this.LDXZP(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xa9:
                this.LDAImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xad:
                this.LDAAbsolute(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xbd:
                this.LDAAbsoluteIndexX(
                    this.bus.read(++this.PC),
                    this.bus.read(++this.PC)
                );
                this.PC++;
                break;
            case 0xb1:
                this.LDAInderectZPIndexY(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xa0:
                this.LDYImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x8e:
                this.STXAbsolute(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x8d:
                this.STAAbsolute(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x95:
                this.STAIndexXZP(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x9d:
                this.STAIndexX(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x99:
                this.STAIndexY(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x85:
                this.STAZP(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x86:
                this.STXZP(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x9a:
                this.TSX();
                this.PC++;
                break;
            case 0xa8:
                this.TAY();
                this.PC++;
                break;
            case 0xe6:
                this.INC(this.bus.read(++this.PC));
                this.PC++;
                break;
                case 0xeE:
                    this.INCAbsolute(this.bus.read(++this.PC), this.bus.read(++this.PC));
                    this.PC++;
                    break;    
            case 0xe8:
                this.INX();
                this.PC++;
                break;
            case 0xc8:
                this.INY();
                this.PC++;
                break;
            case 0xca:
                this.DEX();
                this.PC++;
                break;
            case 0x20:
                this.JSR(this.bus.read(++this.PC), this.bus.read(++this.PC));
                break;
            case 0x2c:
                this.BIT(this.bus.read(++this.PC), this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xe0:
                this.CPX(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xc9:
                this.CMPImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xc0:
                this.CMYImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0xE0:
                this.CMXImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x10:
                this.BPL(this.bus.read(++this.PC));
                break;
            case 0x60:
                this.RTS();
                this.PC++;
                break;
            case 0x8a:
                this.TXA();
                this.PC++;
                break;
            case 0xaa:
                this.TAX();
                this.PC++;
                break;
            case 0xd0:
                this.BNE(this.bus.read(++this.PC));

                break;
            case 0xf0:
                this.BEQ(this.bus.read(++this.PC));
                break;
            case 0x4c:
                this.JMPAbsolute(this.bus.read(++this.PC), this.bus.read(++this.PC));
                break;
            case 0x55:
                this.EORZpX(this.bus.read(++this.PC));
                break;
            case 0x0a:
                this.ASLToA();
                this.PC++;
                break;
            case 0x48:
                this.PSHA();
                this.PC++;
                break;
            case 0x68:
                this.PLA();
                this.PC++;
                break;
            case 0xd8:
                this.flagD = false;
                this.PC++;
                break;
            case 0x18:
                this.flagC = false;
                this.PC++;
                break;
            case 0x65:
                this.ADCwithCarry(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x6d:
                this.ADCwithCarryAbsolute(
                    this.bus.read(++this.PC),
                    this.bus.read(++this.PC)
                );
                this.PC++;
                break;
            case 0x29:
                this.ANDImmediate(this.bus.read(++this.PC));
                this.PC++;
                break;
            case 0x00:
                this.IRQ();
                break;
            case 0x40:
                this.RTI();
                break;
            default:
                console.log("ERRoR");

                console.log(`0x${this.PC.toString(16).toUpperCase()}`);
                console.log(`0x${this.bus.read(this.PC).toString(16).toUpperCase()}`);
                throw `undefined OP 0x${inst.toString(16).toUpperCase()}`;
        }
    }
    LDXImmediate (value: uint_8t) {
        this.X = value;
        this.flagZ = this.X == 0;
        this.flagN = (this.X & 0b10000000) > 0;
    }
    LDXZP (addr: uint_8t) {
        this.X = this.bus.read(addr);
        this.flagZ = this.X == 0;
        this.flagN = (this.X & 0b10000000) > 0;
    }
    LDAImmediate (value: uint_8t) {
        this.A = value;
        this.flagZ = this.A == 0;
        this.flagN = (this.A & 0b10000000) > 0;
    }
    LDYImmediate (value: uint_8t) {
        this.Y = value;
        this.flagZ = this.Y == 0;
        this.flagN = (this.Y & 0b10000000) > 0;
    }
    LDAAbsolute (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.A = this.bus.read(addr);
        this.flagZ = this.A == 0;
        this.flagN = (this.A & 0b10000000) > 0;
    }
    LDAAbsoluteIndexX (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.A = this.bus.read(addr + this.X);
        this.flagZ = this.A == 0;
        this.flagN = (this.A & 0b10000000) > 0;
    }
    LDAInderectZPIndexY (addr: uint_8t) {
        const addr1 = this.bus.read(addr);
        const addr2 = this.bus.read(addr + 1);
        const addr3 = addr1 + (addr2 << 8);
        this.A = this.bus.read(addr3 + this.Y);
        this.flagZ = this.A == 0;
        this.flagN = (this.A & 0b10000000) > 0;
    }
    STXAbsolute (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.bus.write(addr, this.X);
    }
    STXZP (addr: uint_8t) {
        this.bus.write(addr, this.X);
    }
    STAIndexX (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.bus.write(addr + this.X, this.A);
    }
    STAIndexY (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.bus.write(addr + this.X, this.A);
    }
    STAIndexXZP (addr: uint_8t) {
        this.bus.write(addr + this.X, this.A);
    }
    STAAbsolute (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.bus.write(addr, this.A);
    }
    STAZP (addr: uint_8t) {
        this.bus.write(addr, this.A);
    }
    TSX () {
        this.X = this.SP;
        this.flagZ = this.X == 0;
        this.flagN = (this.X & 0b10000000) > 0;
    }
    TXA () {
        this.A = this.X;
    }
    TAY () {
        this.Y = this.A;
    }
    TAX () {
        this.Y = this.A;
    }
    INX () {
        this.X++;
        this.X &= 255;
        this.flagN = (this.X & 0b10000000) > 0;
        this.flagZ = this.X == 0;
    }
    DEX () {
        this.X--;
        this.X &= 255;
        this.flagN = (this.X & 0b10000000) > 0;
        this.flagZ = this.X == 0;
    }
    INC (addr: uint_8t) {
        const value = this.bus.read(addr);
        this.bus.write(addr, (value + 1) & 255);
        this.flagN = (this.bus.read(addr) & 0b10000000) > 0;
        this.flagZ = this.bus.read(addr) == 0;
    }
    INCAbsolute(addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        const value = this.bus.read(addr);
        this.bus.write(addr, (value + 1) & 255);
        this.flagN = (this.bus.read(addr) & 0b10000000) > 0;
        this.flagZ = this.bus.read(addr) == 0;
    }
    INY () {
        this.Y++;
        this.Y &= 255;
        this.flagN = (this.Y & 0b10000000) > 0;
        this.flagZ = this.Y == 0;
    }
    EORZpX (addr: uint_8t) {
        const addr1 = this.bus.read(addr);
        this.A ^= this.bus.read(addr1 + this.Y);
        this.flagN = (this.A & 0b10000000) > 0;
        this.flagZ = this.A == 0;
    }
    JSR (addr1: uint_8t, addr2: uint_8t) {
        this.bus.write(this.SP, (this.PC & 0b1111111100000000) >> 8);
        this.bus.write(--this.SP, this.PC & 0b0000000011111111);
        this.SP--;
        this.SP &= 0x1ff;
        const addr = addr1 + (addr2 << 8);
        this.PC = addr;
    }
    RTS () {
        ++this.SP;
        this.SP &= 0x1ff;
        const addr1 = this.bus.read(this.SP);
        ++this.SP;
        this.SP &= 0x1ff;
        const addr2 = this.bus.read(this.SP);
        const addr = addr1 + (addr2 << 8);
        this.PC = addr;
    }
    BIT (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        const result = this.A & this.bus.read(addr);
        if (result == 0) this.flagZ = true;
        this.flagN = (result & 0b10000000) > 0;
        this.flagV = (result & 0b01000000) > 0;
    }
    BPL (value: uint_8t) {
        if (this.flagN) {
            this.PC++;
        } else {
            value = value & 255;
            if (value >> 7) {
                value = ~value & 255;
                this.PC -= value;
            } else {
                this.PC += value + 1;
            }
        }
    }
    BNE (value: uint_8t) {
        if (this.flagZ) {
            this.PC++;
        } else {
            value = value & 255;
            if (value >> 7) {
                value = ~value & 255;
                this.PC -= value;
            } else {
                this.PC += value + 1;
            }
        }
    }
    BEQ (value: uint_8t) {
        if (!this.flagZ) {
            this.PC++;
        } else {
            value = value & 255;
            if (value >> 7) {
                value = ~value & 255;
                this.PC -= value;
            } else {
                this.PC += value + 1;
            }
        }
    }
    JMPAbsolute (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        this.PC = addr;
    }
    ASLToA () {
        this.A << 1;
        this.flagC = (this.A & 0xff00) > 0;
        this.flagZ = (this.A & 0x00ff) == 0x00;
        this.flagN = (this.A & 0b10000000) > 0;
    }
    PSHA () {
        this.SP--;
        this.SP &= 0x1ff;
        this.bus.write(this.SP, this.A);
    }
    PLA () {
        this.SP++;
        this.SP &= 0x1ff;
        this.A = this.bus.read(this.SP);
        this.flagN = (this.A & 0b10000000) > 0;
        this.flagZ = this.A == 0;
    }
    CPX (value: uint_8t) {
        if (this.X < value) this.flagN = true;
        else this.flagN = false;
        if (this.X == value) this.flagZ = true;
        else this.flagZ = false;
        if (this.X >= value) this.flagC = true;
        else this.flagC = false;
    }
    CMPImmediate (value: uint_8t) {
        if (this.A < value) this.flagN = true;
        else this.flagN = false;
        if (this.A == value) this.flagZ = true;
        else this.flagZ = false;
        if (this.A >= value) this.flagC = true;
        else this.flagC = false;
    }
    CMXImmediate (value: uint_8t) {
        if (this.X < value) this.flagN = true;
        else this.flagN = false;
        if (this.X == value) this.flagZ = true;
        else this.flagZ = false;
        if (this.X >= value) this.flagC = true;
        else this.flagC = false;
    }
    CMYImmediate (value: uint_8t) {
        if (this.Y < value) this.flagN = true;
        else this.flagN = false;
        if (this.Y == value) this.flagZ = true;
        else this.flagZ = false;
        if (this.Y >= value) this.flagC = true;
        else this.flagC = false;
    }
    ADCwithCarry (addr: uint_8t) {
        let temp = this.bus.read(addr) + this.A;
        if (this.flagC) temp += 1;

        this.flagC = temp > 255;
        this.flagZ = temp === 0;
        this.flagN = (this.A & 0b10000000) > 0;
        this.flagV = !(~(this.A ^ this.bus.read(addr)) & (this.A ^ temp) & 0x0080);

        this.A = temp;
    }
    ADCwithCarryAbsolute (addr1: uint_8t, addr2: uint_8t) {
        const addr = addr1 + (addr2 << 8);
        let temp = this.bus.read(addr) + this.A;
        if (this.flagC) temp += 1;
        this.flagC = temp > 255;
        this.flagZ = temp === 0;
        this.flagN = (this.A & 0b10000000) > 0;
        this.flagV = !(~(this.A ^ this.bus.read(addr)) & (this.A ^ temp) & 0x0080);

        this.A = temp;
    }
    ANDImmediate (value: uint_8t) {
        this.A = this.A & value;
    }
    RTI () {
        this.flags = this.bus.read(++this.SP);
        this.flagB = false;
        this.flagI = false;
        const addr = this.bus.read(++this.SP) + (this.bus.read(++this.SP) << 8);
        this.PC = addr;
    }
    IRQ () {
        const addr = this.bus.read(0xfffe) + (this.bus.read(0xffff) << 8);
        this.SP &= 0x1ff;
        this.bus.write(this.SP, (this.PC & 0b1111111100000000) >> 8);
        this.SP &= 0x1ff;
        this.bus.write(--this.SP, this.PC & 0b0000000011111111);
        this.SP &= 0x1ff;
        this.flagB = true;
        this.bus.write(--this.SP, this.flags);
        this.flagB = false;
        this.SP &= 0x1ff;
        this.SP--;
        this.SP &= 0x1ff;
        this.PC = addr;
    }
    reset () {
        const addr = this.bus.read(0xfffc) + (this.bus.read(0xfffd) << 8);
        this.bus.write(this.SP, (this.PC & 0b1111111100000000) >> 8);
        this.bus.write(--this.SP, this.PC & 0b0000000011111111);
        this.bus.write(--this.SP, this.flags);
        this.SP--;
        this.SP &= 0x1ff;
        this.PC = addr;
        this.SP = 0x1fa;
    }
    NMI () {
        this.bus.write(this.SP, (this.PC & 0b1111111100000000) >> 8);
        this.bus.write(--this.SP, this.PC & 0b0000000011111111);
        this.flagB = false;
        this.flagV = true;
        this.flagI = true;
        this.bus.write(--this.SP, this.flags);
        this.SP--;
        this.SP &= 0x1ff;
        const addr = this.bus.read(0xfffa) + (this.bus.read(0xfffb) << 8);
        this.PC = addr;
    }
}
