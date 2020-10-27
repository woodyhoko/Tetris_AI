INCLUDE Irvine32.inc
includelib user32.lib
includelib irvine32.lib
includelib kernel32.lib

main	EQU start@0

.data
numb byte 0
gg byte 0
cursorinfo CONSOLE_CURSOR_INFO <50,FALSE>
gamemode byte 1
menuselect byte 0
outputHandle DWORD 0
filehandle dword 0
filename byte "airecord.txt",0
filehandle2 dword 0
filename2 byte "bestai.txt",0
filehandle3 dword 0
filename3 byte "highscore.txt",0
cursorxy COORD <0,0>
countdown word 0
timeloop word 100
cblue word 9fh,9fh
cwhite word 0ffh,0ffh
cred word 4fh,4fh,4fh,4fh,4fh,4fh,4fh
coran word 0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h
cyellow word 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h
cgreen word 2fh,2fh,2fh,2fh,2fh,2fh,2fh
cbluee word 1fh,1fh,1fh,1fh,1fh,1fh,1fh
cpurple word 5fh,5fh,5fh,5fh,5fh,5fh,5fh
cblack word 0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh
cwb word 0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h
cwb2 word 0b0h,0b0h,0b0h,0b0h,0b0h,0b0h,0b0h,0b0h
pointin byte "Lines : "
point dword 0
backu byte 0c9h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bbh,0
backw byte 0bah,0
backd byte 0c8h,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0cdh,0bch,0
brick byte 0dbh,0dbh
blink byte 0,0
bline byte "__"
dline byte "____________________"
ans1 byte 0dbh,0
ans2 byte "no",0
answer dword ?
count dword 0
nowshape word 0
nowpos	COORD <0,0>,<0,0>,<0,0>,<0,0>
shape	byte 0,1
		byte 2,3
		byte 4,7
		byte 8,11
		byte 12,15
		byte 16,17
		byte 18,18
titt1	byte " _____  ___  _____  ___  ___  ___ "
titt2	byte "|_   _|| __||_   _|| _ \|_ _|/ __|"
titt3	byte "  | |  | _|   | |  |   / | | \__ \"
titt4	byte "  |_|  |___|  |_|  |_|_\|___||___/"
tit1	byte "      ___    _    __  __  ___ "
tit2	byte "     / __|  /_\  |  \/  || __|"
tit3	byte "    | (_ | / _ \ | |\/| || _| "
tit4	byte "     \___|/_/ \_\|_|  |_||___|"
gmov1	byte "   ___                        "
gmov2	byte " / __| __ _  _ __   ___      "
gmov3	byte "| (_ |/ _` || '  \ / -_)     "
gmov4	byte " \___|\__,_||_|_|_|\___|     "
gmov5	byte "            ___                 "
gmov6	byte "           / _ \ __ __ ___  _ _ "
gmov7	byte "          | (_) |\ V // -_)| '_|"
gmov8	byte "           \___/  \_/ \___||_|  "
cleantit	byte "                                     "
idword	byte "by 104501527"
boxu2		byte 0dah,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0bfh
scoreword	byte 0b3h,"Score :           ",0b3h
boxd2		byte 0c0h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0d9h
boxu		byte 0dah,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0bfh
normword	byte 0b3h," Normal ",0b3h
hellword	byte 0b3h,"  Hell  ",0b3h
autoword	byte 0b3h,"  Auto  ",0b3h
exitword	byte 0b3h,"  exit  ",0b3h
boxd		byte 0c0h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0c4h,0d9h

shapescore dword 0,0,0,0,0,0,0
findingshape COORD <0,0>,<0,0>,<0,0>,<0,0>
tempshape byte 0
tempshapescore dword 0

expectpos COORD <0,0>,<0,0>,<0,0>,<0,0>
expectshape byte 0
expectmov word 0
temppos COORD <0,0>,<0,0>,<0,0>,<0,0>
tempsaveline dword 0,0,0,0
startc byte 0
startcc byte 0
ttp dword 0
tts dword 0
ttt dword 0
whitec byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
linepoint dword 0
;ain dword 90,7,48,78,1,0,35,14,16,1,74
ain dword 210,31,92,204,43,8,46,41,17,71,123
lastscore dword 0
temptimes dword 0
aindelta dword 0
ainn dword 10
nowscore dword 0
trainai dword 0
deltadir dword 1
airecord dword 0,0,0,0,0,0,0,0,0,0,0
bestaiscore dword 0
bestain dword 0,0,0,0,0,0,0,0,0,0,0
bestscorell byte "____________________________________________"

ascore dword 0
bscore dword 0
cscore dword 0
nhs byte "new high score !"
hs byte "highest score : "
hiw byte "highest"
scw byte "score"
hswl byte "----------"
exityn byte "exit the game?",0
exittit byte "Exit",0

shapeinfo2	COORD <0,1>,<1,1>,<1,2>,<2,2>
			COORD <1,1>,<2,1>,<1,2>,<2,0>
			COORD <0,2>,<1,2>,<1,1>,<2,1>
			COORD <0,0>,<0,1>,<1,1>,<1,2>
			COORD <0,1>,<0,2>,<1,2>,<2,2>
			COORD <1,1>,<1,3>,<1,2>,<2,1>
			COORD <0,1>,<1,1>,<2,1>,<2,2>
			COORD <1,2>,<2,1>,<2,2>,<2,0>
			COORD <0,2>,<2,2>,<1,2>,<2,1>
			COORD <1,0>,<1,1>,<1,2>,<2,2>
			COORD <0,1>,<0,2>,<1,1>,<2,1>
			COORD <1,1>,<2,1>,<2,2>,<2,3>
			COORD <0,2>,<1,1>,<1,2>,<2,2>
			COORD <1,1>,<1,2>,<1,3>,<2,2>
			COORD <0,2>,<1,2>,<1,3>,<2,2>
			COORD <0,2>,<1,1>,<1,2>,<1,3>
			COORD <0,2>,<1,2>,<2,2>,<3,2>
			COORD <1,0>,<1,1>,<1,2>,<1,3>
			COORD <1,1>,<1,2>,<2,1>,<2,2>
gamedata	byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,0,0,0,0,0,0,0,0,0,0,2
			byte 2,2,2,2,2,2,2,2,2,2,2,2

.code



checkscore proc uses eax ebx ecx edx
	mov edx, 0
	mov tempshapescore, 0
	
stchec:
	mov eax, 10000000
	mov ecx, 0
	movsx ebx, tempshape
	shl ebx, 4
	
	mov cx, [shapeinfo2+ebx].x
	mov [findingshape].x, cx
	mov cx, [shapeinfo2+ebx].y
	mov [findingshape].y, cx
	add ebx, 4
	mov cx, [shapeinfo2+ebx].x
	mov [findingshape+4].x, cx
	mov cx, [shapeinfo2+ebx].y
	mov [findingshape+4].y, cx
	add ebx, 4
	mov cx, [shapeinfo2+ebx].x
	mov [findingshape+8].x, cx
	mov cx, [shapeinfo2+ebx].y
	mov [findingshape+8].y, cx
	add ebx, 4
	mov cx, [shapeinfo2+ebx].x
	mov [findingshape+12].x, cx
	mov cx, [shapeinfo2+ebx].y
	mov [findingshape+12].y, cx
	
	add findingshape.x,10
	add [findingshape+4].x,10
	add [findingshape+8].x,10
	add [findingshape+12].x,10
	
