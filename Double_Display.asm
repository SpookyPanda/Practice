;EVITAR TRES Y CUATRO, ARREGLATELAS
	    
	    
	    #include "p16f628.inc"		;PIC TO UTILIZE
	    ;CONFIGURATION BITS (ONLY MCLRE ON AND INTERNAL OSCILATOR)
 __CONFIG _FOSC_INTOSCIO & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
cont1	    equ 0x20	    ;DEFINE CONT1 IN POSITION 20
cont2	    equ 0x21	    ;DEFINE CONT2 IN POSITION 21
cont3	    equ 0x22	    ;DEFINE CONT3 IN POSITION 22
cont4	    equ	0x23	    ;DEFINE CONT4 IN POSITION 23
counter	    equ	0x24	    ;TO SEARCH IN THE TABLE
looper	    equ	0x25	    ;TO LOOP IT TO INFINITE
value	    equ	0x26	    ;TO STORE THE VALUE OF THE TABLE

	
delay_time  equ	0xFF	    ;DELAY TIME HAS MAXIMUN VALUE IN 8 BITS
repeater    equ	d'2'	    ;REPEATER IS 6 IN DECIMAL
 
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
	    ;CONFIGURATING PORTS
    BSF	    STATUS,RP0	    ;CHANGE MEMORY BANK
    CLRF    TRISB	    ; CONFIGURATE PORT B AS OUTPUT
    BCF	    STATUS,RP0
    
    ;SAME WITH PORT A
    BSF	    STATUS,RP0
    CLRF    TRISA
    BCF	    STATUS,RP0
	    
    
	    ;INITIALIZING PORTS IN ZERO
    CLRF    PORTA
    CLRF    PORTB
    CLRF    value

PROGRAM
    CLRF    counter	;START FROM THE FIRST VALUE IN TABLE
    MOVLW   d'25'	;SIZE OF TABLE
    MOVWF   looper	;RESET VARIABLE
    
    
BEGIN
    ;PRINTING IN PORT A
    MOVF    counter, 0	;LOOK UP FOR THIS VALUE IN TABLE 2
    CALL    TABLA2	;RETURN THE VALUE IN THAT POSITION
    MOVWF   value	;STORE THE VALUE
    BTFSC   value, 5	;CHECK IF IT IS NECESSARY TO USE THE EXTRA PIN IN PORT B
    CALL    SWAP5	;IF NECESSARY TRIGGER THIS
    MOVFW   value	;ELSE JUST KEEP ROLLIN'
    MOVWF   PORTA	;PRINT IT IN PORT A
    CALL    DELAY
    
        ;THIS PART PRINTS PORT B
    MOVF    counter, 0	;GO FOR THIS VALUE IN THE TABLE
    CALL    TABLA	;RETURN THE VALUE IN THAT POSITION
    MOVWF   PORTB	;PRINT IT
    MOVF    counter, W	;LOAD W WITH COUNTER TO REFRESH VALUE


    
    
    INCF    counter	;ADD 1 TO MOVE TO THE NEXT VALUE IN TABLE
    MOVF    counter, W	;LOAD COUNTER IN W
    DECFSZ  looper	;CHECK IF IT'S AT THE END OF TABLE
    GOTO    BEGIN	;PRINT NEXT VALUE IN TABLE
    GOTO    PROGRAM	;PRINT TABLE AGAIN FROM THE BEGGIN
    
    
TABLA
    ADDWF   PCL, F
    RETLW   b'01110110'	;H
    RETLW   b'00111111'	;O
    RETLW   b'00111000'	;L
    RETLW   b'01110111'	;A
    RETLW   b'00001000' ;_
    RETLW   b'01001111'	;M (3)
    RETLW   b'00011100'	;U
    RETLW   b'01010100'	;N
    RETLW   b'01011110'	;D
    RETLW   b'00111111'	;O
    RETLW   b'00001000'	;_
    RETLW   b'01111001'	;E
    RETLW   b'01010000'	;r
    RETLW   b'00010000'	;i
    RETLW   b'01011000'	;c
    RETLW   b'01110101'	;'k' of pain (h like) 
    RETLW   b'01110011'	;P
    RETLW   b'01110111'	;A
    RETLW   b'00111000'	;L
    RETLW   b'00111111'	;O
    RETLW   b'01001111'	;M (3)
    RETLW   b'01110111'	;A
    RETLW   b'01010000'	;r
    RETLW   b'01111001'	;E
    RETLW   b'01101101'	;S
    
