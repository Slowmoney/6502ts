NES Disassembler v1.0 beta4 (16/8-2002)
-------------------------------------
Written by: Morgan Johansson (morjoh@telia.com)
USE THIS PROGRAM AT YOUR OWN RISK!

./assets/rom.data
Mapper: 0  Current PRG-ROM: 0(2) 

		ldy #$10
lbl_8002:	ldy ($14),y
		bne lbl_8010
		lda $bf
		sta ($14),y
		lda $fe
		ora #$2
		sta $fe
lbl_8010:	rts
;--------------------
		lda $4b0
		bne lbl_8017
		rts
;--------------------
lbl_8017:	cmp #$1
		bne lbl_808f
		lda #$40
		sta $14
		lda #$3
		sta $15
		lda #$20
		sta $12
		lda #$0
		sta $13
		lda #$a
		sta $33
		ldx #$0
		lda #$30
		sta $11
lbl_8035:	ldy #$0
lbl_8037:	lda $841e,y
		cpy #$a
		bne lbl_804a
		lda $11
		pha
		clc
		adc #$10
		sta $11
		pla
		jmp lbl_8063
;--------------------
lbl_804a:	cpy #$9
		bne lbl_8053
		lda $843e,x
		bne lbl_8063
lbl_8053:	cpy #$8
		bne lbl_805c
		lda $843f,x
		bne lbl_8063
lbl_805c:	cpy #$4
		bne lbl_8063
		lda $8440,x
lbl_8063:	sta ($14),y
		iny
		cpy #$20
		bne lbl_8037
		inx
		inx
		inx
		jsr lbl_c90a
		dec $33
		bne lbl_8035
		lda #$0
		sta $4b5
		sta $4b6
		lda #$40
		sta $4b3
		lda #$1
		sta $4b2
		lda #$a
		sta $4bc
		inc $4b0
		rts
;--------------------
lbl_808f:	lda $4b2
		bne lbl_80d2
		lda $4b1
		bne lbl_80b4
lbl_8099:	lda #$1
		sta $51
		lda #$0
		sta $4b0
		sta $fc
		sta $4b4
		lda #$10
		sta $2d
		lda #$6
		sta $3b
		lda #$9
		sta $40
		rts
;--------------------
lbl_80b4:	sta $3
		cmp #$18
		beq lbl_80be
		cmp #$13
		bne lbl_80c2
lbl_80be:	lda #$4
		sta $fc
lbl_80c2:	lda #$1
		sec
		jsr lbl_d9d6
		sta $4b1
		lda #$9
		sta $4b2
		bne lbl_80da
lbl_80d2:	dec $4b3,x
		bne lbl_8114
		dec $4b2,x
lbl_80da:	lda #$5
		sta $4b3
		lda #$14
		sta $540
		lda $4b1
		lsr a
		lsr a
		lsr a
		lsr a
		sta $541
		lda $4b1
		and #$f
		sta $542
		lda #$66
		sta $543
		lda $4b2
		sta $544
		lda #$ae
		sta $0
		lda #$20
		sta $1
		lda #$40
		sta $2
		lda #$5
		sta $3
		jsr lbl_c9c2
lbl_8114:	ldx #$40
		ldy #$3
		lda $2f
		lsr a
		bcc lbl_8121
		ldx #$e0
		ldy #$3
lbl_8121:	stx $a0
		sty $a1
		lda #$5
		sta $33
		lda #$0
		sta $a2
lbl_812d:	jsr lbl_c72b
		lda $b0
		beq lbl_8149
		lda $c0
		bne lbl_8159
		lda $b3
		bne lbl_8146
		lda $b2
		sta $b3
		jsr lbl_ca2b
lbl_8143:	jsr lbl_c754
lbl_8146:	jsr lbl_c746
lbl_8149:	jsr lbl_c73e
		dec $33
		bne lbl_812d
		lda $4bc
		bne lbl_8158
		jmp lbl_8099
;--------------------
lbl_8158:	rts
;--------------------
lbl_8159:	cmp #$8
		beq lbl_8184
		cmp #$1
		bne lbl_8166
		inc $4b5
		bne lbl_8169
lbl_8166:	inc $4b6
lbl_8169:	lda #$c3
		sta $bc
		lda #$a2
		sta $bd
		lda #$7
		sta $b5
		ldy #$2
		jsr lbl_e31f
		lda #$8
		sta $c0
		lda #$33
		sta $b6
		bne lbl_8146
lbl_8184:	jsr lbl_c84d
		cmp #$cc
		beq lbl_8195
		cmp #$dd
		beq lbl_81a6
		cmp #$ee
		beq lbl_81ae
		bne lbl_8143
lbl_8195:	jsr lbl_c84d
		sta $b5
		cmp #$5
		bne lbl_8184
		ldy #$4
		jsr lbl_e31f
		jmp lbl_8184
;--------------------
lbl_81a6:	jsr lbl_c84d
		sta $b6
		jmp lbl_8143
;--------------------
lbl_81ae:	dec $4bc,x
		ldy #$4
		jsr lbl_e31f
		jmp lbl_8149
;--------------------
		lda #$1
		sta $3f
		jsr lbl_ca8f
		jsr lbl_c550
		jsr lbl_c5e0
		jsr lbl_c5b6
		jsr lbl_e56c
		jsr lbl_e5b6
		jsr lbl_e58a
		jsr lbl_e590
		jsr lbl_ca9a
		lda #$0
		sta $4ba
		sta $2b
		inc $4b4
lbl_81e2:	rts
;--------------------
		lda $2b
		bne lbl_81e2
		lda $4ba
		jsr lbl_c8f4
		dc.b $73	;?
		dc.b $82	;?
		dc.b $27	;?
		dc.b $83	;?
		cmp #$83
		lda $2b
		bne lbl_81e2
		lda $4ba
		jsr lbl_c8f4
		lda $9f82
		dc.b $83	;?
		ora ($84),y
		lda $4b5
		clc
		adc $4b6
		ldx #$18
		ldy #$83
		cmp #$a
		bne lbl_825f
		ldx #$6
		ldy #$83
		lda $41
		cmp #$8
		bcs lbl_8224
		ldx #$f
		ldy #$83
		lda #$30
		bne lbl_8226
lbl_8224:	lda #$50
lbl_8226:	sta $1e
		stx $2
		sty $3
		lda #$d0
		sta $0
		lda #$22
		sta $1
		jsr lbl_c9c2
		lda $1e
		sta $0
		lda $4a
		bne lbl_8246
		lda #$8
		sta $1
		jsr lbl_e1db
lbl_8246:	lda $4e
		bne lbl_8255
		lda $1e
		sta $0
		lda #$9
		sta $1
		jsr lbl_e1db
lbl_8255:	ldx #$fd
		ldy #$82
		lda $fd
		ora #$4
		sta $fd
lbl_825f:	lda #$c7
		sta $0
		lda #$22
		sta $1
		stx $2
		sty $3
		jsr lbl_c9c2
		lda #$10
		jmp lbl_c34a
;--------------------
		lda $4a
		beq lbl_827b
lbl_8277:	inc $4b4
		rts
;--------------------
lbl_827b:	lda #$17
		sta $1e
		lda #$27
		sta $0
		lda #$21
		ldx #$c1
		ldy #$82
lbl_8289:	sta $1
		stx $2
		sty $3
		jsr lbl_c9c2
		ldx $1e
		ldy #$17
lbl_8296:	lda $82cd,x
		sta $200,x
		dex
		dey
		bpl lbl_8296
		inc $4ba
		lda #$0
		sta $4bb
		lda #$10
		sta $2b
		rts
;--------------------
		lda $4e
		bne lbl_8277
		lda #$2f
		sta $1e
		lda #$7
		sta $0
		lda #$22
		ldx #$c7
		ldy #$82
		bne lbl_8289
		ora $16,x
		asl a
		dc.b $1b	;?
		dc.b $12	;?
		clc
		ora $15,x
		asl $1012,x
		dc.b $12	;?
lbl_82cd:	rti
;--------------------
		ora ($40,x)
		jsr lbl_40
		rti
;--------------------
		plp
		pha
		ora ($40),y
		jsr lbl_1048
		rti
;--------------------
		plp
		bvc lbl_82f2
		rti
;--------------------
		jsr lbl_1250
		rti
;--------------------
		plp
		sei
		ora ($41,x)
		jsr lbl_78
		eor ($28,x)
		dc.b $80	;?
		ora ($41),y
		jsr lbl_1080
		eor ($28,x)
		dey
		dc.b $13	;?
		eor ($20,x)
		dey
		dc.b $12	;?
		eor ($28,x)
		clc
		dc.b $19	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $f	;?
		dc.b $e	;?
		dc.b $c	;?
		dc.b $1d	;?
		dc.b $67	;?
		clc
		ora $0
		brk
		brk
		dc.b $19	;?
		dc.b $1d	;?
		dc.b $1c	;?
		adc $18
		dc.b $3	;?
		brk
		brk
		brk
		dc.b $19	;?
		dc.b $1d	;?
		dc.b $1c	;?
		adc $1e
		bit $24
		bit $24
		bit $17
		clc
		bit $b
		clc
		dc.b $17	;?
		asl $261c,x
		lda $4b5
		beq lbl_8392
		cmp $4bb
		beq lbl_838a
		lda $4bb
		asl a
		asl a
		asl a
		tax
		ldy #$41
		lda $4b5
		cmp #$6
		lda $4bb
		bcc lbl_834f
		ldy #$38
		cmp #$5
		bcc lbl_834f
		ldy #$4a
lbl_834c:	sec
		sbc #$5
lbl_834f:	sty $1e
		asl a
		asl a
		sta $1f
		asl a
		clc
		adc $1f
		adc #$70
		sta $233,x
		sta $237,x
		lda #$2
		sta $232,x
		sta $236,x
		lda #$cc
		sta $231,x
		lda #$cd
		sta $235,x
		lda $1e
		sta $230,x
		clc
		adc #$8
		sta $234,x
		inc $4bb
		lda #$a
		sta $2b
		lda #$20
		sta $fd
		rts
;--------------------
lbl_838a:	inc $4ba
		lda #$10
		sta $2b
		rts
;--------------------
lbl_8392:	lda #$0
		sta $4ba
		inc $4b4
		lda #$10
		sta $2b
		rts
;--------------------
		lda $4b6
		beq lbl_8392
		cmp $4bb
		beq lbl_838a
		lda $4bb
		asl a
		asl a
		asl a
		clc
		adc #$50
		tax
		ldy #$79
		lda $4b6
		cmp #$6
		lda $4bb
		bcc lbl_834f
		ldy #$70
		cmp #$5
		bcc lbl_834f
		ldy #$82
		bcs lbl_834c
		lda #$0
		sta $1f
		ldx #$37
		ldy #$21
		lda $4b5
lbl_83d4:	sta $1e
		stx $0
		sty $1
		lda #$5c
		sta $2
		lda #$84
		sta $3
		jsr lbl_c9c2
		lda #$0
		sta $4
		sta $5
		sta $7
		ldy #$8
		sty $3
lbl_83f1:	clc
		jsr lbl_d9b5
		bcc lbl_83f9
		inc $5
lbl_83f9:	dec $1e
		bne lbl_83f1
		sta $6
		lda $1f
		jsr lbl_d930
		lda #$20
		sta $2b
		lda #$0
		sta $4ba
		inc $4b4
		rts
;--------------------
		lda #$1
		sta $1f
		ldx #$17
		ldy #$22
		lda $4b6
		bne lbl_83d4
lbl_841e:	ora ($1,x)
		dc.b $3	;?
		brk
		and ($%),y
		bmi $8428
		brk
		brk
lbl_8428:	brk
		brk
		brk
		brk
		brk
		beq lbl_842f
lbl_842f:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $f	;?
		dc.b $f	;?
lbl_843e:	sec
lbl_843f:	bit $31
		iny
		bit $33
		clc
		dc.b $5a	;?
		dc.b $32	;?
		bit $355a
		dc.b $d4	;?
		dc.b $5a	;?
		and $e8,x
		dc.b $5a	;?
		dc.b $32	;?
		rts
;--------------------
		txa
		dc.b $34	;?
		ldy #$8a
		dc.b $33	;?
		plp
		dc.b $ba	;?
		dc.b $32	;?
		cld
		dc.b $ba	;?
		and $15,x
		and ($24,x)
		dc.b $8	;?
		brk
		brk
lbl_8462:	lda $4d0
		beq lbl_846a
		dec $4d0,x
lbl_846a:	lda $4d2
		beq lbl_8472
		dec $4d2,x
lbl_8472:	inc $27
		lda $27
		cmp #$3e
		bcc lbl_8496
		lda #$0
		sta $27
		lda $4f3
		beq lbl_8486
		dec $4f3,x
lbl_8486:	lda $4fc
		beq lbl_848e
		dec $4fc,x
lbl_848e:	lda $4ff
		beq lbl_8496
		dec $4ff,x
lbl_8496:	rts
;--------------------
lbl_8497:	lda $300
		beq lbl_84c1
		lda $316
		bne lbl_84c1
		ldx #$0
		lda $30e
lbl_84a6:	cmp $4f6,x
		bne lbl_84c2
		inc $4f7,x
		ldy #$f0
		lda $3a
		beq lbl_84b6
		ldy #$3e
lbl_84b6:	tya
		cmp $4f7,x
		bcs lbl_84c1
		lda #$1
		sta $4f8,x
lbl_84c1:	rts
;--------------------
lbl_84c2:	sta $4f6,x
		lda #$0
		sta $4f7,x
		rts
;--------------------
lbl_84cb:	lda $320
		beq lbl_84c1
		lda $336
		bne lbl_84c1
		lda $32e
		ldx #$3
		bne lbl_84a6
lbl_84dc:	ldx #$3
		ldy #$0
lbl_84e0:	lda $4ac,x
		sta $4a8,x
		tya
		sta $4ac,x
		dex
		bpl lbl_84e0
		rts
;--------------------
lbl_84ee:	lda $4b0
		bne lbl_8505
		lda $4f3
		beq lbl_8506
		ldy $46
		beq lbl_8505
		cmp #$4
		bcc lbl_8505
		lda #$4
		sta $4f3
lbl_8505:	rts
;--------------------
lbl_8506:	lda $4be
		bne lbl_8516
		jsr lbl_8c8d
		jsr lbl_8726
		lda #$1
		sta $4be
lbl_8516:	jsr lbl_8497
		jsr lbl_84cb
		lda $430
		beq lbl_8524
		jmp lbl_85c8
;--------------------
lbl_8524:	lda $431
		beq lbl_852f
		dec $431,x
		jmp lbl_8562
;--------------------
lbl_852f:	lda $51
		bne lbl_8562
		lda $4f8
		bne lbl_8563
		lda $4fb
		bne lbl_85a7
lbl_853d:	lda #$1
		sta $b0
		lda $425
		sta $b5
		lda $426
		sta $b6
		lda $427
		sta $b7
		lda $428
		sta $b8
		lda $429
		sta $b9
		lda $42a
		sta $ba
		jsr lbl_c754
lbl_8562:	rts
;--------------------
lbl_8563:	ldx $30e
		lda $4a8,x
		cmp #$8
		bcs lbl_8562
		lda #$0
		sta $4f8
		sta $4f7
		stx $42e
		lda $9d3e,x
		sta $428
		lda $309
lbl_8581:	ldy #$18
		ldx #$1
		cmp #$80
		bcs lbl_858d
		ldy #$e8
		ldx #$2
lbl_858d:	sty $429
		stx $421
		lda #$1
		sta $430
		jsr lbl_86f3
		ldx #$a2
		ldy #$9c
lbl_859f:	stx $42c
		sty $42d
		bne lbl_8562
lbl_85a7:	ldx $32e
		lda $4a8,x
		cmp #$8
		bcs lbl_8562
		stx $42e
		lda $9d3e,x
		sta $428
		lda #$0
		sta $4fb
		sta $4fa
		lda $329
		jmp lbl_8581
;--------------------
lbl_85c8:	cmp #$1
		bne lbl_85f0
		jsr lbl_87af
		bcc lbl_85d4
		jmp lbl_86d8
;--------------------
lbl_85d4:	jsr lbl_875d
		cmp #$ff
		bne lbl_85e6
		lda #$10
		sta $430
lbl_85e0:	ldx #$d8
		ldy #$9c
		bne lbl_859f
lbl_85e6:	cmp #$0
		beq lbl_85ed
		sta $426
lbl_85ed:	jmp lbl_853d
;--------------------
lbl_85f0:	cmp #$2
		bne lbl_8644
		jsr lbl_875d
		cmp #$ff
		bne lbl_85e6
		jsr lbl_86f9
		ldy #$0
		sty $430
		dey
		lda $3a
		beq lbl_860a
		ldy #$80
lbl_860a:	sty $431
		lda #$f4
		sta $428
		ldx $42a
		sta $200,x
		sta $204,x
		sta $208,x
		sta $20c,x
		jmp lbl_8562
;--------------------
lbl_8624:	ldy $429
		ldx $428
		lda #$4
		jsr lbl_8ccc
		lda #$2
		sta $0
		ldx $9f
		lda #$1
		sta $9d,x
		txa
		ora #$8
		sta $1
		jsr lbl_e1db
