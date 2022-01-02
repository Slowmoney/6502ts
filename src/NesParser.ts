export default class NesParcer{
    constructor(private data: Uint8Array){

    }
    get header(){
        return this.data.subarray(0, 16)
    }
    get headerStr(){
        return  String.fromCharCode(...this.header)
    }
    get sizePRGROM(){
        return this.header[4]*16384
    }
    get sizeCHRROM(){
        return this.header[5]*8192
    }
    get flags6(){
        return this.header.at(6)
    }
    get flags7(){
        return this.header.at(7)
    }
    get PRGROM(){
        return this.data.subarray(16, this.sizePRGROM+16)
    }
    get CHRROM(){
        return this.data.subarray(this.sizePRGROM+16, this.sizeCHRROM+this.sizePRGROM+16)
    }
}