TABLA2
    ;POSITION 5 IS NEVER USED (PROGRAMMERS MODE)
    ;POSITION 6 WILL SWAP WITH THE EXTRA BIT IN PORT B
    ADDWF   PCL, F
    RETLW   b'11100110'	;H
    RETLW   b'01101111'	;O
    RETLW   b'01101000'	;L
    RETLW   b'11100111'	;A
    RETLW   b'00001000'	;_
    RETLW   b'10001111'	;M(3)
    RETLW   b'00101100'	;u
    RETLW   b'10100100'	;n
    RETLW   b'10101110'	;d
    RETLW   b'01101111'	;O
    RETLW   b'00001000'	;_
    RETLW   b'11101001'	;E
    RETLW   b'10100000'	;r
    RETLW   b'00100000'	;i
    RETLW   b'10101000'	;c
    RETLW   b'11100101'	;k (h like)
    RETLW   b'11100011'	;P
    RETLW   b'11100111'	;A
    RETLW   b'01101000'	;L
    RETLW   b'01101111'	;O
    RETLW   b'10001111'	;M(3)
    RETLW   b'11100111'	;A
    RETLW   b'10100000'	;r
    RETLW   b'11101001'	;E
    RETLW   b'11001101'	;S
    
    
    
    
SWAP5
    BSF	PORTB,7	    ;PRINT THE EXTRA PIN OF PORT B
    BCF	value,5	    ;DON'T USE THIS
    RETURN
    
DELAY
 ;FIRST LET'S INITIALIZATE THE VARIABLES
    MOVLW	delay_time  ;CALL VALUE DELAY_TIME
    MOVWF	cont1	    ;SET CONT AS THE VALUE PREVIOSLY CALLED (FF)
    MOVWF	cont2	    ;SET SECOND CONT AS FF, NO NEED TO CALL FF AGAIN
    
    MOVLW	repeater    ;SAME AS ABOVE BUT WITH DIFERENT VALUE
    MOVWF	cont3	

LOOP1
    DECFSZ	cont1	    ;DECREMENT ONE, SKIP IF ZERO
    GOTO	L1	    ;WHEN IT GOES TO L1 IT JUST RETURNS HERE
    GOTO	LOOP2	    ;GOING ONE STEP UP
L1
    GOTO	LOOP1	    ;SMALL DELAYER
LOOP2
    MOVLW	repeater    ;I WILL USE ANOTHER SMALL LOOP WITH ONLY 6 LOOPS
    MOVWF	cont4	    ;SET ANOTHER VARIABLE
    
    DECFSZ	cont2	    ;EXECUTE NEXT LINE FF TIMES
    GOTO	L2	    
    GOTO	LOOP3	    ;ONE STEP ABOVE WHEN EVERYTHING IS DONE
    ;SO LOOP 1 EXECUTES FF TIMES FOREACH TIME IN LOOP2
L2
    DECFSZ	cont4	    ;LOOP THAT EXECUTES ONLY 6 TIMES FOR PRECISSON
    GOTO	SmallDelay  ;GO TO A SMALL DELAY
    MOVLW	delay_time  ;SETTING VARIABLE TO EXECUTE FF TIMES LOOP 1 AGAIN
    MOVWF	cont1	    
    
    GOTO	LOOP1	    ;RETURN TO LOOP1
    ;SO EVERY LOOP 2 HAS ANOTHER DELAY
    
    ;THE SMALL DELAY BEHAVES THE SAME WAY AS L1 BUT IN THE SECOND LOOP
SmallDelay
    GOTO	L2
    
    ;LAST STEP
LOOP3
    DECFSZ	cont3	;EXECUTES FEWER TIMES BECAUSE I WON'T IT LASTING TOO LONG
    GOTO	L3	;THE SAME AS LOOP2 WITHOUT A SMALL DELAY
    RETURN		;RETURN TO THE MAIN PROGRAM WHEN EVERYTHING EXECUTES 6 TIMES
L3
    MOVLW	delay_time  ;RESET THE VARIABLES FROM LOOP1 AND 2 TO USE THEM AGAIN
    MOVWF	cont1	    
    MOVWF	cont2
    GOTO	LOOP1	    ;START OVER AGAIN FROM LOOP1


COMPLETE
    END