lbl_8641:	jmp lbl_86d8
;--------------------
lbl_8644:	jsr lbl_87af
		bcs lbl_8641
		ldx $42e
		lda $4a8,x
		cmp #$9
		bcs lbl_8641
		lda $421
		lsr a
		bcs lbl_86aa
		lda $429
		cmp #$10
		bcs lbl_8663
		jmp lbl_86d8
;--------------------
lbl_8663:	jsr lbl_875d
		cmp #$aa
		bne lbl_866d
		jmp lbl_85e0
;--------------------
lbl_866d:	cmp #$bb
		bne lbl_867b
		jsr lbl_86e4
		bne lbl_8679
		jmp lbl_8624
;--------------------
lbl_8679:	lda #$0
lbl_867b:	dec $429,x
		ldx $722
		bne lbl_8686
		dec $429,x
lbl_8686:	clc
		adc $428
		sta $428
lbl_868d:	ldx $424
		lda $a496,x
		cmp #$ff
		bne lbl_86a1
		inx
		lda $a496,x
		sta $424
		jmp lbl_868d
;--------------------
lbl_86a1:	sta $426
		inc $424
		jmp lbl_853d
;--------------------
lbl_86aa:	lda $429
		cmp #$f4
		bcs lbl_86d8
		jsr lbl_875d
		cmp #$aa
		beq lbl_86c4
		cmp #$bb
		bne lbl_86c9
		jsr lbl_86e4
		bne lbl_86c7
		jmp lbl_8624
;--------------------
lbl_86c4:	jmp lbl_85e0
;--------------------
lbl_86c7:	lda #$0
lbl_86c9:	inc $429
		bne lbl_8686
		ldx $722
		beq lbl_86d8
		inc $429
		bne lbl_8686
lbl_86d8:	lda #$2
		sta $430
		ldx #$bd
		ldy #$9c
		jmp lbl_859f
;--------------------
lbl_86e4:	lda $428
		jsr lbl_8c85
		ldy $429
		jsr lbl_8a36
		ora #$0
		rts
;--------------------
lbl_86f3:	lda $fc
		ora #$8
		bne lbl_86fd
lbl_86f9:	lda $fc
		and #$f7
lbl_86fd:	sta $fc
		rts
;--------------------
		lda $4f3
		ldy $3a
		beq lbl_870a
		clc
		adc #$4
lbl_870a:	tax
		lda $9d1e,x
		sta $4f3
		lda $4fc
		sta $4fd
		cpy #$0
		beq lbl_871e
		clc
		adc #$4
lbl_871e:	tax
		lda $9d26,x
		sta $4fc
		rts
;--------------------
lbl_8726:	ldx #$1f
lbl_8728:	lda $9c5b,x
		sta $420,x
		dex
		bpl lbl_8728
		rts
;--------------------
lbl_8732:	ldx #$1f
lbl_8734:	lda $9c7b,x
		sta $340,x
		dex
		bpl lbl_8734
		rts
;--------------------
		ldy #$10
		ldy ($14),y
		cmp #$10
		bne lbl_875c
		lda #$2
		sta ($14),y
		ldy #$c
		lda #$bd
		sta ($14),y
		iny
		lda #$9c
		sta ($14),y
		lda #$1
		sta $c
		jmp lbl_e011
;--------------------
lbl_875c:	rts
;--------------------
lbl_875d:	lda #$0
		ldx $42c
		ldy $42d
		jsr lbl_8784
		cmp #$cc
		bne lbl_8772
		jsr lbl_86f3
		jmp lbl_875d
;--------------------
lbl_8772:	cmp #$dd
		bne lbl_875c
		jsr lbl_86f9
		jmp lbl_875d
;--------------------
lbl_877c:	lda #$1
		ldx $34c
		ldy $34d
lbl_8784:	sta $1e
		stx $14
		sty $15
		ldy #$0
		ldy ($14),y
		sty $13
		iny
		sty $12
		jsr lbl_c90a
		pha
		ldx $14
		ldy $15
		lda $1e
		bne lbl_87a7
		stx $42c
		sty $42d
		pla
		rts
;--------------------
lbl_87a7:	stx $34c
		sty $34d
		pla
		rts
;--------------------
lbl_87af:	lda $51
		bne lbl_87b9
		lda $71
		bne lbl_87b9
		clc
		rts
;--------------------
lbl_87b9:	sec
		rts
;--------------------
lbl_87bb:	lda $4b0
		beq lbl_87c1
lbl_87c0:	rts
;--------------------
lbl_87c1:	lda $4fc
		bne lbl_87c0
		lda $4bf
		bne lbl_87d6
		jsr lbl_8c8d
		jsr lbl_8732
		lda #$1
		sta $4bf
lbl_87d6:	lda $430
		bne lbl_87de
		jsr lbl_86f9
lbl_87de:	lda $350
		cmp #$10
		beq lbl_8821
		cmp #$1
		beq lbl_881b
		cmp #$2
		beq lbl_881e
		lda #$28
		sta $348
		lda #$50
		sta $349
		lda $342
		bne lbl_8803
		lda #$2
		sta $355
		bne lbl_8806
lbl_8803:	dec $342,x
lbl_8806:	jsr lbl_87af
		bcs lbl_881a
		lda #$1
		ldx #$a2
		ldy #$9c
lbl_8811:	sta $350
		stx $34c
		sty $34d
lbl_881a:	rts
;--------------------
lbl_881b:	jmp lbl_89c7
;--------------------
lbl_881e:	jmp lbl_89e3
;--------------------
lbl_8821:	jsr lbl_87af
		bcc lbl_8829
		jmp lbl_8998
;--------------------
lbl_8829:	lda $348
		cmp #$18
		bcs lbl_8847
		lda $4ff
		bne lbl_883f
		lda $348
		cmp #$c
		bcs lbl_8869
		jmp lbl_8998
;--------------------
lbl_883f:	lda #$1
lbl_8841:	sta $351
		jmp lbl_8869
;--------------------
lbl_8847:	cmp #$d4
		bcc lbl_884f
		lda #$0
		beq lbl_8841
lbl_884f:	lda $349
		cmp #$c
		bcs lbl_885d
		jsr lbl_8ca5
		lda #$0
		beq lbl_8866
lbl_885d:	cmp #$f8
		bcc lbl_886c
		jsr lbl_8cb5
		lda #$1
lbl_8866:	sta $341
lbl_8869:	jsr lbl_86f3
lbl_886c:	lda $34b
		beq lbl_8877
		dec $34b,x
		jmp lbl_8908
;--------------------
lbl_8877:	lda $35b
		jsr lbl_caf3
		cmp #$0
		bne lbl_8884
		jmp lbl_8908
;--------------------
lbl_8884:	cmp #$2
		bne lbl_88b9
		lda $348
		jsr lbl_8c85
		ldy $349
		jsr lbl_8a36
		ldy $349
		ldx $348
		lda #$6
		jsr lbl_8ccc
		lda #$1
		sta $728
		lda #$10
		sta $0
		ldx $9f
		lda #$1
		sta $9d,x
		txa
		ora #$8
		sta $1
		jsr lbl_e1db
		jmp lbl_8998
;--------------------
lbl_88b9:	jsr lbl_86f3
		jsr lbl_ca59
		and #$1
		clc
		adc $343
		sta $343
		lda #$8
		sta $34b
		ldx #$0
lbl_88cf:	lda $a153,x
		cmp $357
		bne lbl_88df
		lda $a154,x
		cmp $358
		beq lbl_88e7
lbl_88df:	inx
		inx
		cpx #$10
		bne lbl_88cf
		beq lbl_88f0
lbl_88e7:	cpx #$8
		bcc lbl_88fb
		lda $341
		beq lbl_8900
lbl_88f0:	lda $351
		eor #$1
		sta $351
		jmp lbl_8908
;--------------------
lbl_88fb:	lda $341
		beq lbl_88f0
lbl_8900:	lda $341
		eor #$1
		sta $341
lbl_8908:	ldy #$4
		lda $341
		beq lbl_8911
		ldy #$fc
lbl_8911:	tya
		clc
		adc $349
		sta $0
		ldy #$4
		lda $351
		bne lbl_8921
		ldy #$fc
lbl_8921:	tya
		clc
		adc $348
		sta $1
		jsr lbl_c631
		lda $0
		sta $358
		sta $528
		lda $1
		sta $357
		sta $529
		lda $343
		bne lbl_89a1
		lda $342
		sta $343
		lda $348
		ldy $351
		bne lbl_8955
		sec
		sbc $355
		jmp lbl_8959
;--------------------
lbl_8955:	clc
		adc $355
lbl_8959:	sta $348
		lda $341
		bne lbl_8970
		inc $349
		bne lbl_897b
		lda $722
		bne lbl_897b
		inc $349
		bne lbl_897b
lbl_8970:	dec $349,x
		lda $722
		bne lbl_897b
		dec $349,x
lbl_897b:	ldx $344
		lda $a496,x
		cmp #$ff
		bne lbl_898f
		inx
		lda $a496,x
		sta $344
		jmp lbl_897b
;--------------------
lbl_898f:	sta $346
		inc $344
		jmp lbl_89a1
;--------------------
lbl_8998:	lda #$2
		ldx #$bd
		ldy #$9c
		jmp lbl_8811
;--------------------
lbl_89a1:	lda #$1
		sta $b0
		lda $345
		sta $b5
		lda $346
		sta $b6
		lda $347
		sta $b7
		lda $348
		sta $b8
		lda $349
		sta $b9
		lda $34a
		sta $ba
		jsr lbl_c754
lbl_89c6:	rts
;--------------------
lbl_89c7:	jsr lbl_877c
		cmp #$ff
		beq lbl_89d8
lbl_89ce:	cmp #$0
		beq lbl_89c6
		sta $346
		jmp lbl_89a1
;--------------------
lbl_89d8:	lda #$10
		sta $350
		lda #$1e
		sta $4ff
		rts
;--------------------
lbl_89e3:	jsr lbl_877c
		cmp #$ff
		bne lbl_89ce
		ldx $34a
		lda #$f4
		sta $348
		sta $200,x
		sta $204,x
		sta $208,x
		sta $20c,x
		lda #$0
		sta $350
		lda $4fe
		cmp #$2
		beq lbl_8a10
		inc $4fe
		lda $4fe
lbl_8a10:	lsr a
		lsr a
		lsr a
		ldy $3a
		beq lbl_8a1a
		clc
		adc #$4
lbl_8a1a:	clc
		adc $4fd
		tax
		lda $728
		bne lbl_8a2b
		lda $9d26,x
		sta $4fc
		rts
;--------------------
lbl_8a2b:	lda #$3
		sta $4fc
		lda #$0
		sta $728
		rts
;--------------------
lbl_8a36:	lda #$0
		sta $9f
		sty $1f
		ldy #$0
lbl_8a3e:	lda $84,y
		beq lbl_8a60
		txa
		cmp $85,y
		bne lbl_8a60
		lda $1f
		sec
		sbc #$10
		cmp $86,y
		bcs lbl_8a60
		lda $1f
		clc
		adc #$10
		cmp $86,y
		bcc lbl_8a60
		lda #$0
		rts
;--------------------
lbl_8a60:	inc $9f
		ldy #$5
		lda $9f
		cmp #$2
		bne lbl_8a3e
		lda #$0
		sta $9f
		lda #$ff
		rts
;--------------------
		lda $4c0
		bne lbl_8a79
lbl_8a76:	jmp lbl_dcc9
;--------------------
lbl_8a79:	lda $4c1
		bne lbl_8a76
lbl_8a7e:	lda #$ff
		sta $4c2
		lda #$1
		sta $4c1
		ldy $ba
		ldx #$1f
lbl_8a8c:	lda $8a9b,x
		sta $b0,x
		dex
		bpl lbl_8a8c
		sty $ba
		ldy #$4
		jmp lbl_e31f
;--------------------
lbl_8a9b:	ora ($0,x)
		dc.b $2	;?
		brk
		sec
		ora $37
		dc.b $23	;?
		brk
		brk
		brk
		brk
		dc.b $47	;?
		ldx #$0
		dc.b $80	;?
		brk
		brk
		ora ($a,x)
		dc.b $2	;?
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dc.b $3	;?
lbl_8abb:	jmp lbl_d6e4
;--------------------
		lda $c0
		bne lbl_8abb
		lda $4c2
		beq lbl_8ae3
		dec $4c2,x
		bne lbl_8abb
		jsr lbl_ca59
		ldy #$1
		ldx #$f0
		and #$1
		beq lbl_8adb
		ldy #$2
		ldx #$10
lbl_8adb:	sty $c2
		sty $b1
		stx $b9
		bne lbl_8abb
lbl_8ae3:	lda $c1
		bne lbl_8b36
		lda $b1
		and #$c0
		bne lbl_8abb
		ldy $b9
		lda $be
		cmp #$1
		beq lbl_8b03
		cmp #$2
		bne lbl_8abb
		cpy #$80
		bne lbl_8abb
		lda #$0
		ldx #$0
		beq lbl_8b13
lbl_8b03:	lda #$9
		ldx #$1
		cpy #$30
		beq lbl_8b13
		cpy #$d0
		bne lbl_8abb
		lda #$10
		ldx #$2
lbl_8b13:	tay
		lda $4cd,x
		bne lbl_8abb
		lda #$1
		stx $4cc
		lda $734
		beq lbl_8b25
		ldy #$17
lbl_8b25:	tya
		sta $4c6
		lda #$0
		sta $4c5
		sta $b1
		lda #$80
		sta $c1
		bne lbl_8abb
lbl_8b36:	dec $c1
		beq lbl_8b76
		lda $c1
		ldy #$6a
		cmp #$20
		beq lbl_8b66
lbl_8b42:	cmp #$40
		bne lbl_8b73
		lda $b8
		clc
		adc #$7
		sta $2b0
		sta $2b4
		lda #$3
		sta $2b2
		sta $2b6
		lda $b9
		sta $2b7
		sec
		sbc #$8
		sta $2b3
		ldy #$68
lbl_8b66:	sty $2b1
		iny
		sty $2b5
		lda $fe
		ora #$4
		sta $fe
lbl_8b73:	jmp lbl_d6e4
;--------------------
lbl_8b76:	lda $21
		bne lbl_8bb1
		lda $75
		ora $7a
		bne lbl_8bb1
		sta $4ca
		ldy #$4
		jsr lbl_e31f
		jsr lbl_8d39
		lda #$1
		sta $4c5
		ldx $4cc
		sta $4cd,x
		lda $4cd
		and $4ce
		and $4cf
		bne lbl_8ba7
		jsr lbl_8a7e
		jmp lbl_8b73
;--------------------
lbl_8ba7:	lda #$0
		sta $4c0
		sta $b0
		jmp lbl_d782
;--------------------
lbl_8bb1:	inc $c1
		bne lbl_8b73
lbl_8bb5:	lda $4c5
		bne lbl_8bbb
		rts
;--------------------
lbl_8bbb:	lda $4ca
		beq lbl_8be9
		dec $4ca,x
		lda $2b3
		beq lbl_8be8
		cmp #$40
		beq lbl_8be8
		cmp #$a0
		beq lbl_8be8
		dec $2b3,x
		dec $2b3,x
		dec $2b7,x
		dec $2b7,x
		inc $2bb
		inc $2bb
		inc $2bf
		inc $2bf
lbl_8be8:	rts
;--------------------
lbl_8be9:	ldx $4c6
		lda $8c1d,x
		beq lbl_8c0a
		sta $4c9
		inx
		lda $8c1d,x
		sta $4c8
		lda #$1
		sta $4c7
		inx
		stx $4c6
		lda #$8
		sta $4ca
		rts
;--------------------
lbl_8c0a:	lda #$0
		sta $4c5
		sta $4c7
		lda #$f4
		ldx #$f
lbl_8c16:	sta $2b0,x
		dex
		bpl lbl_8c16
		rts
;--------------------
lbl_8c1d:	dc.b $a3	;?
		eor $a3
		dc.b $4f	;?
		dc.b $a3	;?
		eor $6da3,y		;RAM Expansion
		brk
		dc.b $a3	;?
		lda $a3
		ldx $cda3,x
		brk
		dc.b $a3	;?
		dc.b $dc	;?
		dc.b $a3	;?
		sbc $a3
		dc.b $f4	;?
		brk
		dc.b $a3	;?
		adc $87a3,x
		dc.b $a3	;?
		sta $a3,x
		lda $0
		lda $4c7
		beq lbl_8c61
		lda $4c8
		sta $0
		lda $4c9
		sta $1
		jsr lbl_c956
		lda $4c8
		sta $0
		lda $4c9
		sta $1
		jsr lbl_cadf
		lda #$0
		sta $4c7
lbl_8c61:	rts
;--------------------
		lda $0
		pha
		lda $6
		pha
		lda $7
		pha
		lda #$10
		sta $0
		ldx $9f
		lda #$1
		sta $9d,x
		txa
		sta $1
		jsr lbl_e1db
		pla
		sta $7
		pla
		sta $6
		pla
		sta $0
		rts
