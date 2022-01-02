import PPU from "./PPU";
import { uint_8t } from "./types";

export default class Bus {
    memory = new Uint8Array(0x1ffff)
    constructor(public ppu: PPU) {
        
    }
    read(addr: uint_8t): uint_8t{
        if(addr == 0x2000){
            debugger
        }
        if(addr == 0x2001){
            debugger
        }
        if(addr == 0x2002) return this.ppu.readStatus()
        if(addr == 0x2003){
            debugger
        }
        if(addr == 0x2004){
            debugger
        }
        if(addr == 0x2005){
            debugger
        }
        if(addr == 0x2006){
            debugger
        }
        if(addr == 0x2007){
            debugger
        }
        if(addr >= 0x4000 && addr <= 0x400f){
            //debugger
        }
        if(addr >= 0x4010 && addr <= 0x4013){
            //debugger
        }
        if(addr == 0x4014){
            debugger
        }
        if(addr == 0x4015){
            //debugger
        }
        if(addr == 0x4016){
            //debugger
        }
        if(addr == 0x4017){
            //debugger
        }
        return this.memory[addr]
    }
    write(addr: uint_8t, value: uint_8t){
        if(addr == 0x2000){
            this.ppu.control0 = value
        }
        if(addr == 0x2001){
            this.ppu.control1 = value
        }
        if(addr == 0x2002) {
            debugger
        }
        if(addr == 0x2003){
            debugger
        }
        if(addr == 0x2004){
            debugger
        }
        if(addr == 0x2005){
            this.ppu.writeScroll(value)
        }
        if(addr == 0x2006){
            this.ppu.writeAddresPointer(value)
        }
        if(addr == 0x2007){
            this.ppu.writeData(value)
        }
        if(addr >= 0x4000 && addr <= 0x400f){
            //debugger
        }
        if(addr >= 0x4010 && addr <= 0x4013){
            //debugger
        }
        if(addr == 0x4014){
            //debugger
        }
        if(addr == 0x4015){
            //debugger
        }
        if(addr == 0x4016){
            //debugger
        }
        if(addr == 0x4017){
            //debugger
        }
        this.memory[addr] = value
    }
}