chch:
	.if findingshape.x > dx
		dec findingshape.x
		dec [findingshape+4].x
		dec [findingshape+8].x
		dec [findingshape+12].x
		jmp chch
	.endif
	
	.if [findingshape+12].x > 9
		jmp chend
	.endif
	
chch2:
	mov bx, findingshape.y
	imul bx, 12
	add bx, findingshape.x
	inc bx
	.if gamedata[bx] != 2
		mov bx, [findingshape+4].y
		imul bx, 12
		add bx, [findingshape+4].x
		inc bx
		.if gamedata[bx] != 2
			mov bx, [findingshape+8].y
			imul bx, 12
			add bx, [findingshape+8].x
			inc bx
			.if gamedata[bx] != 2
				mov bx, [findingshape+12].y
				imul bx, 12
				add bx, [findingshape+12].x
				inc bx
				.if gamedata[bx] != 2
					inc findingshape.y
					inc [findingshape+4].y
					inc [findingshape+8].y
					inc [findingshape+12].y
					jmp chch2
				.endif
			.endif
		.endif
	.endif
	
	mov ecx, ain[32]
	movsx ebx, findingshape.y
	imul ebx, ecx
	add eax, ebx
	;shr ebx, 1
	;add eax, ebx
	movsx ebx, [findingshape+4].y
	imul ebx, ecx
	add eax, ebx
	;shr ebx, 1
	;add eax, ebx
	movsx ebx, [findingshape+8].y
	imul ebx, ecx
	add eax, ebx
	;shr ebx, 1
	;add eax, ebx
	movsx ebx, [findingshape+12].y
	imul ebx, ecx
	add eax, ebx
	;shr ebx, 1
	;add eax, ebx
	
	mov ecx, ain[36]
	mov bx, findingshape.y						;check right
	dec bx
	imul bx, 12
	add bx, findingshape.x
	add bx, 2
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+4].y
	dec bx
	imul bx, 12
	add bx, [findingshape+4].x
	add bx, 2
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+8].y
	dec bx
	imul bx, 12
	add bx, [findingshape+8].x
	add bx, 2
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+12].y
	dec bx
	imul bx, 12
	add bx, [findingshape+12].x
	add bx, 2
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, findingshape.y						;check left
	dec bx
	imul bx, 12
	add bx, findingshape.x
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+4].y
	dec bx
	imul bx, 12
	add bx, [findingshape+4].x
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+8].y
	dec bx
	imul bx, 12
	add bx, [findingshape+8].x
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	mov bx, [findingshape+12].y
	dec bx
	imul bx, 12
	add bx, [findingshape+12].x
	.if gamedata[bx] == 2
		add eax, ecx
	.endif
	
	mov bx, findingshape.y
	dec bx
	imul bx, 12
	add bx, findingshape.x
	inc bx
	mov gamedata[bx], 2
	mov bx, [findingshape+4].y
	dec bx
	imul bx, 12
	add bx, [findingshape+4].x
	inc bx
	mov gamedata[bx], 2
	mov bx, [findingshape+8].y
	dec bx
	imul bx, 12
	add bx, [findingshape+8].x
	inc bx
	mov gamedata[bx], 2
	mov bx, [findingshape+12].y
	dec bx
	imul bx, 12
	add bx, [findingshape+12].x
	inc bx
	mov gamedata[bx], 2

	
	mov [tempsaveline], 0
	mov [tempsaveline+4], 0
	mov [tempsaveline+8], 0
	mov [tempsaveline+12], 0
	
	push edx
	
	mov edx, ain
	mov linepoint, edx
	mov edx, 0
	mov ecx, 16
	lea esi, gamedata
	add esi, 49
	mov bh, 0
C32:
	push ecx
	mov ebx, 0
	mov ecx, 10
C42:
	add bl, [esi+ecx-1]
	loop C42
	.if bl == 0
		push edx
		mov edx, ain[4]
		sub linepoint, edx
		pop edx
	.elseif bl == 20
		add eax, linepoint
		mov [tempsaveline+edx], esi
		add edx, 4
	.endif
	pop ecx
	add esi, 12
	loop C32
	
	pop edx
	
	mov ecx, 10
C55:
    mov startc, 0
	mov startcc, 0
	mov ttp, 0
	mov ebx, ain[16]
	mov tts, ebx
	mov ebx, ain[24]
	mov ttt, ebx
    mov ebx, 0
	lea esi, gamedata
	add esi, 49
C66:
	push ebx
    .if esi != tempsaveline && esi != [tempsaveline+4] && esi != [tempsaveline+8] && esi != [tempsaveline+12]
		mov bl, [esi+ecx-1]
		.if bl == 2 && startc == 0
		    mov startc, 1
		.elseif startc != 0 && bl != 2
			sub eax, ain[12]
			mov whitec[ebx], 1
			.if startc == 1
				sub eax, ttp
				mov ttp, 0
			.endif
		.endif
		.if startc == 1 && bl == 2
			mov ebx, tts
			add ttp, ebx
			.if tts > 0
				push ebx
				mov ebx, ain[20]
				sub tts, ebx
				pop ebx
			.endif
		.endif
		mov bl, [esi+ecx-1]
		mov bh, [esi+ecx]
		.if bl != 2 && bh == 2 && startcc == 0
			mov bh, [esi+ecx-2]
			.if  bh == 2
				mov startcc, 1
			.endif
		.elseif startcc == 1 && bl != 2
			sub eax, ttt
			push ebx
			mov ebx, ain[28]
			add ttt, ebx
			pop ebx
		.elseif startcc == 1
			mov startcc, 2
		.endif
	.endif
	pop ebx
	.if ebx < 15
	    inc ebx
		add esi, 12
		jmp C66
	.endif
	dec ecx			;loop C55
	jne C55
	
	mov ecx, 16
