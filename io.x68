; Z:\USERS\SPENCER\DOWNLOADS\PROJECT 1\MYPROG\IO.C - Compiled by CC68K  Version 5.00 (c) 1991-2005  Peter J. Fondse
; //Constants
; #define ACIAC 0x8001
; #define ACIAD 0x8003
; #define RDRF 1
; #define TDRE 2
; #define MENU "\nMenu\n\r 1. Add\n\r 2. Subtract\n\r 3. Multiply\n\r 4. Divide\n\r"
; #define answer "Result: "
; #define MSG0 "Single Digit Result Addition \n"
; #define MSG1 "Enter your 1st number: "
; #define MSG2 "Enter your 2nd number: "
; #define MSG3 " + "
; #define MSG4 " = "
; #define MSG5 "Would you like to do another addition?\n"
; #define MSG6 "Goodbye!\n"
; #define MSG7 "Num1: "
; #define MSG8 "Num2: "
; #define CR   0x0D
; #define LF   0x0A
; //Protocols
; unsigned char getInput();
; void printPrompt();
; void printAnswer();
; //Main Code
; void main()
; {
    org $1000
    
_main:
       movem.l   D2/D3/D4/D5/A2/A3,-(A7)
       lea       _printPrompt.L,A2
       lea       _printAnswer.L,A3
; unsigned char choice = 5;
       moveq     #5,D5
; unsigned char num1 = 0;
       clr.b     D4
; unsigned char num2 = 0;
       clr.b     D3
; unsigned char result = 0;
       clr.b     D2
; while(choice != 0)
main_1:
       tst.b     D5
       beq       main_3
; {
; printAnswer();
       lea     instrMsg,a1 //display menu
       jsr       (A3) //go to printAnswer
       lea     opMsg,a1 //display 'enter operation'
       jsr       (A2) //go to printPrompt

; choice = getInput();
       jsr       _getInput
       move.b    D0,D5
; printPrompt();
       jsr       (A2)
; switch(choice)
       and.l     #255,D5
       move.l    D5,D0
       sub.l     #48,D0
       blo       main_5
       cmp.l     #5,D0
       bhs       main_5
       asl.l     #1,D0
       move.w    main_6(PC,D0.L),D0
       jmp       main_6(PC,D0.W)
main_6:
       dc.w      main_7-main_6
       dc.w      main_8-main_6
       dc.w      main_9-main_6
       dc.w      main_10-main_6
       dc.w      main_11-main_6
main_7:
; {
; case '0':   //exit
; break;
       bra       main_5
main_8:
; case '1':          //addition
; printPrompt();
       jsr       (A2)
; result = num1 + num2;
       move.b    D4,D0
       add.b     D3,D0
       move.b    D0,D2
; printAnswer();
       jsr       (A3)
; break;
       bra       main_5
main_9:
; case '2':           //subtraction
; printPrompt();
       jsr       (A2)
; result = num1 - num2;
       move.b    D4,D0
       sub.b     D3,D0
       move.b    D0,D2
; printAnswer();
       jsr       (A3)
; break;
       bra.s     main_5
main_10:
; case '3':           //multiplication
; printPrompt();
       jsr       (A2)
; result = num1 * num2;
       move.b    D4,D0
       and.w     #255,D0
       and.w     #255,D3
       mulu.w    D3,D0
       move.b    D0,D2
; printAnswer();
       jsr       (A3)
; break;
       bra.s     main_5
main_11:
; case '4':           //division
; printPrompt();
       jsr       (A2)
; result = num1 / num2;
       move.b    D4,D0
       and.l     #65535,D0
       divu.w    D3,D0
       move.b    D0,D2
; printAnswer();
       jsr       (A3)
; break;
main_5:
       bra       main_1
main_3:
; }
; }
; printPrompt();
       jsr       (A2)
       movem.l   (A7)+,D2/D3/D4/D5/A2/A3
       rts
; }
; //Subroutine to get an int typed into Hyperterminal
; unsigned char getInput()
; {

_getInput:
    lea     firstNumMsg,a1 //display 'enter first number'
    jsr       (A2) //go to printPrompt
    ;store first result somewhere
    
    lea     secondNumMsg,a1 //display 'enter second number'
    jsr       (A2) //go to printPrompt
    ;store second result somewhere
    
    
    
    rts
; }
; //Subroutine to print a prompt string to Hyperterminal
; void printPrompt()
; {
_printPrompt: ;(A2)
       move.b  #14,d0      Display instructions
       trap    #15
       rts
; }
; //Subroutine to print an answer string to Hyperterminal
; void printAnswer()
; {
_printAnswer: ;(A3)
       move.b  #14,d0      
       trap    #15
       rts
; }

CR      EQU     $0D
LF      EQU     $0A
instrMsg    dc.b    CR,LF,CR,LF
      dc.b '---Simple Calculator',CR,LF
      dc.b '1. Addition ',CR,LF
      dc.b '2. Subtraction',CR,LF
      dc.b '3. Multiplication',CR,LF
      dc.b '4. Division',CR,LF
      dc.b '0. Exit',CR,LF,CR,LF,0
      
opMsg dc.b CR,LF,'Enter a the operation you would like to perform:  ',0
firstNumMsg    dc.b    CR,LF,'Enter a number from -99 to 99: ',0
secondNumMsg dc.b CR,LF,'Enter another number from -99 to 99: ',0
resultMsg dc.b CR,LF,'Your result is: ',0
exitMsg dc.b CR,LF,'The program has ended.',0

    END $1000
    
    