;--------------------
lbl_8c85:	sta $b8
		jsr lbl_cbd9
		ldx $be
		rts
;--------------------
lbl_8c8d:	lda $35
		cmp #$aa
		beq lbl_8ca4
		tay
		iny
		iny
		lda $29
		cmp #$2
		bcc lbl_8ca2
		ldy ($36),y
		cmp #$aa
		beq lbl_8ca4
lbl_8ca2:	pla
		pla
lbl_8ca4:	rts
;--------------------
lbl_8ca5:	jsr lbl_ca59
		and #$7
		clc
		adc $349
		sta $349
		inc $348
		rts
;--------------------
lbl_8cb5:	jsr lbl_ca59
		and #$3
		sta $7
		lda $349
		sec
		sbc $7
		sta $349
		dec $348,x
		dec $348,x
		rts
;--------------------
lbl_8ccc:	sta $1e
		txa
		sec
		ldx $4d5
		beq lbl_8cd7
		sbc #$8
lbl_8cd7:	sbc #$18
		sta $2e8,x
		sta $2ec,x
		tya
		sec
		sbc #$8
		sta $2eb,x
		tya
		sta $2ef,x
		ldy $1e
		lda $9c9b,y
		sta $2e9,x
		lda #$d9
		sta $2ed,x
		ldy #$3
		lda $11
		beq lbl_8cff
		ldy #$2
lbl_8cff:	tya
		sta $2ea,x
		sta $2ee,x
		ldx #$0
		ldy #$8
		lda $4d5
		beq lbl_8d12
		inx
		ldy #$0
lbl_8d12:	lda #$40
		sta $4d6,x
		sty $4d5
		rts
;--------------------
lbl_8d1b:	ldx #$0
		ldy #$0
lbl_8d1f:	lda $4d6,x
lbl_8d22:	beq lbl_8d31
		dec $4d6,x
		bne lbl_8d31
		lda #$f4
		sta $2e8,y
		sta $2ec,y
lbl_8d31:	ldy #$8
		inx
		cpx #$2
		bne lbl_8d1f
		rts
;--------------------
lbl_8d39:	lda $734
		bne lbl_8d55
		lda $4cc
		asl a
		asl a
		asl a
		asl a
		tax
		ldy #$0
lbl_8d48:	lda $8d66,x
		sta $2b0,y
		inx
		iny
		cpy #$10
		bne lbl_8d48
		rts
;--------------------
lbl_8d55:	ldx #$0
		ldy #$0
lbl_8d59:	lda $8d96,x
		sta $2b0,y
		inx
		iny
		cpy #$10
		bne lbl_8d59
		rts
;--------------------
lbl_8d66:	dc.b $77	;?
		dc.b $7f	;?
		dc.b $3	;?
		bvs lbl_8de2
		dc.b $ff	;?
		dc.b $3	;?
		sei
		dc.b $77	;?
		dc.b $ff	;?
		dc.b $43	;?
		dc.b $80	;?
		dc.b $77	;?
		dc.b $7f	;?
		dc.b $43	;?
		dey
		dc.b $a7	;?
		dc.b $7f	;?
		dc.b $3	;?
		jsr lbl_ffa7
		dc.b $3	;?
		plp
		dc.b $a7	;?
		dc.b $ff	;?
		dc.b $43	;?
		bmi $8d2a
		dc.b $7f	;?
		dc.b $43	;?
		sec
		dc.b $a7	;?
		dc.b $7f	;?
		dc.b $3	;?
		cpy #$a7
		dc.b $ff	;?
		dc.b $3	;?
		iny
		dc.b $a7	;?
		dc.b $ff	;?
		dc.b $43	;?
		bne lbl_8d3a
		dc.b $7f	;?
		dc.b $43	;?
		cld
lbl_8d96:	dc.b $87	;?
		dc.b $7f	;?
		dc.b $3	;?
		bvs lbl_8d22
		dc.b $ff	;?
		dc.b $3	;?
		sei
		dc.b $87	;?
		dc.b $ff	;?
		dc.b $43	;?
		dc.b $80	;?
		dc.b $87	;?
		dc.b $7f	;?
		dc.b $43	;?
		dey
lbl_8da6:	lda $720
		beq lbl_8e12
		ldx #$ff
		bmi $8e0a
lbl_8daf:	lda $700,x
		bne lbl_8e08
		lda $704,x
		beq lbl_8dbf
		dec $704,x
		jmp lbl_8e08
;--------------------
lbl_8dbf:	ldy #$0
lbl_8dc1:	lda $8e13,y
		sta $700,x
		inx
		inx
		inx
		inx
		iny
		cpy #$7
		bne lbl_8dc1
lbl_8dd0:	lda #$54
		sta $6f4,x
		jsr lbl_ca59
		and #$f8
		ora #$4
		cmp #$94
		bcs lbl_8df1
		cmp #$6c
lbl_8de2:	bcc lbl_8df1
		asl a
		rol a
		and #$1
		tay
		lda #$38
		sta $6f4,x
		lda $8e1b,y
lbl_8df1:	cmp $71c
		beq lbl_8dd0
		cmp $71d
		beq lbl_8dd0
		cmp $71e
		beq lbl_8dd0
		cmp $71f
		beq lbl_8dd0
		sta $700,x
lbl_8e08:	ldx $0
lbl_8e0a:	inx
		stx $0
		cpx $720
		bne lbl_8daf
lbl_8e12:	rts
;--------------------
lbl_8e13:	ora ($0,x)
		brk
		brk
		dc.b $54	;?
		brk
		dc.b $3	;?
		brk
lbl_8e1b:	dc.b $26	;?
		dc.b $da	;?
lbl_8e1d:	lda $720
		beq lbl_8e38
		ldx #$0
lbl_8e24:	lda $700,x
		beq lbl_8e32
		jsr lbl_8e39
		jsr lbl_8eb2
		jsr lbl_8ee9
lbl_8e32:	inx
		cpx $720
		bne lbl_8e24
lbl_8e38:	rts
;--------------------
lbl_8e39:	lda $704,x
		beq lbl_8e42
		dec $704,x
		rts
;--------------------
lbl_8e42:	lda $700,x
		cmp #$3
		beq lbl_8e6c
		bcs lbl_8e88
		ldy $708,x
lbl_8e4e:	lda $8f09,y
		bpl lbl_8e5c
		lda #$2
		sta $700,x
		ldy #$4
		bne lbl_8e4e
lbl_8e5c:	sta $704,x
		iny
		lda $8f09,y
		sta $714,x
		iny
		tya
		sta $708,x
		rts
;--------------------
lbl_8e6c:	lda $714,x
		cmp #$12
		bne lbl_8e7f
lbl_8e73:	lda #$0
		sta $700,x
		jsr lbl_ca59
lbl_8e7b:	sta $704,x
		rts
;--------------------
lbl_8e7f:	inc $714,x
		lda #$6
		sta $704,x
		rts
;--------------------
lbl_8e88:	ldy $708,x
		lda $8ea9,y
		bmi $8ea0
		sta $704,x
		iny
		lda $8ea9,y
		sta $714,x
		iny
		tya
		sta $708,x
		rts
;--------------------
lbl_8ea0:	lda #$0
		sta $700,x
		lda #$ff
		bmi $8e7b
lbl_8ea9:	dc.b $4	;?
		dc.b $3b	;?
		dc.b $4	;?
		dc.b $3c	;?
		dc.b $4	;?
		dc.b $52	;?
		dc.b $4	;?
		dc.b $51	;?
		dc.b $ff	;?
lbl_8eb2:	lda $700,x
		cmp #$2
		bne lbl_8ee8
		ldy $70c,x
		inc $70c,x
		lda $8f1e,y
		bpl lbl_8ec9
		dec $70c,x
		lda #$4
lbl_8ec9:	clc
		adc $710,x
		sta $710,x
		cmp #$e0
		bcc lbl_8ee8
		lda #$e0
		sta $710,x
		lda #$10
		sta $714,x
		lda #$3
		sta $700,x
		lda #$6
		sta $704,x
lbl_8ee8:	rts
;--------------------
lbl_8ee9:	lda #$1
		sta $b0
		lda $710,x
		sta $b8
		lda $71c,x
		sta $b9
		lda $714,x
		sta $b6
		lda $718,x
		sta $b7
		stx $0
		jsr lbl_d7cb
		ldx $0
		rts
;--------------------
lbl_8f09:	plp
		and $3e28,x
		asl $3f
		asl $40
		asl $3f
		asl $40
		asl $3f
		asl $40
		asl $3f
		asl $40
		dc.b $ff	;?
lbl_8f1e:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		ora ($1,x)
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		dc.b $4	;?
		dc.b $4	;?
		dc.b $ff	;?
		lda $b8
		sec
		sbc #$8
		sta $1c
		ldy #$3
lbl_8f41:	lda $700,y
		beq lbl_8fb1
		cmp #$4
		beq lbl_8fb1
		ldx #$40
		lda $710,y
		sec
		sbc $1c
		bpl lbl_8f59
		jsr lbl_caed
		ldx #$80
lbl_8f59:	stx $1f
		pha
		lda #$4
		clc
		adc $ce
		sta $1e
		pla
		sec
		sbc $1e
		bpl lbl_8fb1
		ldx #$1
		lda $71c,y
		sec
		sbc $b9
		bpl lbl_8f78
		jsr lbl_caed
		ldx #$2
lbl_8f78:	pha
		txa
		ora $1f
		sta $1f
		lda #$4
		clc
		adc $cf
		sta $1e
		pla
		sec
		sbc $1e
		bpl lbl_8fb1
		lda $714,y
lbl_8f8e:	cmp #$3f
		bcc lbl_8f9c
		tya
		pha
		jsr lbl_8fb7
		pla
		tax
		jmp lbl_8e73
;--------------------
lbl_8f9c:	lda #$0
		sta $708,y
		lda #$4
		sta $700,y
		sta $704,y
		lda #$3a
		sta $714,y
		lda $1f
		rts
;--------------------
lbl_8fb1:	dey
		bpl lbl_8f41
		lda #$0
		rts
;--------------------
lbl_8fb7:	ldy #$2
		sty $c
		lda #$0
		sta $5ff
		ldy $bf
		ldx #$0
		dey
		beq lbl_8fc9
		ldx #$4
lbl_8fc9:	lda $48
		beq lbl_8fd2
		dec $48,x
		jmp lbl_8fd7
;--------------------
lbl_8fd2:	inx
		lda #$1
		sta $48,x
lbl_8fd7:	lda #$10
		sta $c6
		lda #$40
		sta $b3
		ldy $c
		lda $e028,y
		sta $b6
		lda $b7
		and $e02b,y
		dc.b $19	;?
		dc.b $2e	;?
		cpx #$85
		dc.b $b7	;?
		lda #$0
		sta $b5
		lda #$a4
		ldy #$a2
		sta $bc
		sty $bd
		lda $ff
		ora #$1
		sta $ff
		rts
;--------------------
		lda $c2
		beq lbl_9009
		dec $c2
lbl_9009:	lda $c0
		and #$3
		sta $1e
		lda $b1
		sta $1f
		and #$4
		beq lbl_901a
		jmp lbl_909a
;--------------------
lbl_901a:	lda $b1
		and #$3
		sta $1f
		beq lbl_9081
		ldy $5ff
		bne lbl_90a2
		and $1e
		beq lbl_9041
lbl_902b:	lda $c2
		bne lbl_90a2
		sta $bb
		lda $1e
		beq lbl_903e
		inc $c4
		jsr lbl_c651
		lda #$8
		sta $c2
lbl_903e:	jmp lbl_90a2
;--------------------
lbl_9041:	lda $1e
		beq lbl_902b
		lda $1f
		ora #$4
		sta $1f
		lda $c4
		sta $0
		lda $cd
		sta $1
		jsr lbl_d453
		lda #$1
		sta $c2
		lda $0
		beq lbl_905e
lbl_905e:	jmp lbl_90a2
;--------------------
		dec $bb
		beq lbl_9076
		ldy #$22
		lda $bb
		cmp #$20
		beq lbl_9073
		ldy #$1e
		cmp #$10
		bne lbl_9075
lbl_9073:	sty $b6
lbl_9075:	rts
;--------------------
lbl_9076:	lda #$0
		sta $b5
		lda $b1
		and #$f7
		sta $b1
		rts
;--------------------
lbl_9081:	lda $1e
		bne lbl_9091
lbl_9085:	lda #$0
		sta $c4
		sta $bb
		jsr lbl_c651
		jmp lbl_90a2
;--------------------
lbl_9091:	lda #$5
		sta $c2
		lda $1e
		jmp lbl_90a4
;--------------------
lbl_909a:	lda $c2
		bne lbl_90a2
		sta $1f
		beq lbl_9085
lbl_90a2:	lda $1f
lbl_90a4:	pha
		lda $b1
		and #$c0
		sta $b1
		pla
		ora $b1
		sta $b1
		sta $11
		lda $bf
		cmp #$40
		bcc lbl_90bf
		lda $c6
		bne lbl_90bc
lbl_90bc:	jmp lbl_90c9
;--------------------
lbl_90bf:	lda $bf
		and #$f0
		beq lbl_90c9
		lda $c8
		bne lbl_90d7
lbl_90c9:	ldy #$0
		tya
		clc
		adc $c5
		lsr $11
		bcs lbl_90dd
		lsr $11
		bcs lbl_90d8
lbl_90d7:	rts
;--------------------
lbl_90d8:	eor #$ff
		sec
		bcs lbl_90de
lbl_90dd:	clc
lbl_90de:	adc $b9
		sta $b9
		lda $c1
		beq lbl_90e7
		rts
;--------------------
lbl_90e7:	lda $bb
		bne lbl_90f4
		lda $b1
		and #$4
		bne lbl_90f4
		jsr lbl_dd06
lbl_90f4:	rts
;--------------------
		lda #$0
		sta $a0
		lda #$3
		sta $a1
		lda #$2
lbl_90ff:	sta $33
		lda #$0
		sta $a2
lbl_9105:	jsr lbl_9160
		lda $b0
		beq lbl_910f
		jsr lbl_c754
lbl_910f:	jsr lbl_c73e
		dec $33
		bne lbl_9105
		rts
;--------------------
		lda $720
		beq lbl_912c
		ldx #$0
lbl_911e:	lda $700,x
		beq lbl_9126
		jsr lbl_8ee9
lbl_9126:	inx
		cpx $720
		bne lbl_911e
lbl_912c:	rts
;--------------------
		lda #$6
		sta $33
		lda #$60
		sta $a0
		lda #$3
		sta $a1
		lda #$0
		sta $a2
lbl_913d:	jsr lbl_9160
		lda $b0
		beq lbl_9147
		jsr lbl_d7cb
lbl_9147:	jsr lbl_c73e
		dec $33
		bne lbl_913d
		rts
;--------------------
		lda $340
		beq lbl_9157
		jsr lbl_89a1
lbl_9157:	lda $420
		beq lbl_915f
		jsr lbl_853d
lbl_915f:	rts
;--------------------
lbl_9160:	jsr lbl_c719
lbl_9163:	ldy ($14),y
		sta $b0,x
		iny
		inx
		cpx #$20
		bne lbl_9163
		rts
;--------------------
lbl_916e:	ora ($0,x)
		dc.b $3	;?
		brk
		brk
		brk
		brk
		rti
;--------------------
		iny
		ldy $20
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dc.b $4	;?
lbl_918e:	ora ($0,x)
		dc.b $3	;?
		brk
		brk
		brk
		brk
		rti
;--------------------
		clv
		rti
;--------------------
		jsr lbl_0
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dc.b $4	;?
lbl_91ae:	ldy $91,x
		dc.b $d4	;?
		sta ($f4),y
		sta ($1),y
		dc.b $2	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $f	;?
		asl $15
		ora ($98,x)
		cpx #$a0
		brk
		dc.b $47	;?
		ldx #$3
		bpl lbl_91c5
lbl_91c5:	brk
		brk
		asl a
		brk
		ora ($3,x)
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $93	;?
		dc.b $4	;?
		asl $1
		dc.b $2	;?
		dc.b $2	;?
		ora ($17,x)
		dc.b $3	;?
		and ($22,x)
		tya
		cpx #$90
		dc.b $4	;?
		dc.b $47	;?
		ldx #$1
		jsr lbl_0
		brk
		dc.b $14	;?
		brk
		ora ($3,x)
		brk
		brk
		brk
		brk
		brk
		brk
		sty $5,x
		asl $1
		dc.b $2	;?
		dc.b $3	;?
		dc.b $4	;?
		dc.b $2b	;?
		dc.b $3	;?
		and #$0
		tya
		iny
		bcc lbl_9208
		dc.b $47	;?
		ldx #$1
		bmi $9205
lbl_9205:	brk
		brk
		brk
lbl_9208:	brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		sta $5,x
		asl $1
		dc.b $2	;?
		ora ($0,x)
		dc.b $3a	;?
		ora $38
		dc.b $3	;?
		dc.b $64	;?
		bne lbl_91af
		brk
		cli
		dc.b $93	;?
		dc.b $2	;?
		dc.b $80	;?
		brk
		brk
		dc.b $82	;?
		asl a
		dc.b $2	;?
		ora ($2,x)
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		stx $4,y
		dc.b $3	;?