Crsc:
	.if whitec[ecx-1] == 1
		push edx
		mov edx, ain[8]
		sub eax, edx
		pop edx
		mov whitec[ecx-1], 0
	.endif
	loop Crsc
	
	mov bx, findingshape.y
	dec bx
	imul bx, 12
	add bx, findingshape.x
	inc bx
	mov gamedata[bx], 0
	mov bx, [findingshape+4].y
	dec bx
	imul bx, 12
	add bx, [findingshape+4].x
	inc bx
	mov gamedata[bx], 0
	mov bx, [findingshape+8].y
	dec bx
	imul bx, 12
	add bx, [findingshape+8].x
	inc bx
	mov gamedata[bx], 0
	mov bx, [findingshape+12].y
	dec bx
	imul bx, 12
	add bx, [findingshape+12].x
	inc bx
	mov gamedata[bx], 0

	
	.if findingshape.y < 10 || [findingshape+4].y <10 || [findingshape+8].y <10 || [findingshape+12].y <10
		sub eax, ain[40]
	.endif
	.if findingshape.y < 9 || [findingshape+4].y <9 || [findingshape+8].y <9 || [findingshape+12].y <9
		sub eax, ain[40]
	.endif
	.if findingshape.y < 8 || [findingshape+4].y <8 || [findingshape+8].y <8 || [findingshape+12].y <8
		sub eax, ain[40]
	.endif
	.if findingshape.y < 7 || [findingshape+4].y <7 || [findingshape+8].y <7 || [findingshape+12].y <7
		sub eax, ain[40]
	.endif
	
	.if findingshape.y < 5
		mov eax, 0
	.endif
	.if [findingshape+4].y < 5
		mov eax, 0
	.endif
	.if [findingshape+8].y < 5
		mov eax, 0
	.endif
	.if [findingshape+12].y < 5
		mov eax, 0
	.endif
	
	.if eax > tempshapescore || edx == 0
		mov tempshapescore, eax
		.if gamemode == 3
			mov ax, findingshape.x
			mov temppos.x, ax
			mov ax, [findingshape+4].x
			mov [temppos+4].x, ax
			mov ax, [findingshape+8].x
			mov [temppos+8].x, ax
			mov ax, [findingshape+12].x
			mov [temppos+12].x, ax
			mov ax, findingshape.y
			dec ax
			mov temppos.y, ax
			mov ax, [findingshape+4].y
			dec ax
			mov [temppos+4].y, ax
			mov ax, [findingshape+8].y
			dec ax
			mov [temppos+8].y, ax
			mov ax, [findingshape+12].y
			dec ax
			mov [temppos+12].y, ax
		.endif
	.endif
	
	inc edx
	jmp stchec
	
chend:
	ret
checkscore endp

aishape proc uses eax ebx ecx edx
	mov edx, 0
	mov ecx, 0
	movsx eax, numb
	shl eax, 1
	movsx eax, byte ptr[eax+shape+1]
	movsx ebx, nowshape
AA:	.if ebx <= eax
		mov [tempshape], bl
		call checkscore
		mov edx, tempshapescore
		.if edx > ecx || bx == nowshape
			mov ecx, edx
			mov expectshape, bl
			
			mov dx, temppos.x
			mov expectpos.x, dx
			mov dx, [temppos+4].x
			mov [expectpos+4].x, dx
			mov dx, [temppos+8].x
			mov [expectpos+8].x, dx
			mov dx, [temppos+12].x
			mov [expectpos+12].x, dx
			mov dx, temppos.y
			mov expectpos.y, dx
			mov dx, [temppos+4].y
			mov [expectpos+4].y, dx
			mov dx, [temppos+8].y
			mov [expectpos+8].y, dx
			mov dx, [temppos+12].y
			mov [expectpos+12].y, dx
		.endif
		inc ebx
		jmp AA
	.endif
	ret
aishape endp

aifind proc uses eax ebx ecx edx
	movsx eax, nowshape
	.if al < expectshape
		mov expectmov, 4800h
		ret
	.endif
	mov ax, expectpos.x
	.if ax > nowpos.x
		mov expectmov, 4d00h
	.elseif ax != nowpos.x
		mov expectmov, 4b00h
	.else
		mov expectmov, 5000h
	.endif
	
	ret
aifind endp

findworstpiece proc uses eax ebx ecx edx
	mov shapescore, 0
	mov [shapescore+4], 0
	mov [shapescore+8], 0
	mov [shapescore+12], 0
	mov [shapescore+16], 0
	mov [shapescore+20], 0
	mov [shapescore+24], 0
	
	mov tempshape, 0
	call checkscore
	mov eax, tempshapescore
	.if eax > shapescore
		mov shapescore, eax
	.endif
	mov tempshape, 1
	call checkscore
	mov eax, tempshapescore
	.if eax > shapescore
		mov shapescore, eax
	.endif
	
	mov tempshape, 2
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+4]
		mov [shapescore+4], eax
	.endif
	mov tempshape, 3
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+4]
		mov [shapescore+4], eax
	.endif
	
	mov tempshape, 4
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+8]
		mov [shapescore+8], eax
	.endif
	mov tempshape, 5
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+8]
		mov [shapescore+8], eax
	.endif
	mov tempshape, 6
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+8]
		mov [shapescore+8], eax
	.endif
	mov tempshape, 7
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+8]
		mov [shapescore+8], eax
	.endif
	
	mov tempshape, 8
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+12]
		mov [shapescore+12], eax
	.endif
	mov tempshape, 9
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+12]
		mov [shapescore+12], eax
	.endif
	mov tempshape, 10
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+12]
		mov [shapescore+12], eax
	.endif
	mov tempshape, 11
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+12]
		mov [shapescore+12], eax
	.endif
	
	mov tempshape, 12
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+16]
		mov [shapescore+16], eax
	.endif
	mov tempshape, 13
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+16]
		mov [shapescore+16], eax
	.endif
	mov tempshape, 14
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+16]
		mov [shapescore+16], eax
	.endif
	mov tempshape, 15
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+16]
		mov [shapescore+16], eax
	.endif
	
	mov tempshape, 16
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+20]
		mov [shapescore+20], eax
	.endif
	mov tempshape, 17
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+20]
		mov [shapescore+20], eax
	.endif
	
	mov tempshape, 18
	call checkscore
	mov eax, tempshapescore
	.if eax > [shapescore+24]
		mov [shapescore+24], eax
	.endif
	
	mov ecx, 0
	mov ebx, 0
	mov eax, 1000000000
Shcom:													;shape comfirm 
	.if eax > [shapescore+ebx]
		mov ecx, ebx
		mov eax, [shapescore+ebx]
	.endif
	.if ebx < 24
		add ebx, 4
		jmp Shcom
	.endif
	
	shr ecx, 2
	mov numb, cl
	
	ret
findworstpiece endp

resetgamedata proc uses eax ebx ecx edx
	mov ecx, 20
	lea esi, gamedata
	inc esi
rsgm1:
	push ecx
	mov ecx, 10
rsgm2:
	mov al, 0
	mov [esi+ecx-1], al
	loop rsgm2
	lea esi, [esi+12]
	pop ecx
	loop rsgm1
	ret
resetgamedata endp

clnscr2 proc uses eax ebx ecx edx
	mov cursorxy.x, 5
	mov cursorxy.y, 6
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 10
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 12
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 14
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 16
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 18
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 22
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 24
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.y, 26
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	

	ret
clnscr2 endp

clnscr proc uses eax ebx ecx edx
	mov cursorxy.x, 4
	mov cursorxy.y, 6
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov1, addr count, NULL
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov2, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov3, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov4, addr count, NULL
	mov cursorxy.y, 10
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov5, addr count, NULL
	mov cursorxy.y, 11
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov6, addr count, NULL
	mov cursorxy.y, 12
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov7, addr count, NULL
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof gmov8, addr count, NULL
	
	mov cursorxy.x, 5
	mov cursorxy.y, 17
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 35, addr count, NULL
	mov cursorxy.x, 10
	mov cursorxy.y, 19
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof boxu2, addr count, NULL
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof scoreword, addr count, NULL
	mov cursorxy.y, 21
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof boxd2, addr count, NULL

	mov cursorxy.x, 6
	mov cursorxy.y, 25
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof cleantit, addr count, NULL
	
	ret
clnscr endp

