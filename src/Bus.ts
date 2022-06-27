import GamePad from "./Gamepad";
import MOS6502 from "./MOS6502";
import PPU from "./PPU";
import { uint_8t } from "./types";

export default class Bus {
    memory = new Uint8Array(0x1ffff);
    nSystemClockCounter: number = 0;
    dma_page: uint_8t = 0x00;
	dma_addr: uint_8t = 0x00;
	dma_data: uint_8t = 0x00;
    dma_dummy = true;
	dma_transfer = false;
    cpu!: MOS6502;
    constructor(public ppu: PPU, public joy1: GamePad, public joy2: GamePad) { }
    read (addr: uint_8t): uint_8t {
        if (addr >= 0x2000 && addr <= 0x3FFF)
        {
            //return this.ppu.memory[addr & 0x0007]
           // data = ppu.cpuRead(addr & 0x0007, bReadOnly);
        }
        if (addr == 0x2000) {
            //debugger;
        }
        if (addr == 0x2001) {
            //debugger;
        }
        if (addr == 0x2002) return this.ppu.readStatus();
        if (addr == 0x2003) {
            //debugger;
        }
        if (addr == 0x2004) {
            //debugger;
        }
        if (addr == 0x2005) {
            //debugger;
        }
        if (addr == 0x2006) {
            //debugger;
        }
        if (addr == 0x2007) {
            //debugger;
        }
        if (addr >= 0x4000 && addr <= 0x400f) {
            //debugger
        }
        if (addr >= 0x4010 && addr <= 0x4013) {
            //debugger
        }
        if (addr == 0x4014) {
            //debugger
        }
        if (addr == 0x4015) {
            //debugger
        }
        if (addr == 0x4016) {
            return this.joy1.read();
        }
        if (addr == 0x4017) {
            return this.joy2.read();
        }
        return this.memory[addr];
    }
    write (addr: uint_8t, value: uint_8t) {
        if (addr == 0x2000) {
            this.ppu.PPUCTRL = value;
            console.log("PPUCRTL write", value);
        }
        if (addr == 0x2001) {
            this.ppu.PPUMASK = value;
        }
        if (addr == 0x2002) {
            debugger;
        }
        if (addr == 0x2003) {
            debugger;
        }
        if (addr == 0x2004) {
            debugger;
        }
        if (addr == 0x2005) {
            this.ppu.writeScroll(value);
        }
        if (addr == 0x2006) {
            this.ppu.writeAddresPointer(value);
        }
        if (addr == 0x2007) {
            this.ppu.writeData(value);
        }
        if (addr >= 0x4000 && addr <= 0x400f) {
            //debugger
        }
        if (addr >= 0x4010 && addr <= 0x4013) {
            //debugger
        }
        if (addr == 0x4014) {
            //debugger
            this.dma_page = value&0xFF;
            this.dma_addr = 0x00;
            this.dma_transfer = true;						
        }
        if (addr == 0x4015) {
            //debugger
        }
        if (addr == 0x4016) {
            //debugger
        }
        if (addr == 0x4017) {
            //debugger
        }
        this.memory[addr] = value;
    }
    clock () {
        this.ppu.draw()

        if (this.nSystemClockCounter % 3 == 0) {
            // Is the system performing a DMA transfer form CPU memory to
            // OAM memory on PPU?...
            if (this.dma_transfer) {
                // ...Yes! We need to wait until the next even CPU clock cycle
                // before it starts...
                if (this.dma_dummy) {
                    // ...So hang around in here each clock until 1 or 2 cycles
                    // have elapsed...
                    if (this.nSystemClockCounter % 2 == 1) {
                        // ...and finally allow DMA to start
                        this.dma_dummy = false;
                    }
                } else {
                    // DMA can take place!
                    if (this.nSystemClockCounter % 2 == 0) {
                        // On even clock cycles, read from CPU bus
                        this.dma_data = this.read((this.dma_page << 8) | this.dma_addr);
                    } else {
                        // On odd clock cycles, write to PPU OAM
                        this.ppu.OAM[this.dma_addr] = this.dma_data;
                        
                        // Increment the lo byte of the address
                        this.dma_addr++;
                        this.dma_addr &= 0xff
                        // If this wraps around, we know that 256
                        // bytes have been written, so end the DMA
                        // transfer, and proceed as normal
                        if (this.dma_addr == 0x00) {
                            this.dma_transfer = false;
                            this.dma_dummy = true;
                        }
                    }
                }
            } else {
                // No DMA happening, the CPU is in control of its
                // own destiny. Go forth my friend and calculate
                // awesomeness for many generations to come...
                //console.log("run");
                
                this.cpu.run();
            }
        }
        
        this.nSystemClockCounter++
    }
}