lbl_9234:	ora ($2,x)
		ora ($0,x)
		dc.b $3a	;?
		ora $38
		dc.b $3	;?
		dc.b $64	;?
		cpx #$90
		brk
		cli
		dc.b $93	;?
		dc.b $2	;?
		dc.b $80	;?
		brk
		brk
		dc.b $82	;?
		asl a
		dc.b $2	;?
		ora ($2,x)
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		stx $4,y
		dc.b $3	;?
		jsr lbl_c5c6
		jsr lbl_9796
		lda #$1
		sta $734
		lda $41
		cmp #$9
		bcc lbl_9278
		sty $4c0
		cmp #$16
		bcc lbl_9278
		jsr lbl_c983
		cmp #$4
		bcc lbl_9275
		lda #$4
lbl_9275:	sta $720
lbl_9278:	lda #$0
		sta $35
		lda $735
		cmp #$3
		bne lbl_92ab
		ldx #$1f
		ldy #$1f
lbl_9287:	lda $918e,x
		sta $300,x
		lda $9214,x
		sta $360,x
		lda $9234,x
		sta $380,x
		dex
		bpl lbl_9287
		lda #$1
		sta $4c0
		sta $4c1
		lda #$2
		sta $43
		jmp lbl_92d8
;--------------------
lbl_92ab:	asl a
		tay
		lda $91ae,y
		sta $0
		lda $91af,y
		sta $1
		ldx #$1f
		ldy #$1f
lbl_92bb:	lda $916e,x
		sta $300,x
		ldy ($0),y
		sta $360,x
		dey
		dex
		bpl lbl_92bb
		lda #$1
		sta $734
		lda #$0
		sta $4c0
		lda #$1
		sta $43
lbl_92d8:	lda #$1
		sta $45
		sta $44
		lda #$0
		sta $35
		sta $46
		lda #$1
		sta $2d
		inc $40
		rts
;--------------------
lbl_92eb:	rol $98,x
		dc.b $80	;?
		tya
		iny
		tya
		dc.b $f	;?
		sta $8f20,y
		dex
		jsr lbl_c550
		jsr lbl_c5b6
		lda $735
		asl a
		tay
		lda $92eb,y
		tax
		lda $92ec,y
		tay
		jsr lbl_e583
		jsr lbl_e56c
		inc $40
		rts
;--------------------
		jsr lbl_ca7b
		lda #$0
		sta $55
		sta $56
		sta $57
		sta $58
		sta $49
		sta $4d
		sta $51
		sta $46
		sta $5fb
		sta $5fc
lbl_932d:	sta $e0
		sta $e1
		sta $736
		sta $737
		sta $71
		ldx #$1b
lbl_933b:	sta $74,x
		dex
		bpl lbl_933b
		jsr lbl_e5b6
		jsr lbl_e58a
		jsr lbl_e590
		lda #$4
		sta $2d
		lda #$3
		ldy #$0
		ldx $735
		bne lbl_935a
		ldy #$17
		lda #$1
lbl_935a:	sta $fd
		sty $2d
		inc $40
		lda #$1
		sta $3f
		jsr lbl_ca9a
		lda $735
		cmp #$3
		bne lbl_9379
		lda #$10
		sta $2d
		lda #$10
		sta $40
		jsr lbl_93f2
lbl_9379:	rts
;--------------------
		jsr lbl_e42a
		lda $18
		ora $1a
		cmp #$40
		bne lbl_9396
		lda $735
		bne lbl_938e
		lda $2d
		beq lbl_9393
lbl_938e:	lda #$1
		sta $738
lbl_9393:	jmp lbl_94a0
;--------------------
lbl_9396:	lda $2d
		bne lbl_939e
		lda #$f
		sta $40
lbl_939e:	jsr lbl_97b9
		rts
;--------------------
lbl_93a2:	tax
lbl_93a3:	dc.b $93	;?
		lda $d093,x
lbl_93a7:	dc.b $93	;?
lbl_93a8:	dc.b $e3	;?
		dc.b $93	;?
		brk
		bvs lbl_932d
		dc.b $3c	;?
		dc.b $2	;?
		clc
		brk
		cli
		dc.b $80	;?
		bmi $93b7
		pha
		ora ($18,x)
		dc.b $80	;?
		dc.b $17	;?
		ora ($40,x)
		tax
		brk
		dc.b $74	;?
		dc.b $80	;?
		jsr lbl_2002
		brk
		bit $80
		bmi $93ca
		rti
;--------------------
		ora ($10,x)
		dc.b $80	;?
		bpl lbl_93cf
		rti
;--------------------
lbl_93cf:	tax
		brk
		dc.b $5c	;?
		dc.b $80	;?
		bmi $93d7
		bpl lbl_93d7
lbl_93d7:	dc.b $34	;?
		dc.b $80	;?
		bmi $93dd
		pha
		ora ($10,x)
		dc.b $80	;?
		dc.b $1a	;?
		ora ($40,x)
		tax
		brk
		dc.b $8	;?
		ora ($3f,x)
		ora ($1,x)
		dc.b $80	;?
		bmi $93ee
		dc.b $4	;?
		brk
lbl_93ee:	dc.b $34	;?
		brk
		dc.b $80	;?
		tax
lbl_93f2:	lda $18
		ora $1a
		cmp #$40
		bne lbl_940b
		lda $735
		bne lbl_9403
		lda $2d
		beq lbl_9408
lbl_9403:	lda #$1
		sta $738
lbl_9408:	jmp lbl_94a0
;--------------------
lbl_940b:	ldy $56
		bne lbl_9444
		lda $735
		asl a
		tay
		lda $93a2,y
		sta $0
		lda $93a3,y
		sta $1
		ldy $55
		ldy ($0),y
		cmp #$aa
		beq lbl_94a0
		sta $19
		iny
		ldy ($0),y
		sta $56
		iny
		sty $55
		lda $735
		cmp #$3
		bne lbl_9441
		lda $55
		cmp #$6
		bne lbl_9441
		lda #$ff
		sta $fd
lbl_9441:	jmp lbl_944e
;--------------------
lbl_9444:	dey
		sty $56
		lda $310
		and #$3
		sta $19
lbl_944e:	lda #$0
		sta $4c2
		jsr lbl_c3fe
		jsr lbl_d58f
		jsr lbl_cca8
		jsr lbl_cdfa
		jsr lbl_d7ad
		jsr lbl_8da6
		jsr lbl_8e1d
		jsr lbl_d686
		jsr lbl_94bf
		jsr lbl_957b
		jsr lbl_84dc
		jsr lbl_87bb
		jsr lbl_84ee
		jsr lbl_8bb5
		jsr lbl_e44d
		jsr lbl_e42a
		jsr lbl_e36a
		jsr lbl_c32c
lbl_9489:	jsr lbl_e4a6
		jsr lbl_8462
		jsr lbl_8d1b
		jsr lbl_d549
		jsr lbl_97b9
		jsr lbl_94cc
		lda #$1
		sta $42
		rts
;--------------------
lbl_94a0:	inc $735
		lda $735
		cmp #$4
		bne lbl_94af
		lda #$0
		sta $735
lbl_94af:	lda #$4
		sta $2d
		lda #$0
		sta $734
		lda #$1
		sta $40
		jmp lbl_ca7b
;--------------------
lbl_94bf:	lda $36f
		cmp #$40
		bne lbl_94cb
		lda #$0
		sta $360
lbl_94cb:	rts
;--------------------
lbl_94cc:	lda $735
		cmp #$3
		bne lbl_94ec
		lda #$13
		ldx #$0
		ldy #$28
lbl_94d9:	inx
		inx
		lda $240,x
		cmp #$3
		bne lbl_94e7
		lda #$23
		sta $240,x
lbl_94e7:	inx
		inx
		dey
		bne lbl_94d9
lbl_94ec:	rts
;--------------------
lbl_94ed:	bpl lbl_9489
		and $489a,x
		txs
		sei
		txs
		sty $9a
		sta $a89a,y
		txs
		brk
		dc.b $9b	;?
		dc.b $44	;?
		dc.b $9b	;?
		dc.b $52	;?
		dc.b $9b	;?
		sty $219b
		txs
		dc.b $32	;?
		txs
		rts
;--------------------
		txs
		cmp #$9a
		dc.b $ea	;?
		txs
		sbc $9a,x
		dc.b $22	;?
		dc.b $9b	;?
		dc.b $6f	;?
		dc.b $9b	;?
lbl_9513:	dc.b $1b	;?
lbl_9514:	sta $37,x
		sta $55,x
		sta $75,x
		sta $70,x
		dc.b $ff	;?
		dc.b $3c	;?
		dc.b $ff	;?
		dc.b $14	;?
		dc.b $ff	;?
		dc.b $5c	;?
		dc.b $ff	;?
		jsr lbl_1002
		dc.b $ff	;?
		jsr lbl_8ff
		ora $118
		bpl lbl_952e
		dc.b $8	;?
		dc.b $c	;?
		ora ($3,x)
		dc.b $ff	;?
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sei
		dc.b $ff	;?
		jsr lbl_10f
		bpl lbl_956d
		asl $1
		dc.b $e	;?
		dc.b $17	;?
		dc.b $7	;?
		jsr lbl_1ff
		ora ($10),y
		ora $110
		dc.b $1c	;?
		dc.b $ff	;?
		bpl lbl_955b
		ora ($3,x)
		dc.b $ff	;?
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $5c	;?
		dc.b $ff	;?
		bmi $9558
		bpl lbl_955a
lbl_955b:	dc.b $34	;?
		dc.b $ff	;?
		bpl lbl_955e
		ora ($2,x)
		dc.b $2f	;?
		ora #$20
		dc.b $ff	;?
		ora ($d,x)
		dc.b $7	;?
		dc.b $12	;?
		clc
		ora ($8,x)
		dc.b $ff	;?
lbl_956d:	dc.b $8	;?
		dc.b $c	;?
		dc.b $8	;?
		dc.b $ff	;?
		ora ($3,x)
		dc.b $ff	;?
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_957b:	lda $736
		bne lbl_95b2
		lda $735
		asl a
		tay
		lda $9513,y
		sta $0
		lda $9514,y
		sta $1
		lda $737
		asl a
		tay
		inc $737
		ldy ($0),y
		sta $736
		iny
		ldy ($0),y
		cmp #$ff
		beq lbl_95b5
		asl a
		tay
		lda $94ed,y
		sta $2
		lda $94ee,y
		sta $3
		jsr lbl_95b6
lbl_95b2:	dec $736,x
lbl_95b5:	rts
;--------------------
lbl_95b6:	lda #$1
		sta $21
		ldy #$0
		ldx $590
lbl_95bf:	ldy ($2),y
		sta $591,x
		beq lbl_95e6
		iny
		inx
		ldy ($2),y
		sta $591,x
		iny
		inx
		ldy ($2),y
		sta $591,x
		iny
		inx
		sta $0
lbl_95d8:	ldy ($2),y
		sta $591,x
		iny
		inx
		dec $0
		bne lbl_95d8
		jmp lbl_95bf
;--------------------
lbl_95e6:	stx $590
		rts
;--------------------
		pha
		dc.b $3c	;?
		ora ($38,x)
		pha
		and $4001,x		;pAPU Pulse #1 Ramp Control Register
		bvc lbl_9632
		ora ($38,x)
		bvc lbl_9637
		ora ($40,x)
		pha
		rti
;--------------------
		ora ($38,x)
		pha
		eor ($1,x)
		rti
;--------------------
		bvc lbl_9646
		ora ($38,x)
		bvc lbl_964b
		ora ($40,x)
		pha
		dc.b $3c	;?
		ora ($38,x)
		pha
		and $4001,x		;pAPU Pulse #1 Ramp Control Register
		bvc lbl_9658
		ora ($38,x)
		bvc lbl_965d
		ora ($40,x)
		pha
		lsr $1
		clv
		pha
		dc.b $47	;?
		ora ($c0,x)
		bvc lbl_966c
		ora ($b8,x)
		bvc lbl_9671
		ora ($c0,x)
lbl_962a:	pha
		lsr a
		ora ($b8,x)
		pha
lbl_962f:	dc.b $4b	;?
		ora ($c0,x)
lbl_9632:	bvc lbl_9680
		ora ($b8,x)
		bvc lbl_9685
		ora ($c0,x)
		pha
		dc.b $5a	;?
		dc.b $2	;?
		sec
lbl_963e:	pha
		dc.b $5b	;?
		dc.b $2	;?
		rti
;--------------------
		bvc lbl_96a0
		dc.b $2	;?
		sec
lbl_9646:	bvc lbl_96a5
		dc.b $2	;?
		rti
;--------------------
		pha
lbl_964b:	inc $3802,x
		pha
		dc.b $5e	;?
		dc.b $2	;?
		rti
;--------------------
lbl_9652:	bvc lbl_96b3
		dc.b $2	;?
		sec
		bvc lbl_96b8
lbl_9658:	dc.b $2	;?
		rti
;--------------------
		pha
		adc ($2,x)
lbl_965d:	sec
		pha
		dc.b $62	;?
		dc.b $2	;?
		rti
;--------------------
		bvc lbl_96c7
		dc.b $2	;?
		sec
lbl_9666:	bvc lbl_96cc
		dc.b $2	;?
		rti
;--------------------
		pha
		dc.b $6b	;?
lbl_966c:	dc.b $2	;?
		bcs lbl_96b7
		jmp ($b802)
		bvc lbl_96e1
		dc.b $2	;?
		bcs lbl_96c7
		ror $b802,x
lbl_967a:	pha
		dc.b $6f	;?
		dc.b $2	;?
		bcs lbl_96c7
		bvs lbl_9683
		clv
lbl_9682:	bvc lbl_96f5
		dc.b $2	;?
lbl_9685:	bcs lbl_96d7
		dc.b $72	;?
		dc.b $2	;?
		clv
		pha
		dc.b $6b	;?
		dc.b $2	;?
		bcs lbl_96d7
		jmp ($b802)
		bvc lbl_9707
		dc.b $2	;?
		bcs lbl_96e7
		dc.b $74	;?
		dc.b $2	;?
		clv
		pha
		sta $0
		sec
		pha
		stx $0
		rti
;--------------------
lbl_96a2:	bvc lbl_962b
		brk
lbl_96a5:	sec
		bvc lbl_9630
		brk
		rti
;--------------------
		pha
		dc.b $89	;?
		brk
		sec
		pha
		txa
		brk
		rti
;--------------------
		bvc lbl_963f
		brk
		sec
lbl_96b6:	bvc lbl_9644
lbl_96b8:	brk
		rti
;--------------------
		pha
lbl_96bb:	sta $3800
lbl_96be:	pha
		stx $4000		;pAPU Pulse #1 Control Register
		bvc lbl_9653
		brk
		sec
lbl_96c6:	bvc lbl_9658
		brk
		rti
;--------------------
		pha
lbl_96cb:	sta ($0),y
		bcs lbl_9717
		dc.b $92	;?
		brk
		clv
lbl_96d2:	bvc lbl_9667
		brk
		bcs lbl_9727
lbl_96d7:	sty $0,x
		clv
		pha
		sta $0,x
		bcs lbl_9727
		stx $0,y
lbl_96e1:	clv
		bvc lbl_967b
		brk
		bcs lbl_9737
lbl_96e7:	tya
		brk
		clv
		pha
		sta $3803,y
		pha
		txs
		dc.b $3	;?
		rti
;--------------------
		bvc lbl_968f
lbl_96f4:	dc.b $3	;?
lbl_96f5:	sec
		bvc lbl_9694
		dc.b $3	;?
		rti
;--------------------
		pha
		sta $3803,x
		pha
		dc.b $9e	;?
		dc.b $3	;?
		rti
;--------------------
		bvc lbl_96a3
		dc.b $3	;?
		sec
lbl_9706:	bvc lbl_96a8
		dc.b $3	;?
		rti
;--------------------
		pha
		dc.b $a1	;?
		dc.b $3	;?
		sec
		pha
		ldx #$3
		rti
;--------------------
		bvc lbl_96b7
		dc.b $3	;?
		sec
lbl_9716:	bvc lbl_96bc
		dc.b $3	;?
		rti
;--------------------
		pha
		sta $b003,y
		pha
		txs
		dc.b $3	;?
		clv
		bvc lbl_96bf
		dc.b $3	;?
		bcs lbl_9777
lbl_9727:	dc.b $9c	;?
		dc.b $3	;?
		clv
		pha
		sta $b003,x
		pha
		dc.b $9e	;?
		dc.b $3	;?
		clv
		bvc lbl_96d3
		dc.b $3	;?
		bcs lbl_9787
lbl_9737:	ldy #$3
		clv
		pha
		dc.b $a1	;?
		dc.b $3	;?
		bcs lbl_9787
		ldx #$3
		clv
lbl_9742:	bvc lbl_96e7
		dc.b $3	;?
		bcs lbl_9797
		ldy $3
		clv
lbl_974a:	dc.b $ea	;?
lbl_974b:	sta $fa,x
		sta $a,x
		stx $1a,y