scoreb proc uses eax ebx ecx edx
	
	mov cursorxy.x, 4
	mov cursorxy.y, 6
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov1, sizeof gmov1, addr count, NULL
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov2, sizeof gmov2, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov3, sizeof gmov3, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov4, sizeof gmov4, addr count, NULL
	mov cursorxy.y, 10
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov5, sizeof gmov5, addr count, NULL
	mov cursorxy.y, 11
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov6, sizeof gmov6, addr count, NULL
	mov cursorxy.y, 12
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov7, sizeof gmov7, addr count, NULL
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr gmov8, sizeof gmov8, addr count, NULL
	
	mov cursorxy.x, 10
	mov cursorxy.y, 19
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxu2, sizeof boxu2, addr count, NULL
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr scoreword, sizeof scoreword, addr count, NULL
	mov cursorxy.y, 21
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxd2, sizeof boxd2, addr count, NULL
	
	mov eax, point
	.if menuselect == 0
		.if  eax <= ascore
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr hs, sizeof hs, addr count, NULL
			mov eax, ascore
			call WriteDec
		.else
			mov eax, point
			mov ascore, eax
			mov cursorxy.x, 12
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr nhs, sizeof nhs, addr count, NULL
		.endif
	.elseif menuselect == 1
		.if  eax <= bscore
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr hs, sizeof hs, addr count, NULL
			mov eax, bscore
			call WriteDec
		.else
			mov eax, point
			mov bscore, eax
			mov cursorxy.x, 12
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr nhs, sizeof nhs, addr count, NULL
		.endif
	.elseif menuselect == 2 && trainai == 0
		.if  eax <= cscore
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr hs, sizeof hs, addr count, NULL
			mov eax, cscore
			call WriteDec
		.else
			mov eax, point
			mov cscore, eax
			mov cursorxy.x, 12
			mov cursorxy.y, 17
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			invoke WriteConsole, outputHandle, addr nhs, sizeof nhs, addr count, NULL
		.endif
	.endif
	
	mov cursorxy.x, 19
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	mov eax, point
	call WriteDec
	
	mov cursorxy.x, 6
	mov cursorxy.y, 25
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	call WaitMsg
	
	ret
scoreb endp

check proc uses eax ebx ecx edx
	mov ecx, 4
	lea esi, gamedata
	inc esi
CC:	push ecx
	mov ecx, 10
C2:	mov al, [esi+ecx-1]
	.if al == 2
		jmp gmover
	.endif
	loop C2
	pop ecx
	add esi, 12
	loop CC
	
	mov ecx, 16
	lea esi, gamedata
	add esi, 49
C3:	push ecx
	mov eax, 0
	mov ecx, 10
C4:	add al, [esi+ecx-1]
	loop C4
	.if al == 20
		.if timeloop > 10
			dec timeloop
		.endif
		inc point
		pop ecx
		mov al, 16
		sub al, cl
		inc al
		push ecx
		mov cl, al
		push esi
		sub esi, 12
C5:		push ecx
		mov ecx, 10
C6:		mov bl, [esi+ecx-1]
		mov [esi+ecx+11], bl
		mov bl, 0
		mov [esi+ecx-1], bl
		loop C6
		pop ecx
		sub esi, 12
		loop C5
		pop esi
	.endif
	pop ecx
	add esi, 12
	dec ecx			;loop C3
	jne C3
	ret
	
gmover:
	pop ecx
	mov gg, 1
	ret
check endp

newshape proc uses eax ebx ecx edx
	
	movsx ebx, numb
	shl ebx,1									;get shape kind
	movsx eax, byte ptr [shape+ebx]
	shl eax,4
	
	mov bx, [shapeinfo2+eax].x					;ini nowpos
	add bx, 3
	mov [nowpos].x, bx
	mov bx, [shapeinfo2+eax].y
	mov [nowpos].y, bx
	mov bx, [shapeinfo2+eax+4].x
	add bx, 3
	mov [nowpos+4].x, bx
	mov bx, [shapeinfo2+eax+4].y
	mov [nowpos+4].y, bx
	mov bx, [shapeinfo2+eax+8].x
	add bx, 3
	mov [nowpos+8].x, bx
	mov bx, [shapeinfo2+eax+8].y
	mov [nowpos+8].y, bx
	mov bx, [shapeinfo2+eax+12].x
	add bx, 3
	mov [nowpos+12].x, bx
	mov bx, [shapeinfo2+eax+12].y
	mov [nowpos+12].y, bx
	
	mov bx, nowpos.y							;udate gamedata
	imul bx, 12
	add bx, nowpos.x
	inc bx
	mov gamedata[bx], 1
	mov bx, [nowpos+4].y
	imul bx, 12
	add bx, [nowpos+4].x
	inc bx
	mov gamedata[bx], 1
	mov bx, [nowpos+8].y
	imul bx, 12
	add bx, [nowpos+8].x
	inc bx
	mov gamedata[bx], 1
	mov bx, [nowpos+12].y
	imul bx, 12
	add bx, [nowpos+12].x
	inc bx
	mov gamedata[bx], 1
	
	shr eax, 4
	mov nowshape, ax
	
	.if gamemode == 3
		call aishape
	.endif
	
	ret
newshape endp

up proc uses eax ebx ecx edx

	movsx ebx, numb
	shl ebx,1									;get shape kind
	movsx edx, byte ptr [shape+ebx+1]
	movsx eax, nowshape
	.if edx > eax
		lea edx, [eax+1]
	.else
		movsx edx, byte ptr [shape+ebx]
	.endif
	shl eax, 4
	shl edx, 4
	
	mov cx, nowpos.x
	sub cx, [shapeinfo2+eax].x
	rol ecx, 16									;save register's space
	mov cx, nowpos.y
	sub cx, [shapeinfo2+eax].y
	
	
	mov bx, [shapeinfo2+edx].y							;check touch
	add bx, cx
	imul bx, 12
	rol ecx, 16
	add bx, [shapeinfo2+edx].x
	add bx, cx
	inc bx
	rol ecx, 16
	.if gamedata[bx] != 2
		mov bx, [shapeinfo2+edx+4].y							;check touch
		add bx, cx
		imul bx, 12
		rol ecx, 16
		add bx, [shapeinfo2+edx+4].x
		add bx, cx
		inc bx
		rol ecx, 16
		.if gamedata[bx] != 2
			mov bx, [shapeinfo2+edx+8].y							;check touch
			add bx, cx
			imul bx, 12
			rol ecx, 16
			add bx, [shapeinfo2+edx+8].x
			add bx, cx
			inc bx
			rol ecx, 16
			.if gamedata[bx] != 2
				mov bx, [shapeinfo2+edx+12].y							;check touch
				add bx, cx
				imul bx, 12
				rol ecx, 16
				add bx, [shapeinfo2+edx+12].x
				add bx, cx
				inc bx
				.if gamedata[bx] != 2
					mov bx, nowpos.y							;delete old
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 0
					
					mov bx, [shapeinfo2+edx].x
					add bx, cx
					mov nowpos.x, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx].y
					add bx, cx
					mov nowpos.y, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+4].x
					add bx, cx
					mov [nowpos+4].x, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+4].y
					add bx, cx
					mov [nowpos+4].y, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+8].x
					add bx, cx
					mov [nowpos+8].x, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+8].y
					add bx, cx
					mov [nowpos+8].y, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+12].x
					add bx, cx
					mov [nowpos+12].x, bx
					rol ecx, 16
					mov bx, [shapeinfo2+edx+12].y
					add bx, cx
					mov [nowpos+12].y, bx
					
					mov bx, nowpos.y							;update
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 1
					
					shr edx, 4
					mov nowshape, dx
					
					ret
				.endif
			.endif
		.endif
	.endif
	
	ret
