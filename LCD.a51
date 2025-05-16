 
//Experiment name:- Interfacing of 16x2 LCD in 8 bit mode with 8051 Microcontroller. 
 
ORG 0000h
MOV A, #38h ; Initialize LCD in 8-bit mode, 2 lines, 5x7 matrix
ACALL CMND_WRT ; 
ACALL DELAY ; delay

MOV A, #0Eh ; Display ON, Cursor ON
ACALL CMND_WRT
ACALL DELAY ; delay

MOV A, #01h ; Clear LCD Screen
ACALL CMND_WRT
ACALL DELAY ; delay

MOV A, #06h ; Shift Cursor Right
ACALL CMND_WRT
ACALL DELAY ; delay

MOV A, #80h ; Move Cursor to Line 1, Position 1
ACALL CMND_WRT
ACALL DELAY ; delay

MOV A, #'N' ; Display Character 'N'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'A' ; Display Character 'A'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'M' ; Display Character 'M'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'E' ; Display Character 'E'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #':' ; Display Character ':'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'P' ; Display Character 'P'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #' ' ; Display Character ' '
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'R' ; Display Character 'R'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #' ' ; Display Character ' '
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'N' ; Display Character 'k'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'A' ; Display Character 'h'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'V' ; Display Character 't'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'A' ; Display Character 'e'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'L' ; Display Character 'e'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'E' ; Display Character 'd'
ACALL DATA_WRT
ACALL DELAY ; delay

MOV A, #0C0h ; Move Cursor to Line 2, Position 1
ACALL CMND_WRT
ACALL DELAY ; delay

MOV A, #'R' ; Display Character 'R'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'O' ; Display Character 'O'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'L' ; Display Character 'L'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'L' ; Display Character 'L'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #' ' ; Display Character ' '
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'N' ; Display Character 'N'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'O' ; Display Character 'O'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #':' ; Display Character ':'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'2' ; Display Character '8'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'1' ; Display Character '6'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'2' ; Display Character '5'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'0' ; Display Character '0'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'7' ; Display Character '6'
ACALL DATA_WRT
ACALL DELAY ; delay
MOV A, #'5' ; Display Character '0'
ACALL DATA_WRT
ACALL DELAY ; delay

again: SJMP again ; Infinite loop

CMND_WRT:
MOV P3, A ; Move command to data port (P3)
CLR P2.0  ; RS = 0 (Command Mode)
CLR P2.1  ; RW = 0 (Write Mode)
SETB P2.2 ; Enable High
ACALL DELAY ; Small delay for Enable pulse width
CLR P2.2  ; Enable Low
RET

DATA_WRT:
MOV P3, A ; Move data to data port (P3)
SETB P2.0 ; RS = 1 (Data Mode)
CLR P2.1  ; RW = 0 (Write Mode)
SETB P2.2 ; Enable High
ACALL DELAY ; Small delay for Enable pulse width
CLR P2.2  ; Enable Low
RET
 
DELAY: 
MOV R0, #02h ; delay of 500ms
L3: MOV R1, #0FFh
L2: MOV R2, #0FFh
L1: DJNZ R2, L1
DJNZ R1, L2
DJNZ R0, L3;
RET;

END;