lbl_9751:	stx $2a,y
		stx $3a,y
		stx $4a,y
		stx $5a,y
		stx $6a,y
		stx $7a,y
		stx $8a,y
		stx $9a,y
		stx $aa,y
		stx $ba,y
		stx $ca,y
		stx $da,y
		stx $ea,y
		stx $fa,y
		stx $a,y
		dc.b $97	;?
		dc.b $1a	;?
		dc.b $97	;?
		rol a
		dc.b $97	;?
		dc.b $3a	;?
		dc.b $97	;?
lbl_9776:	asl $0
		dc.b $3	;?
		bne lbl_9781
		ora $8
		bne lbl_9789
		dc.b $b	;?
lbl_9780:	dc.b $e	;?
lbl_9781:	bne lbl_9789
		bpl lbl_9798
		bne lbl_9794
lbl_9787:	dc.b $3	;?
lbl_9788:	ora $c0
		asl $8
		dc.b $b	;?
		cpy #$a
		dc.b $e	;?
		bpl lbl_9752
		asl $13
lbl_9794:	asl $c0,x
lbl_9796:	lda $735
		asl a
		asl a
		tay
		iny
		lda $9776,y
		sta $725
		lda $735
		asl a
		asl a
		tay
		iny
		lda $9786,y
		sta $726
		lda #$1
		sta $723
		sta $724
		rts
;--------------------
lbl_97b9:	lda $735
		asl a
		asl a
		tay
		lda $9776,y
		sta $2
		iny
		lda $9776,y
		sta $3
		iny
		lda $9776,y
		sta $4
		iny
		lda $9776,y
		sta $5
		ldx #$0
		jsr lbl_97fa
		lda $735
		asl a
		asl a
		tay
		lda $9786,y
		sta $2
		iny
		lda $9786,y
		sta $3
		iny
		lda $9786,y
		sta $4
		iny
		lda $9786,y
		sta $5
		ldx #$1
lbl_97fa:	dec $723,x
		bne lbl_9813
		lda $2
		sta $723,x
		inc $725,x
		lda $725,x
		cmp $4
		bne lbl_9813
		lda $3
		sta $725,x
lbl_9813:	lda $725,x
		asl a
		tay
		lda $974a,y
		sta $0
		lda $974b,y
		sta $1
		ldx $5
		jsr lbl_9828
		rts
;--------------------
lbl_9828:	ldy #$0
		ldy ($0),y
		sta $200,x
		inx
		iny
		cpy #$10
		bne lbl_982a
		rts
;--------------------
		and ($4a,x)
		dc.b $c	;?
		dc.b $1c	;?
		ora ($e),y
		ora $15,x
		dc.b $c	;?
		dc.b $1b	;?
		dc.b $e	;?
		dc.b $e	;?
		dc.b $19	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $22	;?
		dc.b $89	;?
		dc.b $57	;?
		dc.b $93	;?
		dc.b $23	;?
		rti
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		rts
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		dc.b $80	;?
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		ldy #$60
		dc.b $92	;?
		dc.b $23	;?
		cpy #$7
		brk
		brk
		cpy #$30
		brk
		bvc lbl_9863
lbl_9863:	dc.b $23	;?
		cpx #$48
		brk
		dc.b $23	;?
		inx
		pha
		brk
		dc.b $23	;?
		beq lbl_987e
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_987d:	dc.b $ff	;?
lbl_987e:	brk
		brk
		and ($4a,x)
		dc.b $b	;?
		dc.b $1c	;?
		dc.b $12	;?
		ora $1c0e
		dc.b $1d	;?
		dc.b $e	;?
		dc.b $19	;?
		dc.b $19	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $22	;?
		dc.b $89	;?
		dc.b $57	;?
		sty $23,x
		rti
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		rts
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		dc.b $80	;?
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		ldy #$60
		dc.b $92	;?
		dc.b $23	;?
		beq lbl_98b5
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_98b4:	dc.b $ff	;?
lbl_98b5:	dc.b $23	;?
		cpy #$7
		brk
		brk
		cpy #$30
		brk
		bvc lbl_98bf
lbl_98bf:	dc.b $23	;?
		cpx #$48
		tax
		dc.b $23	;?
		inx
		pha
		tax
		brk
		and ($4b,x)
		asl a
		dc.b $f	;?
		dc.b $12	;?
		bpl lbl_98e0
		dc.b $1d	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $f	;?
		ora $22,x
		dc.b $22	;?
		dc.b $89	;?
		dc.b $57	;?
		sta $23,x
		rti
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		rts
;--------------------
lbl_98df:	rts
;--------------------
lbl_98e0:	dc.b $92	;?
		dc.b $23	;?
		dc.b $80	;?
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		ldy #$60
		dc.b $92	;?
		dc.b $23	;?
		cpy #$7
		brk
		brk
		cpy #$30
		brk
		bvc lbl_98f3
lbl_98f3:	dc.b $23	;?
		cpx #$48
		dc.b $ff	;?
		dc.b $23	;?
		inx
		pha
		dc.b $ff	;?
		dc.b $23	;?
		beq lbl_990e
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_990d:	dc.b $ff	;?
lbl_990e:	brk
		and ($4c,x)
		dc.b $7	;?
		dc.b $1c	;?
		ora $12,x
		dc.b $19	;?
		dc.b $12	;?
		dc.b $c	;?
		dc.b $e	;?
		and ($63,x)
		dc.b $4	;?
		dc.b $52	;?
		dc.b $51	;?
		dc.b $3c	;?
lbl_991f:	bvc lbl_9942
		dc.b $82	;?
		ora $41
		dc.b $56	;?
		eor $47,x
		dc.b $54	;?
		and ($a2,x)
		ora $5d
		dc.b $5b	;?
		dc.b $5a	;?
		jmp lbl_2159
;--------------------
		dc.b $c2	;?
		dc.b $3	;?
		dc.b $4b	;?
		dc.b $4b	;?
		dc.b $5f	;?
		jsr lbl_da00
		dc.b $92	;?
		jsr lbl_da01
		dc.b $92	;?
		jsr lbl_da1e
lbl_9941:	dc.b $92	;?
lbl_9942:	jsr lbl_da1f
		dc.b $92	;?
		and ($79,x)
		dc.b $4	;?
		and $3a3c,y
		dc.b $3b	;?
		and ($99,x)
		ora $3d
		dc.b $47	;?
		rol $413f,y
		and ($b9,x)
		ora $42
		jmp lbl_4443
;--------------------
		lsr $21
		dc.b $db	;?
		dc.b $3	;?
		pha
		eor #$4b
		dc.b $22	;?
		ldx #$3
		eor ($41,x)
		dc.b $57	;?
		dc.b $22	;?
		dc.b $c2	;?
		dc.b $3	;?
		eor $5c5d,y
		dc.b $22	;?
		dc.b $e2	;?
		dc.b $3	;?
		rts
;--------------------
		rts
;--------------------
		adc ($22,x)
		dc.b $bb	;?
		dc.b $3	;?
		rti
;--------------------
		eor ($41,x)
		dc.b $22	;?
		dc.b $db	;?
		dc.b $3	;?
		eor $46
		lsr $22
		dc.b $fb	;?
		dc.b $3	;?
		lsr a
		dc.b $4b	;?
		dc.b $4b	;?
		dc.b $22	;?
		plp
		bvc lbl_9921
		dc.b $23	;?
		brk
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		jsr lbl_9260
		dc.b $23	;?
		rti
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		rts
;--------------------
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		dc.b $80	;?
		rts
;--------------------
		dc.b $92	;?
		dc.b $23	;?
		ldy #$60
		dc.b $92	;?
		dc.b $23	;?
		cpy #$7
		brk
		brk
		cpy #$30
		brk
lbl_99ab:	bvc lbl_99ad
lbl_99ad:	dc.b $23	;?
		cpy #$1
		dc.b $33	;?
		dc.b $23	;?
		dc.b $c7	;?
		ora ($cc,x)
		dc.b $23	;?
		iny
		ora ($33,x)
		dc.b $23	;?
		dc.b $cf	;?
		ora ($cc,x)
		dc.b $23	;?
		bne lbl_99c2
lbl_99c0:	dc.b $77	;?
		eor $23,x
		dec $2,x
		eor $dd,x
		dc.b $23	;?
		cld
		dc.b $2	;?
		dc.b $77	;?
		eor $23,x
		dec $5502,x
		cmp $e023,x
		ora ($77,x)
		dc.b $23	;?
		dc.b $e7	;?
		ora ($dd,x)
		dc.b $23	;?
		inx
		dc.b $2	;?
		dc.b $77	;?
		eor $23,x
		inc $5502
		cmp $e123,x
		asl $aa
		tax
		tax
		tax
		tax
		tax
		dc.b $23	;?
		beq lbl_99ff
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_99fd:	dc.b $ff	;?
		dc.b $ff	;?
lbl_99ff:	brk
		and ($4a,x)
		dc.b $c	;?
		dc.b $1c	;?
		ora ($e),y
		ora $15,x
		dc.b $c	;?
		dc.b $1b	;?
		dc.b $e	;?
		dc.b $e	;?
		dc.b $19	;?
		dc.b $e	;?
		dc.b $1b	;?
		brk
		and ($ca,x)
		ora $e0d
		asl $18,x
		dc.b $17	;?
		dc.b $1c	;?
		dc.b $1d	;?
		dc.b $1b	;?
		asl a
		dc.b $1d	;?
		dc.b $12	;?
		clc
		dc.b $17	;?
lbl_9a20:	brk
		and ($ca,x)
		ora $2424
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $0
		dc.b $22	;?
		ldx #$7
		bit $24
		bit $24
		bit $24
		bit $0
		dc.b $22	;?
		ldx #$7
		dc.b $13	;?
		asl $1916,x
		asl $6719,x
		brk
		dc.b $22	;?
		dc.b $c7	;?
		dc.b $14	;?
		ora ($4f,x)
		ora ($12),y
		dc.b $1d	;?
		dc.b $4f	;?
		dc.b $f	;?
		ora $12,x
		dc.b $19	;?
		dc.b $1c	;?
		dc.b $4f	;?
		dc.b $12	;?
		dc.b $1d	;?
		dc.b $4f	;?
		clc
		dc.b $1f	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $67	;?
		brk
		dc.b $22	;?
		dc.b $c7	;?
		dc.b $14	;?
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		brk
		dc.b $22	;?
		dc.b $cc	;?
		dc.b $8	;?
		dc.b $14	;?
		dc.b $12	;?
		dc.b $c	;?
		dc.b $14	;?
		dc.b $4f	;?
		clc
		dc.b $f	;?
		dc.b $f	;?
		brk
		dc.b $23	;?
		dc.b $8	;?
		ora ($20),y
		ora ($e),y
		dc.b $17	;?
		dc.b $4f	;?
		asl $1c19,x
		dc.b $12	;?
		ora $4f0e
		ora $2018
		dc.b $17	;?
		dc.b $67	;?
		brk
		and ($8a,x)
		dc.b $b	;?
		dc.b $1c	;?
		dc.b $12	;?
		ora $1c0e
		dc.b $1d	;?
		dc.b $e	;?
		dc.b $19	;?
		dc.b $19	;?
		dc.b $e	;?
		dc.b $1b	;?
		brk
		dc.b $22	;?
		ora $1
		plp
		dc.b $22	;?
		ora $2801
		dc.b $22	;?
		dc.b $26	;?
		ora $1,x
		dc.b $1c	;?
		dc.b $1d	;?
		dc.b $4f	;?
		ora ($12),y
		dc.b $1d	;?
		dc.b $4f	;?
		asl $a,x
		dc.b $14	;?
		dc.b $e	;?
		dc.b $1c	;?
		dc.b $4f	;?
		dc.b $12	;?
		dc.b $1d	;?
		dc.b $4f	;?
		asl $a,x
		ora $67
		dc.b $22	;?
		ora $1
		bit $22
		ora $2401
		dc.b $22	;?
		dc.b $26	;?
		ora $24,x
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		brk
		dc.b $22	;?
		dc.b $d2	;?
		dc.b $7	;?
		ora ($1c,x)
		dc.b $1d	;?
		dc.b $4f	;?
		ora ($12),y
		dc.b $1d	;?
		brk
		dc.b $22	;?
		dc.b $d2	;?
		dc.b $7	;?
		bit $24
		bit $24
		bit $24
		bit $0
		dc.b $22	;?
		ldx #$1
		plp
		dc.b $22	;?
		tax
		ora ($28,x)
		dc.b $22	;?
		dc.b $c3	;?
		asl $2,x
		dc.b $17	;?
		ora $114f
		dc.b $12	;?
		dc.b $1d	;?
		dc.b $4f	;?
		dc.b $f	;?
		ora $12,x
		dc.b $19	;?
		dc.b $1c	;?
		dc.b $4f	;?
		dc.b $12	;?
		dc.b $1d	;?
		dc.b $4f	;?
		clc
		dc.b $1f	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $67	;?
		brk
		dc.b $22	;?
		ldx #$1
		bit $22
		tax
		ora ($24,x)
		dc.b $22	;?
		dc.b $c3	;?
		asl $24,x
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $0
		and ($8b,x)
		asl a
		dc.b $f	;?
		dc.b $12	;?
		bpl lbl_9b5c
		dc.b $1d	;?
		dc.b $e	;?
		dc.b $1b	;?
		dc.b $f	;?
		ora $22,x
		brk
		and ($e4,x)
		dc.b $19	;?
		clc
		dc.b $17	;?
		ora $22,x
		dc.b $4f	;?
lbl_9b5a:	jsr lbl_e11
		dc.b $17	;?
		dc.b $4f	;?
		dc.b $1d	;?
		clc
		asl $110c,x
		dc.b $12	;?
		dc.b $17	;?
		bpl lbl_9bb7
		dc.b $f	;?
		ora $18,x
		clc
		dc.b $1b	;?
		dc.b $67	;?
		brk
		and ($e4,x)
		dc.b $19	;?
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $24
		bit $0
		and ($8c,x)
		dc.b $7	;?
		dc.b $1c	;?
		ora $12,x
		dc.b $19	;?
		dc.b $12	;?
		dc.b $c	;?
		dc.b $e	;?
		brk
		eor $aa,x
		eor $aa,x
		ora ($0,x)
		dc.b $3	;?
		brk
		brk
		brk
		brk
		rti
;--------------------
		bne lbl_9be9
		jsr lbl_0
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
lbl_9bb5:	brk
		brk
lbl_9bb7:	brk
		brk
		dc.b $4	;?
		dc.b $4	;?
		ora ($0,x)
		dc.b $3	;?
		brk
		brk
		brk
		brk
		ora ($d0,x)
		cpy $38
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dc.b $4	;?
		ora ($0,x)
		dc.b $3	;?
		brk
		dc.b $f	;?
		asl $13
		and ($28,x)
		brk
		brk
		brk
lbl_9be7:	dc.b $47	;?
		ldx #$0
lbl_9bea:	bpl lbl_9bec
lbl_9bec:	brk
		brk
		asl a
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		asl $1
		brk
		dc.b $3	;?
		brk
		dc.b $17	;?
		dc.b $3	;?
		dc.b $1f	;?
		dc.b $22	;?
		plp
		brk
		brk
		dc.b $4	;?
		dc.b $47	;?
		ldx #$0
		jsr lbl_0
		brk
		dc.b $14	;?
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora $6
		ora ($0,x)
		dc.b $3	;?
		brk
		dc.b $2b	;?
		dc.b $3	;?
		and #$20
		plp
		brk
		brk
		dc.b $8	;?
		dc.b $47	;?
		ldx #$0
lbl_9c2a:	bmi $9c2c
lbl_9c2c:	brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora $6
		ora ($0,x)
		dc.b $2	;?
		brk
		and ($%),y
		dc.b $2e	;?
		dc.b $22	;?
		brk
		brk
		brk
		brk
		dc.b $47	;?
		ldx #$0
		rti
;--------------------
		brk
		ora ($0,x)
		asl a
		dc.b $2	;?
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dc.b $3	;?
lbl_9c5b:	ora ($1,x)
		brk
		ora ($3d,x)
		ora ($49,x)
		ora ($f4,x)
		brk
		brk
		brk
		brk
		brk
		brk
		ldy #$0
		dc.b $80	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $7	;?
		dc.b $7	;?
lbl_9c7b:	ora ($1,x)
		dc.b $3	;?
		ora ($3d,x)
		ora ($49,x)
		dc.b $2	;?
		dc.b $f4	;?
		brk
lbl_9c85:	bpl lbl_9c87
lbl_9c87:	brk
		brk
		brk
lbl_9c8a:	bcs lbl_9c8c
lbl_9c8c:	ora ($0,x)
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $7	;?
		dc.b $7	;?
lbl_9c9b:	dc.b $d4	;?
		dec $d7,x
		cld
		dc.b $d2	;?
		dc.b $d3	;?
		cmp $51,x
		brk
lbl_9ca4:	bvc lbl_9ca6
lbl_9ca6:	dc.b $4f	;?
		brk
		lsr $4d00
		brk
		eor #$0
		lsr a
		brk
		dc.b $4b	;?
		brk
		jmp lbl_4500