up endp

down proc uses eax ebx ecx edx
	mov bx, nowpos.y							;check touch
	inc bx
	imul bx, 12
	add bx, nowpos.x
	inc bx
	.if gamedata[bx] != 2
		mov bx, [nowpos+4].y							;check touch
		inc bx
		imul bx, 12
		add bx, [nowpos+4].x
		inc bx
		.if gamedata[bx] != 2
			mov bx, [nowpos+8].y							;check touch
			inc bx
			imul bx, 12
			add bx, [nowpos+8].x
			inc bx
			.if gamedata[bx] != 2
				mov bx, [nowpos+12].y							;check touch
				inc bx
				imul bx, 12
				add bx, [nowpos+12].x
				inc bx
				.if gamedata[bx] != 2
					mov bx, nowpos.y							;delete old
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 0
					
					inc nowpos.y								;get down
					inc [nowpos+4].y
					inc [nowpos+8].y
					inc [nowpos+12].y
					
					mov bx, nowpos.y							;update
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 1
					ret
				.endif
			.endif
		.endif
	.endif
	mov bx, nowpos.y
	imul bx, 12
	add bx, nowpos.x
	inc bx
	mov gamedata[bx], 2
	mov bx, [nowpos+4].y
	imul bx, 12
	add bx, [nowpos+4].x
	inc bx
	mov gamedata[bx], 2
	mov bx, [nowpos+8].y
	imul bx, 12
	add bx, [nowpos+8].x
	inc bx
	mov gamedata[bx], 2
	mov bx, [nowpos+12].y
	imul bx, 12
	add bx, [nowpos+12].x
	inc bx
	mov gamedata[bx], 2
	
	call check
	.if gg == 1
		jmp ee
	.endif
	mov eax, 7
	call RandomRange
	mov numb, al
	.if gamemode == 2
		call findworstpiece
	.endif
	call newshape
	
ee:
	ret
down endp

left proc uses eax ebx ecx edx
	mov bx, nowpos.y							;check touch
	imul bx, 12
	add bx, nowpos.x
	.if gamedata[bx] != 2
		mov bx, [nowpos+4].y							;check touch
		imul bx, 12
		add bx, [nowpos+4].x
		.if gamedata[bx] != 2
			mov bx, [nowpos+8].y							;check touch
			imul bx, 12
			add bx, [nowpos+8].x
			.if gamedata[bx] != 2
				mov bx, [nowpos+12].y							;check touch
				imul bx, 12
				add bx, [nowpos+12].x
				.if gamedata[bx] != 2
					mov bx, nowpos.y							;delete old
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 0
					
					dec nowpos.x								;get left
					dec [nowpos+4].x
					dec [nowpos+8].x
					dec [nowpos+12].x
					
					mov bx, nowpos.y							;update
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 1
					ret
				.endif
			.endif
		.endif
	.endif
	
	ret
left endp

right proc uses eax ebx ecx edx
	mov bx, nowpos.y							;check touch
	imul bx, 12
	add bx, nowpos.x
	add bx, 2
	.if gamedata[bx] != 2
		mov bx, [nowpos+4].y							;check touch
		imul bx, 12
		add bx, [nowpos+4].x
		add bx, 2
		.if gamedata[bx] != 2
			mov bx, [nowpos+8].y							;check touch
			imul bx, 12
			add bx, [nowpos+8].x
			add bx, 2
			.if gamedata[bx] != 2
				mov bx, [nowpos+12].y							;check touch
				imul bx, 12
				add bx, [nowpos+12].x
				add bx, 2
				.if gamedata[bx] != 2
					mov bx, nowpos.y							;delete old
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 0
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 0
					
					inc nowpos.x								;move right
					inc [nowpos+4].x
					inc [nowpos+8].x
					inc [nowpos+12].x
					
					mov bx, nowpos.y							;update
					imul bx, 12
					add bx, nowpos.x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+4].y
					imul bx, 12
					add bx, [nowpos+4].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+8].y
					imul bx, 12
					add bx, [nowpos+8].x
					inc bx
					mov gamedata[bx], 1
					mov bx, [nowpos+12].y
					imul bx, 12
					add bx, [nowpos+12].x
					inc bx
					mov gamedata[bx], 1
					ret
				.endif
			.endif
		.endif
	.endif
	
	ret
right endp

updatev2 proc uses eax ebx ecx edx
	mov cursorxy.x, 10
	mov cursorxy.y, 6
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	mov eax, airecord
	add eax, point
	call WriteDec
	.if temptimes == 3
		mov cursorxy.y, 8
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[4]
		call WriteDec
		mov cursorxy.y, 10
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[8]
		call WriteDec
		mov cursorxy.y, 12
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[12]
		call WriteDec
		mov cursorxy.y, 14
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[16]
		call WriteDec
		mov cursorxy.y, 16
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[20]
		call WriteDec
		mov cursorxy.y, 18
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[24]
		call WriteDec
		mov cursorxy.y, 20
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[28]
		call WriteDec
		mov cursorxy.y, 22
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[32]
		call WriteDec
		mov cursorxy.y, 24
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[36]
		call WriteDec
		mov cursorxy.y, 26
		INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
		mov eax, airecord[40]
		call WriteDec
	.endif
	
	ret
updatev2 endp
	

update proc uses eax ebx ecx edx
	mov cursorxy.x, 5
	mov cursorxy.y, 6
	mov ecx, 20
	lea esi, gamedata
	inc esi
NS1:
	push ecx
	mov cursorxy.x, 5
	mov ecx, 10
NS2:
	push ecx
	movsx eax, byte ptr [esi]
	inc esi
	.if eax == 1
		invoke WriteConsoleOutputAttribute, outputHandle, addr cblue, 2, cursorxy,addr count
	.elseif eax == 2
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwhite, 2, cursorxy,addr count
	.else
		invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 2, cursorxy,addr count
	.endif
	add cursorxy.x, 2
	pop ecx
	loop NS2
	lea esi, [esi+2]
	pop ecx
	inc cursorxy.y
	dec ecx			;loop NS1
	jne NS1
	mov cursorxy.x, 27
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr pointin, sizeof pointin, addr count, NULL
	mov eax, point
	call WriteDec
	mov cursorxy.x, 27
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	mov eax, point
	.if menuselect == 0
		.if eax <= ascore
			mov eax, ascore
		.endif
	.elseif menuselect == 1
		.if eax <= bscore
			mov eax, bscore
		.endif
	.elseif menuselect == 2 && trainai == 0
		.if eax <= cscore
			mov eax, cscore
		.endif
	.endif
	call WriteDec
	
	ret
update endp

background proc uses eax ebx ecx edx
	mov cursorxy.x, 4
	mov cursorxy.y, 5
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr backu, sizeof backu, addr count, NULL
	mov ecx, 21