;--------------------
		brk
		lsr $0
		dc.b $47	;?
		brk
		pha
		brk
		dc.b $ff	;?
		eor $0
		lsr $0
		dc.b $47	;?
		brk
		pha
		brk
		eor #$0
		lsr a
		brk
		dc.b $4b	;?
		brk
		jmp lbl_4d00
;--------------------
		brk
		lsr $4f00
		brk
lbl_9cd3:	bvc lbl_9cd5
lbl_9cd5:	dc.b $51	;?
		brk
		dc.b $ff	;?
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		cmp $feff,x
		inc $fefd,x
		inc $ffff,x
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		brk
		brk
		ora ($0,x)
		ora ($0,x)
		ora ($1,x)
		dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $2	;?
		ora ($cc,x)
		ora ($1,x)
		brk
		brk
		dc.b $bb	;?
		brk
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		cmp $feff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		ora ($1,x)
		ora ($2,x)
		dc.b $2	;?
		ora ($1,x)
		dc.b $cc	;?
		ora ($0,x)
		ora ($0,x)
		brk
		dc.b $bb	;?
		brk
		tax
lbl_9d1e:	and ($19,x)
		dc.b $8	;?
		dc.b $4	;?
		ora $608
		dc.b $3	;?
lbl_9d26:	plp
		plp
		and ($1f,x)
		dc.b $19	;?
		dc.b $19	;?
		dc.b $17	;?
		dc.b $f	;?
		and ($21,x)
		dc.b $17	;?
		dc.b $f	;?
		dc.b $17	;?
		dc.b $17	;?
		dc.b $f	;?
		dc.b $8	;?
		dc.b $19	;?
		bpl lbl_9d49
		dc.b $f	;?
		bpl lbl_9d4b
		dc.b $8	;?
		asl $cc
		dc.b $9c	;?
		jmp ($203c)
		dc.b $83	;?
		dc.b $2	;?
		dc.b $76	;?
		dc.b $7a	;?
lbl_9d47:	jsr lbl_2a3
		dc.b $77	;?
lbl_9d4b:	adc $%,y
		dc.b $2	;?
		dc.b $7c	;?
		dc.b $7e	;?
		jsr lbl_2ba
		adc $217f,x
		dc.b $63	;?
		dc.b $2	;?
		dc.b $80	;?
		dc.b $82	;?
		and ($83,x)
		dc.b $2	;?
		sta ($83,x)
		and ($7a,x)
		dc.b $2	;?
		sty $86
		and ($9a,x)
		dc.b $2	;?
		sta $87
		jsr lbl_4a85
		dc.b $7b	;?
		jsr lbl_4a90
		dc.b $7b	;?
		and ($85,x)
		lsr a
		dc.b $89	;?
		and ($90,x)
		lsr a
		dc.b $89	;?
		jsr lbl_19c3
		sei
		bit $24
		pla
		adc #$69
		dc.b $6b	;?
		adc #$68
		adc #$68
		dc.b $6b	;?
		adc #$24
		pla
		adc #$68
		adc #$6b
		adc #$6b
		adc #$24
		bit $88
		jsr lbl_13e6
		pla
		ror a
		ror a
		ror $686a,x		;RAM Expansion
		ror a
		pla
		ror $246a,x
		pla
		ror a
		pla
		ror a
		ror $6e6a,x		;RAM Expansion
		adc ($21),y
		asl $13
		pla
		ror a
		ror a
		pla
		jmp ($6d68)		;RAM Expansion
		pla
		ror $246a,x
		pla
		adc $6d68		;RAM Expansion
		ror $6f6a,x		;RAM Expansion
		adc #$21
		dc.b $26	;?
		dc.b $13	;?
		pla
		ror a
		ror a
		ror $686a,x		;RAM Expansion
		ror a
		pla
		ror $246a,x
		pla
		ror a
		pla
		ror a
		ror $726a,x		;RAM Expansion
		ror a
		and ($43,x)
		dc.b $19	;?
		sei
		bit $24
		pla
		ror a
		ror a
		ror $686a,x		;RAM Expansion
		ror a
		pla
		dc.b $6f	;?
		bvs lbl_9e0d
		pla
		bvs lbl_9e54
		ror a
		dc.b $6f	;?
		bvs lbl_9e5f
		bvs lbl_9e65
		bit $88
		dc.b $22	;?
		ora #$f
		ora ($24,x)
		dc.b $19	;?
		ora $a,x
		dc.b $22	;?
		dc.b $e	;?
		dc.b $1b	;?
		bit $10
		asl a
		asl $e,x
		bit $a
		dc.b $22	;?
		eor #$f
		ora ($24,x)
lbl_9e0b:	dc.b $19	;?
		ora $a,x
		dc.b $22	;?
		dc.b $e	;?
		dc.b $1b	;?
		bit $10
		asl a
		asl $e,x
		bit $b
		dc.b $22	;?
		dc.b $89	;?
		dc.b $f	;?
		dc.b $2	;?
		bit $19
		ora $a,x
		dc.b $22	;?
		dc.b $e	;?
		dc.b $1b	;?
		bit $10
		asl a
		asl $e,x
		bit $a
		dc.b $22	;?
		cmp #$f
		dc.b $2	;?
		bit $19
		ora $a,x
		dc.b $22	;?
		dc.b $e	;?
		dc.b $1b	;?
		bit $10
		asl a
		asl $e,x
		bit $b
		dc.b $23	;?
		dc.b $22	;?
		dc.b $1a	;?
		and $1
		ora #$8
		dc.b $3	;?
		dc.b $26	;?
		and $1
		ora #$8
		dc.b $8	;?
		dc.b $26	;?
		and $1
		ora #$9
		dc.b $3	;?
		bit $17
lbl_9e52:	dc.b $12	;?
		dc.b $17	;?
lbl_9e54:	dc.b $1d	;?
		dc.b $e	;?
		dc.b $17	;?
		ora $2318
		iny
		dc.b $f	;?
		tax
lbl_9e5d:	rol a
		asl a
lbl_9e5f:	asl a
		asl a
		asl a
		txa
lbl_9e63:	brk
		dc.b $ff	;?
lbl_9e65:	bmi $9e67
lbl_9e67:	brk
		brk
		brk
		cpy #$23
		cld
		pha
		dc.b $ff	;?
		dc.b $23	;?
		cpx #$50
		eor $23,x
		beq lbl_9ebe
		tax
		brk
		and ($20,x)
		lsr $3221
		lsr $e821
		bvc lbl_9ea4
		brk
		dc.b $44	;?
		dc.b $22	;?
		dc.b $1c	;?
		dc.b $44	;?
		dc.b $22	;?
		ldy #$4c
		dc.b $22	;?
		ldy $4c,x
		brk
		dc.b $23	;?
		rts
;--------------------
		rts
;--------------------
		dc.b $23	;?
		dc.b $80	;?
		rts
;--------------------
		dc.b $3f	;?
		brk
		jsr lbl_300f
		bit $f12
		bmi $9ec7
		ora #$f
lbl_9ea0:	bmi $9ec9
lbl_9ea2:	clc
		dc.b $f	;?
lbl_9ea4:	bmi $9ecc
		asl $f
		asl $36,x
		dc.b $12	;?
		dc.b $f	;?
		bmi $9ed5
		dc.b $1a	;?
		dc.b $f	;?
		bmi $9ed9
		asl $f,x
		bmi $9ee7
		dc.b $22	;?
		brk
		dc.b $3f	;?
		brk
		dc.b $14	;?
		dc.b $f	;?
lbl_9ebc:	asl $16,x
lbl_9ebe:	asl $f,x
		dc.b $27	;?
		dc.b $27	;?
		dc.b $27	;?
		dc.b $f	;?
		bmi $9ef2
		dc.b $12	;?
lbl_9ec7:	dc.b $f	;?
		bmi $9ef3
lbl_9eca:	dc.b $19	;?
		dc.b $f	;?
lbl_9ecc:	and $35,x
		and $0,x
		dc.b $3f	;?
		dc.b $8	;?
		dc.b $4	;?
lbl_9ed3:	dc.b $f	;?
		dc.b $f	;?
lbl_9ed5:	dc.b $f	;?
		dc.b $f	;?
lbl_9ed7:	brk
		dc.b $3f	;?
lbl_9ed9:	dc.b $8	;?
		dc.b $4	;?
		dc.b $f	;?
		brk
		dc.b $7	;?
		dc.b $f	;?
		brk
		dc.b $3f	;?
		dc.b $8	;?
		dc.b $4	;?
		dc.b $f	;?
		bpl lbl_9eee
		dc.b $7	;?
lbl_9ee7:	brk
		dc.b $3f	;?
		dc.b $8	;?
		dc.b $4	;?
		dc.b $f	;?
lbl_9eec:	jsr lbl_818
		brk
lbl_9ef0:	dc.b $23	;?
lbl_9ef1:	bne lbl_9f3b
lbl_9ef3:	brk
		dc.b $23	;?
		cld
		bvc lbl_9ea2
		dc.b $23	;?
		inx
		dc.b $8	;?
		dc.b $5a	;?
		tax
		tax
		brk
		brk
		tax
		tax
		dc.b $5a	;?
		brk
		dc.b $23	;?
		cpy #$10
		brk
		brk
		cpy #$30
		brk
lbl_9f0c:	bvc lbl_9f0e
lbl_9f0e:	brk
		eor $55,x
		brk
		brk
		brk
		brk
		eor $55,x
		dc.b $23	;?
		beq lbl_9f2a
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_9f28:	dc.b $ff	;?
		dc.b $ff	;?
lbl_9f2a:	brk
		dc.b $23	;?
		bne lbl_9f86
		brk
		dc.b $23	;?
		inx
		dc.b $8	;?
lbl_9f32:	bvc lbl_9f34
lbl_9f34:	brk
		brk
		brk
		brk
		brk
lbl_9f39:	bvc lbl_9f3b
lbl_9f3b:	dc.b $23	;?
		bne lbl_9f96
		tax
		dc.b $23	;?
		inx
		dc.b $8	;?
		dc.b $5a	;?
		tax
		tax
		brk
		brk
		tax
		tax
		dc.b $5a	;?
		brk
		dc.b $23	;?
		bne lbl_9fa6
		dc.b $ff	;?
		dc.b $23	;?
		inx
		dc.b $8	;?
		dc.b $5f	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $5f	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		ora ($1,x)
		ora ($2,x)
		ora ($2,x)
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $3	;?
		tax
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
lbl_9f82:	dc.b $fc	;?
		sbc $fefd,x
lbl_9f86:	inc $fefe,x
		inc $fefe,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		tax
		sbc $fefe,x
lbl_9f96:	inc $fffe,x
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		tax
		brk
		ora ($1,x)
		ora ($1,x)
		ora ($2,x)
		dc.b $2	;?
lbl_9fa6:	dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		dc.b $4	;?
		dc.b $cc	;?
		dc.b $4	;?
		dc.b $cc	;?
		dc.b $cc	;?
		dc.b $cc	;?
		dc.b $4	;?
		dc.b $cc	;?
		tax
		ora ($2,x)
		brk
		ora ($1,x)
		brk
		ora ($1,x)
		brk
		tax
		ora ($2,x)
		brk
		ora ($1,x)
		dc.b $ff	;?
		ora ($1,x)
		brk
		tax
		ora ($1,x)
		dc.b $ff	;?
		ora ($1,x)
		brk
		ora ($1,x)
		brk
		ora ($1,x)
		ora ($1,x)
		ora ($1,x)
		dc.b $2	;?
		ora ($ff,x)
		tax
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		tax
		dc.b $3	;?
		jsr lbl_103
		ora ($0,x)
		dc.b $4	;?
		ora ($1,x)
		ora ($5,x)
		dc.b $2	;?
		ora ($1,x)
		asl $2
		dc.b $2	;?
		ora ($aa,x)
		dc.b $4	;?
		jsr lbl_307
		dc.b $2	;?
		ora ($8,x)
		dc.b $3	;?
		dc.b $2	;?
		dc.b $2	;?
		ora #$3
		dc.b $2	;?
		dc.b $2	;?
		dc.b $7	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $8	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $2	;?
		ora #$3
		dc.b $3	;?
		dc.b $2	;?
		tax
		dc.b $83	;?
		jsr lbl_30a
		dc.b $3	;?
		dc.b $4	;?
		dc.b $8	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		ora #$3
		dc.b $3	;?
		dc.b $4	;?
		dc.b $7	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		dc.b $8	;?
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		ora #$3
		dc.b $3	;?
		dc.b $4	;?
		tax
		dc.b $83	;?
		ora $7,x
		dc.b $3	;?
		dc.b $3	;?
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $b	;?
		brk
		brk
		brk
		dc.b $54	;?
		ldy #$5b
		ldy #$64
		ldy #$71
		ldy #$7a
		ldy #$87
		ldy #$90
		ldy #$9d
		ldy #$a8
		ldy #$b3
		ldy #$c0
		ldy #$cb
		ldy #$4
		brk
		dc.b $e	;?
		brk
		dc.b $19	;?
		brk
		tax
		dc.b $4	;?
		brk
		dc.b $e	;?
		brk
		dc.b $19	;?
		brk
		dc.b $14	;?
		brk
		tax
		dc.b $4	;?
		brk
		dc.b $e	;?
		brk
		dc.b $19	;?
		brk
		dc.b $4	;?
		brk
		dc.b $e	;?
		brk
		dc.b $19	;?
		brk
		tax
		dc.b $4	;?
		ora ($a,x)
		ora ($24,x)
		ora ($a,x)
		ora ($aa,x)
		dc.b $3	;?
		ora ($a,x)
		ora ($28,x)
		brk
		ora $0
		dc.b $3c	;?
		ora ($6,x)
		ora ($aa,x)
		asl a
		dc.b $2	;?
		asl a
		dc.b $2	;?
		plp
		dc.b $2	;?
		asl a
		dc.b $2	;?
		tax
		asl a
		dc.b $2	;?
		asl a
		dc.b $2	;?
		plp
		ora ($5,x)
		ora ($1a,x)
		dc.b $2	;?
		plp
		dc.b $2	;?
		tax
		dc.b $3	;?
		brk
		asl a
		brk
		plp
		dc.b $2	;?
		ora $0
		plp
		brk
		tax
		dc.b $3	;?
		ora ($a,x)
		ora ($28,x)
		dc.b $2	;?
		ora $1
		plp
		ora ($aa,x)
		asl a
		dc.b $2	;?
		asl a
		ora ($28,x)
		ora ($5,x)
		ora ($28,x)
		dc.b $2	;?
		dc.b $f	;?
		ora ($aa,x)
		dc.b $3	;?
		brk
		asl a
		brk
		plp
		ora ($5,x)
		brk
		ora $0
		tax
		ora ($0,x)
		dc.b $4	;?
		brk
		and $0,x
		dc.b $ff	;?
		brk
		tax
		jsr lbl_482
		dc.b $52	;?
		dc.b $51	;?
		dc.b $3c	;?
		bvc lbl_a0fc
		ldy #$6
		eor ($57,x)
		dc.b $56	;?
		eor $47,x
		dc.b $54	;?
		jsr lbl_6c0
		lsr $5c
		dc.b $5b	;?
		dc.b $5a	;?
		jmp lbl_2059
;--------------------
		cpx #$4
		eor #$61
		eor #$5f
		jsr lbl_49a
		and $3a3c,y
lbl_a0fa:	dc.b $3b	;?
		jsr lbl_6ba
		and $3e47,x
		dc.b $3f	;?
		rti
;--------------------
		eor ($20,x)
		dc.b $da	;?
		asl $42
		jmp lbl_4443
;--------------------
		eor $46
		jsr lbl_4fc
		pha
		eor #$4a
		dc.b $4b	;?
		dc.b $22	;?
		cpx #$4
		eor ($41,x)
		eor ($57,x)
		dc.b $23	;?
		brk
		dc.b $4	;?
		lsr $46
		lsr $5c
		dc.b $23	;?
		jsr lbl_4b04
		dc.b $4b	;?
		dc.b $4b	;?
		adc ($22,x)
		dc.b $fc	;?
		dc.b $4	;?
		rti
;--------------------
		eor ($41,x)
		eor ($23,x)
		dc.b $1c	;?
		dc.b $4	;?
		eor $46
		lsr $46
		dc.b $23	;?
		dc.b $3c	;?
		dc.b $4	;?
		lsr a
		dc.b $4b	;?
		dc.b $4b	;?
		dc.b $4b	;?
		brk
		dc.b $22	;?
		bit $24
		bit $24
		dc.b $22	;?
		inc $90ff,x
		sta ($22),y
		dc.b $fc	;?
		sbc $8f8e,x
		dc.b $22	;?
		dc.b $fa	;?
		dc.b $fb	;?
		sty $2d8d