BG:	push ecx
	inc cursorxy.y
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr backw, sizeof backw, addr count, NULL
	mov cursorxy.x, 25
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr backw, sizeof backw, addr count, NULL
	mov cursorxy.x, 4
	pop ecx
	loop BG
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr backd, sizeof backd, addr count, NULL
	mov cursorxy.x, 5
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr dline, sizeof dline, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 17
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr hiw, sizeof hiw, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 18
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr scw, sizeof scw, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 19
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr hswl, sizeof hswl, addr count, NULL
	ret
background endp

controller proc uses eax ebx ecx edx
Startg:
	.if trainai != 1 || menuselect != 2
		call background
	.endif
	mov eax, 7
	call RandomRange
	mov numb, al
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	.if gamemode == 2
		call findworstpiece
	.endif
	call newshape
	.if trainai != 1 || menuselect != 2
		call update
	.else
		call updatev2
	.endif
LL:	
	.if gamemode == 1
		.if countdown == 0
			mov ax, timeloop
			mov countdown, ax
			mov ax, 5000h
			jmp SL
		.endif
		mov eax, 10
		call Delay
		call ReadKey
		dec countdown
	.elseif gamemode == 2
		call ReadChar
	.elseif gamemode == 3 && trainai != 1
		call aifind
		;mov eax, 10
		;call Delay
		call ReadKey
		je LLLL
		jmp LLLLL
LLLL:	mov ax, expectmov
	.elseif gamemode == 3 && trainai == 1
		;mov eax, 10
		;call Delay
		mov bx, nowpos.y
		imul bx, 12
		add bx, nowpos.x
		inc bx
		mov gamedata[bx], 0
		mov bx, [nowpos+4].y
		imul bx, 12
		add bx, [nowpos+4].x
		inc bx
		mov gamedata[bx], 0
		mov bx, [nowpos+8].y
		imul bx, 12
		add bx, [nowpos+8].x
		inc bx
		mov gamedata[bx], 0
		mov bx, [nowpos+12].y
		imul bx, 12
		add bx, [nowpos+12].x
		inc bx
		mov gamedata[bx], 0
	
		mov bx, expectpos.y
		imul bx, 12
		add bx, expectpos.x
		inc bx
		mov gamedata[bx], 2
		mov bx, [expectpos+4].y
		imul bx, 12
		add bx, [expectpos+4].x
		inc bx
		mov gamedata[bx], 2
		mov bx, [expectpos+8].y
		imul bx, 12
		add bx, [expectpos+8].x
		inc bx
		mov gamedata[bx], 2
		mov bx, [expectpos+12].y
		imul bx, 12
		add bx, [expectpos+12].x
		inc bx
		mov gamedata[bx], 2
		
		call check
		.if gg == 1
			jmp isg
		.endif
		call updatev2
		mov eax, 7
		call RandomRange
		mov numb, al
		call newshape
		call ReadKey
		je isg
		
LLLLL:	.endif
SL:	
	.if ax == 4800h
		xor ebx, ebx
		call up
		call update
	.elseif ax == 5000h
		xor ebx, ebx
		call down
		call update
	.elseif ax == 4B00h
		xor ebx, ebx
		call left
		call update
	.elseif ax == 4D00h
		xor ebx, ebx
		call right
		call update
	.elseif ax == 011bh
		mov gg, 1
		jmp gameo
	.endif
isg:
	.if gg == 1
		.if menuselect == 2 && trainai == 1
			mov ebx, point
			add nowscore, ebx
			add airecord, ebx
			.if temptimes > 0
				dec temptimes
			.endif
			mov ebx, lastscore
			.if temptimes == 0
			
				mov ecx, nowscore
				.if bestaiscore <= ecx
					mov bestaiscore, ecx
					mov ecx, 11
recordupdate2:		mov eax, ecx
					shl eax, 2
					mov ebx, ain[eax-4]
					mov bestain[eax-4], ebx
					loop recordupdate2
					mov eax, filehandle
					mov edx, offset bestscorell
					mov ecx, 44
					call WriteToFile
					mov eax, filehandle
					mov edx, offset ain
					mov ecx, 44
					call WriteToFile
					mov eax, filehandle
					mov edx, offset bestscorell
					mov ecx, 44
					call WriteToFile
				.endif
				mov ebx, lastscore
				.if aindelta > 0
					mov edx, aindelta
					mov eax, ainn
					shl eax, 2
					.if nowscore >= ebx && deltadir == 1
						add ain[eax], edx
					.elseif nowscore >= ebx && deltadir == 0
ttss1:					.if ain[eax] >= edx
							sub ain[eax], edx
						.elseif aindelta > 1
							dec aindelta
							mov edx, aindelta
							jmp ttss1
						.endif
					.elseif deltadir == 1
ttss2:					.if ain[eax] >= edx
							sub ain[eax], edx
						.elseif aindelta > 1
							dec aindelta
							mov edx, aindelta
							jmp ttss2
						.endif
						mov ebx, 1
						sub ebx, deltadir
						mov deltadir, ebx
					.elseif deltadir == 0
						add ain[eax], edx
						mov ebx, 1
						sub ebx, deltadir
						mov deltadir, ebx
					.endif
					
					mov ecx, 10
recordupdate:		mov eax, ecx
					shl eax, 2
					mov ebx, airecord[eax-4]
					mov airecord[eax], ebx
					loop recordupdate
					mov airecord, 0
					
					call clnscr2
					call clngame
					
					dec aindelta
					mov ebx, nowscore
					mov lastscore, ebx
					mov nowscore, 0
					mov temptimes, 3
				.endif
				.if aindelta == 0
					.if ainn < 10
						inc ainn
					.else
						mov ainn, 0
					.endif

					mov lastscore, 0
					mov deltadir, 1						;...
					mov nowscore, 0
					mov temptimes, 3
					mov ebx, 10
					mov aindelta, ebx
					mov eax, filehandle
					mov edx, offset ain
					mov ecx, 44
					call WriteToFile
				.endif
			.endif
			
			mov point, 0
			mov gamemode, 3
			mov gg, 0
			call resetgamedata
			
			
			mov cursorxy.x, 20
			mov cursorxy.y, 6
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestaiscore
			call WriteDec
			mov cursorxy.x, 30
			mov cursorxy.y, 6
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain
			call WriteDec
			mov cursorxy.y, 8
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[4]
			call WriteDec
			mov cursorxy.y, 10
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[8]
			call WriteDec
			mov cursorxy.y, 12
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[12]
			call WriteDec
			mov cursorxy.y, 14
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[16]
			call WriteDec
			mov cursorxy.y, 16
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[20]
			call WriteDec
			mov cursorxy.y, 18
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[24]
			call WriteDec
			mov cursorxy.y, 20
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[28]
			call WriteDec
			mov cursorxy.y, 22
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[32]
			call WriteDec
			mov cursorxy.y, 24
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[36]
			call WriteDec
			mov cursorxy.y, 26
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			mov eax, bestain[40]
			call WriteDec
			
			jmp Startg
		.endif
		jmp gameo
	.endif
	
	jmp LL
	
	ret
	
gameo:
	
	ret
	
controller endp