lbl_a154:	and ($f7,x)
		and ($3,x)
		dc.b $22	;?
		dc.b $ab	;?
		dc.b $22	;?
		dc.b $32	;?
		and ($e8,x)
		and ($1c,x)
		dc.b $22	;?
		ldy $22,x
		dc.b $89	;?
		dc.b $a1	;?
		ldy $a1
		dc.b $19	;?
		asl $13
		asl $89
		dc.b $a1	;?
		dec $22a1,x
		dc.b $3	;?
		dc.b $1f	;?
		dc.b $3	;?
		dc.b $27	;?
		dc.b $4	;?
		tya
		dc.b $a1	;?
		dc.b $fc	;?
		dc.b $a1	;?
		bit $2904
		dc.b $3	;?
		dc.b $ea	;?
		ldx #$0
		brk
		dc.b $3a	;?
		dc.b $4	;?
		dc.b $c3	;?
		ldx #$0
		brk
		dc.b $33	;?
		dc.b $7	;?
		sbc $fefd,x
		inc $fefe,x
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		brk
		sta $fdfe,y
		inc $ffff,x
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		sta $3519,y
		dc.b $1a	;?
		and $19,x
		plp
		dc.b $1a	;?
		plp
		dc.b $19	;?
		dc.b $1a	;?
		dc.b $1a	;?
		dc.b $1a	;?
		dc.b $19	;?
		dc.b $14	;?
		dc.b $1a	;?
		dc.b $14	;?
		dc.b $19	;?
		ora $d1a
		dc.b $19	;?
		dc.b $8	;?
		dc.b $5a	;?
		dc.b $4	;?
		dc.b $5b	;?
		dc.b $4	;?
		dc.b $5c	;?
		dc.b $4	;?
		eor $5e04,y
		dc.b $4	;?
		dc.b $5f	;?
		dc.b $4	;?
		rts
;--------------------
		dc.b $8	;?
		adc ($4,x)
		dc.b $62	;?
		dc.b $4	;?
		dc.b $63	;?
		dc.b $4	;?
		dc.b $64	;?
		dc.b $8	;?
		adc $4
		ror $4
		dc.b $67	;?
		dc.b $4	;?
		pla
		dc.b $4	;?
		adc #$4
		brk
		ror a
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $27	;?
		and $28,x
		and $27,x
		and $28,x
		plp
		dc.b $27	;?
		plp
		plp
		dc.b $1a	;?
		dc.b $27	;?
		dc.b $1a	;?
		plp
		dc.b $1a	;?
		dc.b $27	;?
		dc.b $14	;?
		plp
		ora $2700
		ora $828
		dc.b $27	;?
		dc.b $8	;?
		plp
		dc.b $8	;?
		dc.b $ff	;?
		bit $2d50
		and $2c,x
		plp
		and $2c1a
		dc.b $1a	;?
		and $2c14
		dc.b $14	;?
		and $2c0e
		dc.b $e	;?
		brk
		and $2c08
		dc.b $8	;?
		and $2c08
		dc.b $8	;?
		and $ff04
		dc.b $17	;?
		dc.b $17	;?
		dc.b $17	;?
		dc.b $17	;?
		clc
		clc
		clc
		dc.b $ff	;?
		and $25
		and $25
		and $26
		dc.b $26	;?
		dc.b $26	;?
		dc.b $26	;?
		dc.b $26	;?
		ora ($25,x)
		and $25
		and $25
		dc.b $ff	;?
		ora ($2,x)
		dc.b $3	;?
		dc.b $ff	;?
		dc.b $2	;?
		ora ($3,x)
		dc.b $ff	;?
		brk
		dc.b $3	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $fb	;?
		sbc $fefe,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		tax
		dc.b $f7	;?
		dc.b $f8	;?
		dc.b $fa	;?
		dc.b $fb	;?
		dc.b $fc	;?
		sbc $fefe,x
		inc $fefe,x
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		brk
		dc.b $ff	;?
		tax
		jsr lbl_163
		rol a
		jsr lbl_36b
		dc.b $2b	;?
		bit $2d
		jsr lbl_275
		and #$2a
lbl_a26b:	brk
		dc.b $f4	;?
		beq lbl_a26f
lbl_a26f:	rti
;--------------------
		dc.b $f4	;?
		beq lbl_a273
lbl_a273:	jmp lbl_f0f4
;--------------------
		brk
		cli
lbl_a278:	dc.b $f4	;?
		beq lbl_a27c
		tay
lbl_a27c:	dc.b $f4	;?
		beq lbl_a280
lbl_a27f:	ldy $f4,x
		beq lbl_a284
		cpy #$f4
		sbc ($0),y
lbl_a287:	sec
		jsr lbl_66e
		brk
		jsr lbl_664
		brk
		jsr lbl_677
		brk
		bpl lbl_a283
		dc.b $2	;?
		jmp ($ed10)
		dc.b $42	;?
		dc.b $73	;?
		bpl lbl_a28b
		dc.b $2	;?
		sty $10
		sbc $8b42
		sbc $fefe,x
lbl_a2a7:	inc $ffff,x
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		ora ($0,x)
		ora ($0,x)
		ora ($1,x)
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		tax
		inc $fefe,x
		dc.b $ff	;?
		cmp $ff34,x
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		cmp $ff35,x
		dc.b $ff	;?
		brk
		dc.b $ff	;?
		dc.b $cc	;?
		ora ($dd,x)
		rol $0,x
		brk
		brk
		brk
		brk
		brk
		dc.b $cc	;?
		ora $dd
		dc.b $59	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		inc $fefe
		inc $ddff,x
		dc.b $3b	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		cmp $3c,x
		brk
		brk
		cmp $52,x
		brk
		brk
		cmp $51,x
		brk
		brk
		inc $4c22
		dc.b $8	;?
		dc.b $19	;?
		ora ($a),y
		dc.b $1c	;?
		dc.b $e	;?
		bit $24
		bit $23
		eor ($4,x)
		dc.b $19	;?
		dc.b $2e	;?
		bit $24
		brk
		and ($89,x)
		dc.b $f	;?
		dc.b $1d	;?
		dc.b $e	;?
		dc.b $1c	;?
		dc.b $1d	;?
		bit $22
		clc
		asl $241b,x
		dc.b $1c	;?
		dc.b $14	;?
		dc.b $12	;?
		ora $15,x
		jsr lbl_68d
		bmi $a35f
		and ($%),y
		and ($%),y
		jsr lbl_6ad
		dc.b $33	;?
		dc.b $2	;?
		brk
		ror $0
		dc.b $34	;?
		jsr lbl_6cd
		and $36,x
		rol $36,x
		rol $37,x
		brk
		and ($ee,x)
		dc.b $44	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $db	;?
		dc.b $2	;?
		jsr lbl_80
		and ($ec,x)
		dc.b $42	;?
		dc.b $97	;?
		and ($f2,x)
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $db	;?
		dc.b $2	;?
		brk
lbl_a35b:	brk
		brk
		and ($ea,x)
lbl_a35f:	dc.b $42	;?
		dc.b $97	;?
		and ($f4,x)
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $da	;?
		dc.b $4	;?
		jsr lbl_0
		dc.b $80	;?
		brk
		and ($e8,x)
		dc.b $42	;?
		dc.b $97	;?
		and ($f6,x)
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $da	;?
		dc.b $4	;?
		brk
		brk
		brk
		brk
		brk
		dc.b $22	;?
		dc.b $2e	;?
		dc.b $44	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $e3	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $8	;?
		brk
		dc.b $22	;?
		bit $9742
		dc.b $22	;?
		dc.b $32	;?
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $e3	;?
		dc.b $2	;?
		brk
		brk
		brk
		dc.b $22	;?
		rol a
		dc.b $42	;?
		dc.b $97	;?
		dc.b $22	;?
		dc.b $34	;?
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		dc.b $e2	;?
		dc.b $4	;?
		dc.b $2	;?
		brk
		brk
		dc.b $8	;?
		brk
		dc.b $22	;?
		plp
		dc.b $42	;?
		dc.b $97	;?
		dc.b $22	;?
		rol $42,x
		dc.b $97	;?
		dc.b $23	;?
		dc.b $e2	;?
		dc.b $4	;?
		brk
		brk
		brk
		brk
		brk
		dc.b $22	;?
		ldy $44
		dc.b $97	;?
		dc.b $23	;?
lbl_a3ba:	sbc #$1
		bvc lbl_a3be
lbl_a3be:	dc.b $22	;?
		ldx #$42
		dc.b $97	;?
		dc.b $22	;?
		tay
lbl_a3c4:	dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
		inx
		dc.b $3	;?
		dc.b $52	;?
		brk
		dc.b $8	;?
		brk
		dc.b $22	;?
		ldy #$42
		dc.b $97	;?
		dc.b $22	;?
lbl_a3d2:	tax
		dc.b $42	;?
		dc.b $97	;?
		dc.b $23	;?
lbl_a3d6:	inx
		dc.b $3	;?
		bvc lbl_a3da
lbl_a3da:	brk
		brk
		dc.b $22	;?
		clv
		dc.b $44	;?
		dc.b $97	;?
		dc.b $23	;?
		inc $5001
		brk
		dc.b $22	;?
		ldx $42,x
		dc.b $97	;?
lbl_a3e9:	dc.b $22	;?
		ldy $9742,x
		dc.b $23	;?
		sbc $203
		brk
		cli
		brk
		dc.b $22	;?
		ldy $42,x
		dc.b $97	;?
		dc.b $22	;?
		ldx $9742,x
		dc.b $23	;?
		sbc $3
		brk
		bvc lbl_a403
lbl_a403:	brk
		dc.b $3	;?
		dc.b $ff	;?
		dc.b $3	;?
		brk
		dc.b $3	;?
		brk
		dc.b $3	;?
		dc.b $ff	;?
		dc.b $3	;?
		ora ($3,x)
		ora ($3,x)
		brk
		dc.b $3	;?
		ora ($3,x)
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $3	;?
		dc.b $2	;?
		dc.b $3	;?
		ora ($3,x)
		ora ($3,x)
		ora ($3,x)
		ora ($4,x)
		brk
		dc.b $4	;?
		ora ($4,x)
		brk
		dc.b $4	;?
		ora ($4,x)
		ora ($aa,x)
		brk
		ora ($2,x)
		dc.b $2	;?
		ora ($0,x)
		tax
		brk
		jmp lbl_4201
;--------------------
		brk
		asl a
		dc.b $2	;?
		bpl lbl_a3c8
		and $0,x
lbl_a448:	bpl lbl_a44b
		bpl lbl_a44c
lbl_a44c:	jsr lbl_3580
		dc.b $2	;?
		rts
;--------------------
		brk
		bpl lbl_a3d6
		and $2,x
		jsr lbl_3c00
		ora ($28,x)
		sta ($30,x)
		ora ($30,x)
		brk
		asl a
		dc.b $2	;?
		pha
		dc.b $82	;?
lbl_a464:	and $2,x
		bpl lbl_a468
lbl_a468:	asl $1
		bpl lbl_a3ed
		and $aa,x
		brk
		plp
		dc.b $2	;?
		dc.b $42	;?
		brk
		asl a
		ora ($14,x)
		sta ($28,x)
		sta ($14,x)
		brk
		asl a
		dc.b $2	;?
		asl $5082,x
		dc.b $2	;?
		rts
;--------------------
		brk
		asl $1
lbl_a485:	rol a
		dc.b $80	;?
		bmi $a489
lbl_a489:	dc.b $14	;?
		ora ($30,x)
		dc.b $82	;?
		rti
;--------------------
		dc.b $2	;?
lbl_a48f:	and $1,x
		bvc lbl_a493
lbl_a493:	dc.b $42	;?
		ora ($ff,x)
lbl_a496:	ora ($3,x)
		dc.b $2	;?
		dc.b $3	;?
		dc.b $ff	;?
		brk
		dc.b $4	;?
		ora $ff
		asl $10
		ora ($12),y
		dc.b $ff	;?
		asl a
		dc.b $13	;?
		dc.b $13	;?
		dc.b $14	;?
		dc.b $14	;?
		ora $15,x
		dc.b $ff	;?
		dc.b $f	;?
		dc.b $1f	;?
		dc.b $1f	;?
		jsr lbl_1f20
		dc.b $1f	;?
		and ($21,x)
		dc.b $ff	;?
		dc.b $17	;?
		dc.b $22	;?
		dc.b $22	;?
		dc.b $23	;?
		dc.b $23	;?
		dc.b $22	;?
		dc.b $22	;?
		bit $24
		dc.b $ff	;?
		and ($29,x)
		rol a
		dc.b $2b	;?
		rol a
		dc.b $ff	;?
		dc.b $2b	;?
		dc.b $2e	;?
		dc.b $2f	;?
		bmi $a4fc
		dc.b $32	;?
		dc.b $ff	;?
		and ($%),y
		sec
		and $38ff,y
		eor ($41,x)
		dc.b $42	;?
		dc.b $42	;?
		dc.b $43	;?
		dc.b $43	;?
		dc.b $44	;?
		dc.b $44	;?
		dc.b $ff	;?
		and $a50f,x
		dc.b $13	;?
		lda $1c
		lda $21
		lda $26
		lda $29
		lda $32
		lda $3b
		lda $40
		lda $49
		lda $54
		lda $5f
		lda $6a
		lda $75
lbl_a4f8:	lda $80
		lda $8b
lbl_a4fc:	lda $96
		lda $a1
		lda $ac
		lda $b7
		lda $c2
		lda $cd
		lda $d8
		lda $e3
		lda $ee
		lda $f0
		dc.b $f8	;?
		beq lbl_a513
lbl_a513:	dc.b $f8	;?
		dc.b $f8	;?
		dc.b $f8	;?
		brk
		brk
		dc.b $f8	;?
		brk
		brk
		dc.b $80	;?
		dc.b $fc	;?
		dc.b $f8	;?
		dc.b $fc	;?
		brk
		dc.b $80	;?
		dc.b $f8	;?
		dc.b $fc	;?
		brk
		dc.b $fc	;?
		dc.b $80	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $80	;?
		dc.b $f4	;?
		dc.b $f4	;?
		dc.b $f4	;?
		dc.b $4	;?
		dc.b $4	;?
		dc.b $f4	;?
		dc.b $4	;?
		dc.b $4	;?
		dc.b $80	;?
		dc.b $f9	;?
		dc.b $f9	;?
		dc.b $f9	;?
		brk
		brk
		dc.b $f9	;?
		brk
		brk
		dc.b $80	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $4	;?
		dc.b $fc	;?
		dc.b $80	;?
		inc $f6,x
		inc $2,x
		dc.b $2	;?
		inc $2,x
		dc.b $2	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		dc.b $f8	;?
		dc.b $f8	;?
		brk
		brk
		dc.b $f8	;?
		brk
		brk
		dc.b $80	;?
		brk
		dc.b $fa	;?
		inc $fa,x
		inc $2,x
		inc $fefa,x
		dc.b $2	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f4	;?
		dc.b $fc	;?
		dc.b $f4	;?
		dc.b $4	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $fc	;?
		dc.b $4	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f2	;?
		inc $6f2,x
		dc.b $fa	;?
		inc $6fa,x
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f4	;?
		brk
		dc.b $f4	;?
		dc.b $8	;?
		dc.b $fc	;?
		brk
		dc.b $fc	;?
		dc.b $8	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		inc $2,x
		inc $a,x
		inc $fe02,x
		asl a
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		dc.b $4	;?
		dc.b $f8	;?
		dc.b $c	;?
		brk
		dc.b $4	;?
		brk
		dc.b $c	;?
		dc.b $80	;?
		inc $f8fa,x
		dc.b $4	;?
		dc.b $f8	;?
		dc.b $c	;?
		brk
		dc.b $4	;?
		brk
		dc.b $c	;?
		dc.b $80	;?
		inc $f8fa,x
		dc.b $4	;?
		dc.b $f8	;?
		dc.b $c	;?
		brk
		dc.b $4	;?
		brk
		dc.b $c	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		dc.b $4	;?
		dc.b $f8	;?
		dc.b $c	;?
		brk
		dc.b $4	;?
		brk
		dc.b $c	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f7	;?
		dc.b $2	;?
		dc.b $f7	;?
		asl a
		dc.b $ff	;?
		dc.b $2	;?
		dc.b $ff	;?
		asl a
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		brk
		dc.b $f8	;?
		dc.b $8	;?
		brk
		brk
		brk
		dc.b $8	;?