inimenu proc uses eax ebx ecx edx
		
	mov cursorxy.x, 3
	mov cursorxy.y, 0
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr titt1, sizeof titt1, addr count, NULL
	mov cursorxy.y, 1
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr titt2, sizeof titt2, addr count, NULL
	mov cursorxy.y, 2
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr titt3, sizeof titt3, addr count, NULL
	mov cursorxy.y, 3
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr titt4, sizeof titt4, addr count, NULL
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr tit1, sizeof tit1, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr tit2, sizeof tit2, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr tit3, sizeof tit3, addr count, NULL
	mov cursorxy.y, 10
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr tit4, sizeof tit4, addr count, NULL
	mov cursorxy.x, 26
	mov cursorxy.y, 27
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr idword, sizeof idword, addr count, NULL
	mov cursorxy.x, 6
	mov cursorxy.y, 18
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	
	mov cursorxy.x, 3
	mov cursorxy.y, 0
	invoke WriteConsoleOutputAttribute, outputHandle, addr cred, 7, cursorxy,addr count
	mov cursorxy.x, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr coran, 5, cursorxy,addr count
	mov cursorxy.x, 15
	invoke WriteConsoleOutputAttribute, outputHandle, addr cyellow, 7, cursorxy,addr count
	mov cursorxy.x, 22
	invoke WriteConsoleOutputAttribute, outputHandle, addr cgreen, 5, cursorxy,addr count
	mov cursorxy.x, 27
	invoke WriteConsoleOutputAttribute, outputHandle, addr cbluee, 5, cursorxy,addr count
	mov cursorxy.x, 32
	invoke WriteConsoleOutputAttribute, outputHandle, addr cpurple, 5, cursorxy,addr count
	mov cursorxy.x, 3
	mov cursorxy.y, 1
	invoke WriteConsoleOutputAttribute, outputHandle, addr cred, 7, cursorxy,addr count
	mov cursorxy.x, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr coran, 5, cursorxy,addr count
	mov cursorxy.x, 15
	invoke WriteConsoleOutputAttribute, outputHandle, addr cyellow, 7, cursorxy,addr count
	mov cursorxy.x, 22
	invoke WriteConsoleOutputAttribute, outputHandle, addr cgreen, 5, cursorxy,addr count
	mov cursorxy.x, 27
	invoke WriteConsoleOutputAttribute, outputHandle, addr cbluee, 5, cursorxy,addr count
	mov cursorxy.x, 32
	invoke WriteConsoleOutputAttribute, outputHandle, addr cpurple, 5, cursorxy,addr count
	mov cursorxy.x, 3
	mov cursorxy.y, 2
	invoke WriteConsoleOutputAttribute, outputHandle, addr cred, 7, cursorxy,addr count
	mov cursorxy.x, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr coran, 5, cursorxy,addr count
	mov cursorxy.x, 15
	invoke WriteConsoleOutputAttribute, outputHandle, addr cyellow, 7, cursorxy,addr count
	mov cursorxy.x, 22
	invoke WriteConsoleOutputAttribute, outputHandle, addr cgreen, 5, cursorxy,addr count
	mov cursorxy.x, 27
	invoke WriteConsoleOutputAttribute, outputHandle, addr cbluee, 5, cursorxy,addr count
	mov cursorxy.x, 32
	invoke WriteConsoleOutputAttribute, outputHandle, addr cpurple, 5, cursorxy,addr count
	mov cursorxy.x, 3
	mov cursorxy.y, 3
	invoke WriteConsoleOutputAttribute, outputHandle, addr cred, 7, cursorxy,addr count
	mov cursorxy.x, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr coran, 5, cursorxy,addr count
	mov cursorxy.x, 15
	invoke WriteConsoleOutputAttribute, outputHandle, addr cyellow, 7, cursorxy,addr count
	mov cursorxy.x, 22
	invoke WriteConsoleOutputAttribute, outputHandle, addr cgreen, 5, cursorxy,addr count
	mov cursorxy.x, 27
	invoke WriteConsoleOutputAttribute, outputHandle, addr cbluee, 5, cursorxy,addr count
	mov cursorxy.x, 32
	invoke WriteConsoleOutputAttribute, outputHandle, addr cpurple, 5, cursorxy,addr count
	mov cursorxy.x, 3
	mov cursorxy.y, 4
	invoke WriteConsoleOutputAttribute, outputHandle, addr cred, 7, cursorxy,addr count
	mov cursorxy.x, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr coran, 5, cursorxy,addr count
	mov cursorxy.x, 15
	invoke WriteConsoleOutputAttribute, outputHandle, addr cyellow, 7, cursorxy,addr count
	mov cursorxy.x, 22
	invoke WriteConsoleOutputAttribute, outputHandle, addr cgreen, 5, cursorxy,addr count
	mov cursorxy.x, 27
	invoke WriteConsoleOutputAttribute, outputHandle, addr cbluee, 5, cursorxy,addr count
	mov cursorxy.x, 32
	invoke WriteConsoleOutputAttribute, outputHandle, addr cpurple, 5, cursorxy,addr count
	
	mov cursorxy.x, 6
	mov cursorxy.y, 7
	invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 28, cursorxy,addr count
	mov cursorxy.y, 8
	invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 28, cursorxy,addr count
	mov cursorxy.y, 9
	invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 28, cursorxy,addr count
	mov cursorxy.y, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 28, cursorxy,addr count
	mov cursorxy.y, 11
	invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 28, cursorxy,addr count



	call WaitMsg
	
	mov cursorxy.x, 3
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof tit1, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof tit2, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof tit3, addr count, NULL
	mov cursorxy.y, 10
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, sizeof tit4, addr count, NULL
	mov cursorxy.x, 6
	mov cursorxy.y, 18
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 30, addr count, NULL
	
	mov cursorxy.x, 6
	mov cursorxy.y, 7
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 28, cursorxy,addr count
	mov cursorxy.y, 8
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 28, cursorxy,addr count
	mov cursorxy.y, 9
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 28, cursorxy,addr count
	mov cursorxy.y, 10
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 28, cursorxy,addr count
	mov cursorxy.y, 11
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 28, cursorxy,addr count
	
	ret
inimenu endp

menu proc uses eax ebx ecx edx
		
	mov cursorxy.x, 15
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxu, sizeof boxu, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr normword, sizeof normword, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxd, sizeof boxd, addr count, NULL
	mov cursorxy.y, 11
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxu, sizeof boxu, addr count, NULL
	mov cursorxy.y, 12
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr hellword, sizeof hellword, addr count, NULL
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxd, sizeof boxd, addr count, NULL
	mov cursorxy.y, 15
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxu, sizeof boxu, addr count, NULL
	mov cursorxy.y, 16
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr autoword, sizeof autoword, addr count, NULL
	mov cursorxy.y, 17
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxd, sizeof boxd, addr count, NULL
	mov cursorxy.y, 22
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxu, sizeof boxu, addr count, NULL
	mov cursorxy.y, 23
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr exitword, sizeof exitword, addr count, NULL
	mov cursorxy.y, 24
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr boxd, sizeof boxd, addr count, NULL
	
	ret
menu endp