lbl_a5cc:	dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f7	;?
		inc $6f7,x
		dc.b $ff	;?
		inc $6ff,x
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		dc.b $fc	;?
		dc.b $f8	;?
		dc.b $4	;?
		brk
		dc.b $fc	;?
		brk
		dc.b $4	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f7	;?
		dc.b $fa	;?
		dc.b $f7	;?
		dc.b $2	;?
		dc.b $ff	;?
		dc.b $fa	;?
		dc.b $ff	;?
		dc.b $2	;?
		dc.b $80	;?
		brk
		dc.b $fa	;?
		dc.b $f8	;?
		dc.b $f8	;?
		dc.b $f8	;?
		brk
		brk
		dc.b $f8	;?
		brk
		brk
		dc.b $80	;?
		dc.b $cf	;?
		ldx $d6
		ldx $dd
		ldx $e4
		ldx $eb
		ldx $f2
		ldx $f9
		ldx $0
		dc.b $a7	;?
		ora $a7
		asl a
		dc.b $a7	;?
		ora ($a7),y
		clc
		dc.b $a7	;?
		dc.b $1f	;?
		dc.b $a7	;?
		dc.b $26	;?
		dc.b $a7	;?
		and #$a7
		bit $2fa7
		dc.b $a7	;?
		dc.b $32	;?
		dc.b $a7	;?
		dc.b $37	;?
		dc.b $a7	;?
		dc.b $3c	;?
		dc.b $a7	;?
		eor ($a7,x)
		lsr $a7
		dc.b $4b	;?
		dc.b $a7	;?
		bvc lbl_a5d0
		eor $a7,x
		dc.b $5a	;?
		dc.b $a7	;?
		dc.b $5f	;?
		dc.b $a7	;?
		dc.b $64	;?
		dc.b $a7	;?
		adc #$a7
		ror $73a7,x		;RAM Expansion
		dc.b $a7	;?
		dc.b $7a	;?
		dc.b $a7	;?
		dc.b $7f	;?
		dc.b $a7	;?
		sty $a7
		dc.b $89	;?
		dc.b $a7	;?
		stx $93a7
		dc.b $a7	;?
		tya
		dc.b $a7	;?
		sta $a2a7,x
		dc.b $a7	;?
		dc.b $a7	;?
		dc.b $a7	;?
		ldy $b1a7
		dc.b $a7	;?
		ldx $a7,x
		dc.b $bb	;?
		dc.b $a7	;?
		cpy #$a7
		cmp $a7
		iny
		dc.b $a7	;?
		dc.b $cb	;?
		dc.b $a7	;?
		dec $d1a7,x
		dc.b $a7	;?
		dc.b $d4	;?
		dc.b $a7	;?
		dec $a7,x
		cld
		dc.b $a7	;?
		dc.b $da	;?
		dc.b $a7	;?
		dc.b $df	;?
		dc.b $a7	;?
		cpx $a7
		sbc #$a7
		inc $f3a7
		dc.b $a7	;?
		dc.b $f8	;?
		dc.b $a7	;?
		sbc $ffa7,x
		dc.b $a7	;?
		ora ($a8,x)
		dc.b $4	;?
		tay
		ora #$a8
		dc.b $e	;?
		tay
		dc.b $13	;?
		tay
		dc.b $1a	;?
		tay
		and ($a8,x)
		dc.b $26	;?
		tay
		dc.b $2b	;?
		tay
		dc.b $32	;?
		tay
		and $3ba8,y
		tay
		and $41a8,x
		tay
		eor $a8
		dc.b $47	;?
		tay
		eor #$a8
		dc.b $4b	;?
		tay
		dc.b $56	;?
		tay
		adc ($a8,x)
		ror $a8
		adc #$a8
		jmp ($6fa8)		;RAM Expansion
		tay
		dc.b $72	;?
		tay
		adc $a8,x
		sei
		tay
		dc.b $7b	;?
		tay
		sta ($a8,x)
		dc.b $87	;?
		tay
		sta $93a8
		tay
		sta $9fa8,y
		tay
		lda $a8
		dc.b $ab	;?
		tay
		ldy ($a8),y
		dc.b $bb	;?
		tay
		cmp $a8
		dc.b $cf	;?
		tay
		cmp $e3a8,y
		tay
		sbc $f7a8
		tay
		brk
		brk
		ora ($10,x)
		ora ($12),y
		dc.b $13	;?
		brk
		brk
		ora ($2,x)
		dc.b $3	;?
		dc.b $4	;?
		ora $0
		asl $7
		dc.b $8	;?
		ora #$a
		dc.b $b	;?
		brk
		brk
		ora ($c,x)
		ora $f0e
		brk
		dc.b $22	;?
		dc.b $23	;?
		bit $25
		dc.b $26	;?
		dc.b $27	;?
		brk
		dc.b $22	;?
		dc.b $23	;?
		bit $25
		plp
		and #$0
		dc.b $14	;?
		ora $16,x
		dc.b $17	;?
		clc
		dc.b $19	;?
		ora ($1a,x)
		dc.b $1b	;?
		dc.b $1c	;?
		dc.b $1d	;?
		ora ($1e,x)
		dc.b $1f	;?
		jsr lbl_21
		rol a
		dc.b $2b	;?
		bit $2e2d
		dc.b $2f	;?
		brk
		bmi $a745
		dc.b $32	;?
		dc.b $33	;?
		dc.b $34	;?
		and $0,x
		rol $37,x
		bit $2e2d
		dc.b $2f	;?
		brk
		sec
		and $3332,y
		dc.b $34	;?
		and $2,x
		sbc $2ed
		inc $2ee
		dc.b $ef	;?
		dc.b $ef	;?
		dc.b $2	;?
		dc.b $e3	;?
		cpx $1
		sbc $e6
		dc.b $e7	;?
		inx
		ora ($e9,x)
		dc.b $ea	;?
		dc.b $eb	;?
		cpx $3c01
		and $3f3e,x
		ora ($40,x)
		eor ($42,x)
lbl_a745:	dc.b $43	;?
		ora ($3c,x)
		and $4544,x
		ora ($fa,x)
		dc.b $fb	;?
		dc.b $fc	;?
		sbc $f201,x
		dc.b $f3	;?
		dc.b $f4	;?
		sbc $1,x
		inc $f7,x
		dc.b $f8	;?
		dc.b $f9	;?
		ora ($46,x)
		dc.b $47	;?
		pha
		eor #$1
		lsr a
		dc.b $4b	;?
		jmp lbl_14d
;--------------------
		lsr $504f
		dc.b $51	;?
		ora ($52,x)
		dc.b $52	;?
		dc.b $54	;?
		eor $1,x
		dc.b $56	;?
		dc.b $57	;?
		cli
		dc.b $59	;?
		ora ($ff,x)
		dc.b $80	;?
		cli
		dc.b $59	;?
		dc.b $56	;?
		dc.b $57	;?
		ora ($5a,x)
		dc.b $5b	;?
		dc.b $5c	;?
		eor $fe01,y
		dc.b $5e	;?
		dc.b $5f	;?
		rts
;--------------------
		ora ($61,x)
		dc.b $62	;?
		dc.b $63	;?
		dc.b $64	;?
		ora ($6b,x)
		jmp ($6e6d)		;RAM Expansion
		ora ($6f,x)
		bvs lbl_a803
		dc.b $72	;?
		ora ($6b,x)
		jmp ($7473)		;RAM Expansion
		ora ($65,x)
		ror $67
		pla
		dc.b $3	;?
		dc.b $ff	;?
		rti
;--------------------
lbl_a7a0:	adc #$6a
		ora ($75,x)
		dc.b $76	;?
		dc.b $77	;?
		sei
		ora ($79,x)
		dc.b $7a	;?
		dc.b $77	;?
		sei
		ora ($85,x)
		stx $87
		dey
		ora ($89,x)
		txa
		dc.b $8b	;?
		sty $8d01
		stx $908f
		ora ($91,x)
		dc.b $92	;?
		dc.b $93	;?
		sty $1,x
		sta $96,x
		dc.b $97	;?
		tya
		dc.b $3	;?
		iny
		cmp #$3
		dex
		dc.b $cb	;?
		dc.b $3	;?
		dc.b $cc	;?
		cmp $ce03
		dc.b $cf	;?
		dc.b $3	;?
		bne lbl_a7a5
		dc.b $4	;?
		dc.b $da	;?
		dc.b $4	;?
		dc.b $db	;?
		dc.b $4	;?
		dc.b $dc	;?
		ora ($dd,x)
		dec $e0df,x
		ora ($99,x)
		txs
		dc.b $9b	;?
		dc.b $9c	;?
		ora ($9d,x)
		dc.b $9e	;?
		dc.b $9f	;?
		ldy #$1
		dc.b $a1	;?
		ldx #$a3
		ldy $1
		lda $a6
		dc.b $a7	;?
		tay
		ora ($a9,x)
		tax
		dc.b $ab	;?
		ldy $ad08
		ldx $b0af
		dc.b $4	;?
lbl_a7fe:	dc.b $7b	;?
		dc.b $4	;?
		dc.b $7c	;?
		dc.b $7	;?
		adc $77e,x
		dc.b $ff	;?
		rti
;--------------------
		adc $17e,x
		ldy ($b2),y
		dc.b $b3	;?
		ldy $1,x
		lda $b6
		dc.b $b7	;?
		clv
		ora ($ff,x)
		cpy #$b4
		dc.b $b3	;?
		dc.b $b2	;?
		ldy ($1),y
		dc.b $ff	;?
		cpy #$b8
		dc.b $b7	;?
		ldx $b5,x
		ora ($b9,x)
		dc.b $ba	;?
		dc.b $bb	;?
		ldy $bd01,x
		ldx $c0bf,x
		ora ($ff,x)
		cpy #$bc
		dc.b $bb	;?
		dc.b $ba	;?
		lda $ff01,y
		cpy #$c0
		dc.b $bf	;?
		ldx $4bd,x
		cmp ($4,x)
		dc.b $c2	;?
		dc.b $4	;?
		dc.b $ff	;?
		cpy #$c2
		dc.b $4	;?
		dc.b $ff	;?
		cpy #$c1
		dc.b $4	;?
		dc.b $c3	;?
		dc.b $4	;?
		cpy $4
		cmp $6
		dec $ff
		rti
;--------------------
		dec $ff
		cpy #$c6
		dc.b $ff	;?
		rti
;--------------------
		dec $6
		dc.b $c7	;?
		dc.b $ff	;?
		rti
;--------------------
		dc.b $c7	;?
		dc.b $ff	;?
		cpy #$c7
		dc.b $ff	;?
		rti
;--------------------
		dc.b $c7	;?
		ora $ad
		ldx $b0af
		dc.b $2	;?
		dc.b $d3	;?
		cmp $d402,y
		cmp $d502,y
		cmp $d602,y
		cmp $d702,y
		cmp $d802,y
		cmp $e103,y
		dc.b $e2	;?
		ora #$56
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $a,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $b,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $c,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $d,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $e,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $f,x
		dc.b $56	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $f,x
		dc.b $56	;?
		lsr $504f
		dc.b $51	;?
		bpl lbl_a903
		lsr $504f
		dc.b $51	;?
		ora ($ff),y
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		lsr $504f
		dc.b $51	;?
		dc.b $12	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $13,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $14,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $15,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $16,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $17,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
		dc.b $53	;?
		dc.b $54	;?
		eor $18,x
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $56	;?
		dc.b $ff	;?
		dc.b $80	;?
		dc.b $52	;?
lbl_a8fe:	dc.b $53	;?
		dc.b $54	;?
		eor $ff,x
		dc.b $ff	;?
lbl_a903:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_a979:	brk
		brk
		brk
		bpl lbl_a97e
lbl_a97e:	brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_a9ec:	brk
		brk
		brk
		bpl lbl_a9f1
lbl_a9f1:	brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_a9f8:	brk
		brk
		brk
		bpl lbl_a9fd
lbl_a9fd:	brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($8,x)
		brk
		brk
		brk
		dc.b $80	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_aabb:	brk
		brk
		brk
		brk
		bpl lbl_aac0
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		jsr lbl_0
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_ad08:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_b003:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		jsr lbl_0
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		ora ($0,x)
		ora ($0,x)
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
lbl_b078:	brk
		dc.b $8	;?
		brk
		bpl lbl_b07d
lbl_b07d:	dc.b $4	;?
		eor ($1,x)
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		jsr lbl_100
		brk
		brk
		dey
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_b0af:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($1,x)
		brk
lbl_b0bb:	brk
		brk
		brk
		dc.b $2	;?
		bpl lbl_b0c0
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		brk
		jsr lbl_20
		dc.b $2	;?
		dc.b $80	;?
		brk
		bpl lbl_b110
		dc.b $2	;?
		brk
		brk
		brk
		dey
		brk
		brk
		brk
		ora ($0,x)
		dc.b $17	;?
		brk
		dc.b $80	;?
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_b10b:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_b110:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		rti
;--------------------
		dc.b $80	;?
		brk
lbl_b123:	jsr lbl_8
		bpl lbl_b128
lbl_b128:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		dc.b $8	;?
		brk
		dc.b $8	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		jsr lbl_0
		brk
		adc ($0,x)
		brk
		brk
		dc.b $2	;?
		brk
		dc.b $80	;?
		brk
		rti
;--------------------
		brk
		brk
		brk
		dc.b $4	;?
		brk
		dc.b $2	;?
		brk
		ora ($10,x)
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		dc.b $c	;?
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $4	;?
		jsr lbl_8002
		brk
		rti
;--------------------
		brk
lbl_b1a7:	brk
		rti
;--------------------
		brk
		brk
		dc.b $4	;?
		rti
;--------------------
		rti
;--------------------
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_b1ba:	brk
		brk
		sty $0
		brk
		bpl lbl_b1c0
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		ora ($0,x)
		ora ($0,x)
		dc.b $2	;?
		brk
		brk
		jsr lbl_0
		brk
		brk
		dc.b $80	;?
		brk
		jsr lbl_0
		ora ($80,x)
		dc.b $2	;?
		dc.b $80	;?
		dc.b $2	;?
		brk
		jsr lbl_1000
		brk
		brk
		dc.b $4	;?
		bit $1
		dc.b $4	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		brk
		jsr lbl_0
		ora ($0,x)
		dc.b $80	;?
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		dc.b $8	;?
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		ora ($12,x)
		brk
		dc.b $80	;?
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		ora ($0,x)
		dc.b $2	;?
		brk
		brk
		dc.b $4	;?
		brk
		cpy #$0
		rti
;--------------------
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $4	;?
		dc.b $4	;?
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		jsr lbl_0
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $c	;?
		brk
		brk
		brk
		brk
		dc.b $80	;?
		jsr lbl_ff00
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		ora #$4
		brk
		brk
		brk
		brk
lbl_b2e6:	ldy #$0
		brk
		brk
		bpl lbl_b2ec
lbl_b2ec:	brk
		brk
		brk
		bvc lbl_b2f1
lbl_b2f1:	brk
		dc.b $80	;?
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		dc.b $8	;?
		dc.b $80	;?
		brk
		brk
		ora ($44,x)
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $2	;?
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		dc.b $2	;?
		brk
		dc.b $80	;?
		brk
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		jsr lbl_ffff
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		jsr lbl_0
		dc.b $4	;?
		brk
		dc.b $42	;?
		brk
		brk
		brk
		brk
lbl_b371:	sty $20
		bpl lbl_b377
		brk
		brk
lbl_b377:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $80	;?
		dc.b $4	;?
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($4,x)
		brk
		brk
		ldy #$30
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		rti
;--------------------
		ora ($40,x)
		brk
		dc.b $4	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		dc.b $4	;?
lbl_b3f0:	brk
		dc.b $4	;?
		dc.b $42	;?
		brk
		bpl lbl_b3f6
lbl_b3f6:	brk
		brk
		dc.b $80	;?
		brk
		brk
		ora ($40,x)
		brk
		bpl lbl_b460
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $bfff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		inc $ffdf,x
		dc.b $ff	;?
		dc.b $fa	;?
		dc.b $ff	;?
		inc $7fff,x		;RAM Expansion
		dc.b $ff	;?
		inc $cfff,x
lbl_b460:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f9	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		sbc $ff,x
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ff,x
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		inc $df,x
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $3f	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		inc $ffff,x
		dc.b $df	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $fdff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $7f	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ef	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		sbc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $f7	;?
		inc $dfff,x
		dc.b $f7	;?
		inc $ff,x
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
lbl_b802:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		jsr lbl_0
		brk
		brk
		brk
		brk
		jsr lbl_0
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		rti
;--------------------
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $4	;?
		brk
		brk
		brk
		brk
		brk
		brk
lbl_b967:	brk
		brk
		brk
		brk
		bpl lbl_b96d
lbl_b96d:	brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		jsr lbl_2000
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		brk
		brk
		bit $40
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		dc.b $4	;?
		dc.b $8	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_b9f9:	brk
		brk
		brk
		brk
		bpl lbl_b9ff
lbl_b9ff:	brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_ba34:	brk
		brk
		brk
		brk
		bpl lbl_ba3a
lbl_ba3a:	brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $8	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		ora ($0,x)
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		brk
		ora ($0,x)
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $80	;?
		brk
		rts
;--------------------
		dc.b $fa	;?
		dc.b $af	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		inc $ab
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		dc.b $2	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		ora ($0,x)
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		bpl lbl_bbf0
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		rti
;--------------------
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		brk
		brk
		brk
lbl_bbea:	brk
		brk
		brk
		brk
		brk
		brk
lbl_bbf0:	brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $4	;?
		dec $5,x
		bmi $bc1b
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_bc15:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
lbl_bc1b:	dc.b $f7	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
lbl_bd01:	dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		inc $ffff,x
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $7f	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $bf	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		dc.b $bf	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $77	;?
		dc.b $83	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $54	;?
		dc.b $43	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $df	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $fb	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		dc.b $ff	;?
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
		brk
lbl_bffc:	dc.b $d7	;?
		dc.b $c7	;?
		and $d8fb,y

ROM information:
==================

Lines disassembled: 12078 (4770 unknown/illegal/possible data)
RAM Expansion: found
PCM/RAW audio: not found