menuupdate proc uses eax ebx ecx edx
	mov cursorxy.x, 16
	mov cursorxy.y, 8
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 8, cursorxy,addr count
	mov cursorxy.y, 12
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 8, cursorxy,addr count
	mov cursorxy.y, 16
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 8, cursorxy,addr count
	mov cursorxy.y, 23
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 8, cursorxy,addr count
	.if menuselect == 0
		mov cursorxy.y, 8
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 8, cursorxy,addr count
	.elseif menuselect == 1
		mov cursorxy.y, 12
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 8, cursorxy,addr count
	.elseif menuselect == 2 && trainai == 1
		mov cursorxy.y, 16
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwb2, 8, cursorxy,addr count
	.elseif menuselect == 3
		mov cursorxy.y, 23
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 8, cursorxy,addr count
	.elseif menuselect == 2 && trainai == 0
		mov cursorxy.y, 16
		invoke WriteConsoleOutputAttribute, outputHandle, addr cwb, 8, cursorxy,addr count
	.endif
	ret
menuupdate endp

clntit proc uses eax ebx ecx edx
	mov cursorxy.x, 15
	mov cursorxy.y, 7
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 8
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 11
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 12
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 15
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 16
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 17
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 22
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit,  10, addr count, NULL
	mov cursorxy.y, 23
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	mov cursorxy.y, 24
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 10, addr count, NULL
	ret
clntit endp

clngame proc uses eax ebx ecx edx
	mov cursorxy.x, 4
	mov cursorxy.y, 5
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 22, addr count, NULL
	mov ecx, 21
BG2:	push ecx
	inc cursorxy.y
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 2, addr count, NULL
	mov cursorxy.x, 25
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 2, addr count, NULL
	mov cursorxy.x, 4
	pop ecx
	loop BG2
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 22, addr count, NULL
	mov cursorxy.x, 5
	mov cursorxy.y, 9
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 20, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 13
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 13, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 17
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 13, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 18
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 13, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 19
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 13, addr count, NULL
	mov cursorxy.x, 27
	mov cursorxy.y, 20
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 13, addr count, NULL
	
	mov cursorxy.x, 5
	mov cursorxy.y, 6
	mov ecx, 20
NS11:push ecx
	invoke WriteConsoleOutputAttribute, outputHandle, addr cblack, 20, cursorxy,addr count
	inc cursorxy.y
	pop ecx
	loop NS11
	
	mov cursorxy.x, 6
	mov cursorxy.y, 28
	INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
	invoke WriteConsole, outputHandle, addr cleantit, 30, addr count, NULL
	
	ret
clngame endp

menucontrol proc uses eax ebx ecx edx
	mov menuselect, 0
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	call inimenu
	call menu
ML:	call menuupdate
	call ReadChar
	.if ax == 4800h
		.if menuselect > 0
			dec menuselect
		.else
			mov menuselect, 3
		.endif
	.elseif ax == 5000h
		.if menuselect < 3
			inc menuselect
		.else
			mov menuselect, 0
		.endif
	.elseif ax == 011bh
		mov eax, offset exityn
		mov ebx, offset exittit
		call MsgBoxAsk
		.if eax == IDYES
			mov  edx,OFFSET filename3
			invoke CreateFile, addr filename3, 40000000h, 2h, 0, 2, 80h, 0
			mov  filehandle3, eax
			mov eax, filehandle3
			mov edx, offset ascore
			mov ecx, 12
			call WriteToFile
			mov eax, filehandle3
			call CloseFile
			
			call Clrscr
			exit
		.endif
	.elseif ax == 1474h
		mov edx, 1
		sub edx, trainai
		mov trainai, edx
	.elseif ax == 1c0dh
		.if menuselect == 0
			mov point, 0
			mov gamemode, 1
			mov gg, 0
			call resetgamedata
			call clntit
			call controller
			mov cursorxy.x, 6
			mov cursorxy.y, 28
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			call WaitMsg
			call clngame
			call scoreb
			call clnscr
			call menu
		.elseif menuselect == 1
			mov point, 0
			mov gamemode, 2
			mov gg, 0
			call resetgamedata
			call clntit
			call controller
			mov cursorxy.x, 6
			mov cursorxy.y, 28
			INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
			call WaitMsg
			call clngame
			call scoreb
			call clnscr
			call menu
		.elseif menuselect == 2
			.if trainai == 1
				mov temptimes, 3
				mov deltadir, 1
				mov ainn, 0
				mov aindelta, 10
				
				mov  edx,OFFSET filename
				call CreateOutputFile
				mov  filehandle, eax
				
				mov ecx, 11
recordupdate3:		mov eax, ecx
				shl eax, 2
				mov ebx, ain[eax-4]
				mov bestain[eax-4], ebx
				loop recordupdate3
			.endif
			mov point, 0
			mov gamemode, 3
			mov gg, 0
			call resetgamedata
			call clntit
			call controller
			.if trainai == 0
				mov cursorxy.x, 6
				mov cursorxy.y, 28
				INVOKE SetConsoleCursorPosition, outputHandle, cursorxy
				call WaitMsg
				call clngame
				call scoreb
				call clnscr
			.elseif trainai == 1
				mov ecx, 11
loadai:			mov edx, ecx
				shl edx, 2
				mov eax, bestain[edx-4]
				mov ain[edx-4], eax
				loop loadai
				
				mov eax, filehandle
				call CloseFile
				
				mov  edx,OFFSET filename2
				invoke CreateFile, addr filename2, 40000000h, 2h, 0, 2, 80h, 0
				mov  filehandle2, eax
				mov eax, filehandle2
				mov edx, offset ain
				mov ecx, 44
				call WriteToFile
				mov eax, filehandle2
				call CloseFile
				
				call clnscr2
				mov  eax, filehandle
				call CloseFile
				mov trainai, 0
			.endif
			call menu
		.elseif menuselect == 3
			mov eax, offset exityn
			mov ebx, offset exittit
			call MsgBoxAsk
			.if eax == IDYES
				mov  edx,OFFSET filename3
				invoke CreateFile, addr filename3, 40000000h, 2h, 0, 2, 80h, 0
				mov  filehandle3, eax
				mov eax, filehandle3
				mov edx, offset ascore
				mov ecx, 12
				call WriteToFile
				mov eax, filehandle3
				call CloseFile
				
				call Clrscr
				exit
			.endif
		.endif
	.endif
	
	jmp ML

	ret
menucontrol endp

main PROC
	mov gg, 0
	call Clrscr
	INVOKE GetstdHandle, STD_OUTPUT_HANDLE ; Get the console ouput handle
    mov outputHandle, eax ; save console handle
	invoke SetConsoleCursorInfo, outputHandle, addr cursorinfo
	
	mov edx, offset filename2
	call OpenInputFile
	mov filehandle2, eax
	.if filehandle2 != INVALID_HANDLE_VALUE
		mov eax, filehandle2
		mov edx, offset ain
		mov ecx, 44
		call ReadFromFile
		mov eax, filehandle2
		call CloseFile
	.endif
	
	mov edx, offset filename3
	call OpenInputFile
	mov filehandle3, eax
	.if filehandle3 != INVALID_HANDLE_VALUE
		mov eax, filehandle3
		mov edx, offset ascore
		mov ecx, 12
		call ReadFromFile
		mov eax, filehandle3
		call CloseFile
	.endif

	mov numb, 0
	call Randomize
	call menucontrol
	
    exit
main ENDP

END main