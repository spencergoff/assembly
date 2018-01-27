; C:\USERS\STUDENT\DOWNLOADS\PROJECT 1 (1)\PROJECT 1\MYPROG\IO.C - Compiled by CC68K  Version 5.00 (c) 1991-2005  Peter J. Fondse
; //by Eugene Rockey Copyright 2012 All Rights Reserved
; //Constants
; #define ACIAC 0x8001
; #define ACIAD 0x8003
; #define RDRF 1
; #define TDRE 2
; #define MENU "\nMenu\n\r 1. Addition\n\r 2. Subtraction\n\r 3. Multiplication\n\r 4. Division\n\r"
; #define answer "Result: "
; #define MSG0 "Single Digit Result Addition"
; #define MSG1 "Enter First Number: "
; #define MSG2 "Enter Second Number: "
; #define MSG3 " + "
; #define MSG4 " = "
; #define MSG5 "Add Again?"
; #define MSG6 "Goodbye!"
; #define MSG7 "Num1: "
; #define MSG8 "Num2: "
; #define CR   0x0D
; #define LF   0x0A
; //Protocols
; unsigned char getchar(void);
; void sendchar(unsigned char c);
; void sendmsg(unsigned int msga);
; void newline(void);
; //Main Code
; void main()
; {

_main:
       link      A6,#-4
       movem.l   D2/D3/D4/D5/A2/A3/A4/A5,-(A7)
       lea       _newline.L,A2
       lea       _sendmsg.L,A3
       lea       _sendchar.L,A4
       lea       _getchar.L,A5
; unsigned char choice;
; unsigned char num1 = 0;
       clr.b     D4
; unsigned char num2 = 0;
       clr.b     D3
; unsigned char ASCII = 0;
       clr.b     D2
; unsigned char result = 0;
       clr.b     D5
; unsigned char again = 'Y';
       move.b    #89,-1(A6)
; newline();
       jsr       (A2)
; sendmsg(&MSG1);
       lea       io_1,A6       
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num1 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D4
; newline();
       jsr       (A2)
; sendmsg(&MSG2);
       lea       io_2.L,A7
,      jsr       (A3)
       addq.w    #4,A7
; ASCII = 0;
       clr.b     D2
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num2 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D3
; newline();
       jsr       (A2)
; sendmsg(&MSG7);
       lea       io_3.L,A6
       jsr       (A3)
       addq.w    #4,A7
; sendchar(num1 + 48);
       move.b    D4,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG8);
       lea       io_4.L,A6
       jsr       (A3)
       addq.w    #4,A7
; sendchar(num2 + 48);
       move.b    D3,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; result = num1 / num2;
       move.b    D4,D0
       
       divu.w    D3,D0
       and.l     #65535,D0
       move.b    D0,D5
; newline();
       jsr       (A2)
; sendmsg(&answer);
       lea       io_5.L,A6
       jsr       (A3)
       addq.w    #4,A7
; //sendchar(result);
; //result = result + 48;
; sendchar(result + 48);
       move.b    D5,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG5);
       lea       io_6.L,A6
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; again = getchar();
       jsr       (A5)
       move.b    D0,-1(A6)
; /*while(again == 'Y' || again == 'y')
; {
; newline();
; sendmsg(&MENU);
; newline();
; choice = getchar();
; sendchar(choice);
; switch(choice)
; {
; case '1':          //addition
; newline();
; sendmsg(&MSG1);
; ASCII = getchar();
; sendchar(ASCII);
; num1 = ASCII - 48;
; newline();
; sendmsg(&MSG2);
; ASCII = getchar();
; sendchar(ASCII);
; num2 = ASCII - 48;
; result = num1 + num2;
; newline();
; sendmsg(&answer);
; sendchar(result + 48);
; newline();
; sendmsg(&MSG5);
; newline();
; again = getchar();
; break;
; case '2':           //subtraction
; newline();
; sendmsg(&MSG1);
; ASCII = getchar();
; sendchar(ASCII);
; num1 = ASCII - 48;
; newline();
; sendmsg(&MSG2);
; ASCII = getchar();
; sendchar(ASCII);
; num2 = ASCII - 48;
; result = num1 - num2;
; newline();
; sendmsg(&answer);
; sendchar(result + 48);
; newline();
; sendmsg(&MSG5);
; newline();
; again = getchar();
; break;
; case '3':           //multiplication
; newline();
; sendmsg(&MSG1);
; ASCII = getchar();
; sendchar(ASCII);
; num1 = ASCII - 48;
; newline();
; sendmsg(&MSG2);
; ASCII = getchar();
; sendchar(ASCII);
; num2 = ASCII - 48;
; result = num1 * num2;
; newline();
; sendmsg(&answer);
; sendchar(result + 48);
; newline();
; sendmsg(&MSG5);
; newline();
; again = getchar();
; break;
; case '4':           //division
; newline();
; sendmsg(&MSG1);
; ASCII = getchar();
; sendchar(ASCII);
; num1 = ASCII - 48;
; newline();
; sendmsg(&MSG2);
; ASCII = 0;
; ASCII = getchar();
; sendchar(ASCII);
; num2 = ASCII - 48;
; sendmsg(&MSG7);
; newline();
; sendchar(num1 + 48);
; newline();
; sendmsg(&MSG8);
; sendchar(num2 + 48);
; newline();
; result = num1 / num2;
; newline();
; sendmsg(&answer);
; //sendchar(result);
; //result = result + 48;
; sendchar(result + 48);
; newline();
; sendmsg(&MSG5);
; newline();
; again = getchar();
; break;
; }
; }*/
; sendmsg(&MSG6);
       pea       io_7.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
       movem.l   (A7)+,D2/D3/D4/D5/A2/A3/A4/A5
       unlk      A6
       rts
; }
; //Subroutine to get a character typed into Hyperterminal
; unsigned char getchar()
; {
       xdef      _getchar
_getchar:
       link      A6,#-8
       move.l    D2,-(A7)
; unsigned char temp = 0;
       clr.b     D2
; unsigned char * const C = (unsigned char *) ACIAC;
       move.l    #32769,-8(A6)
; unsigned char * const D = (unsigned char *) ACIAD;
       move.l    #32771,-4(A6)
; while (temp == 0) {temp = *C & RDRF;}
getchar_1:
       tst.b     D2
       bne.s     getchar_3
       move.l    -8(A6),A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
       bra       getchar_1
getchar_3:
; temp = *D;
       move.l    -4(A6),A0
       move.b    (A0),D2
; return temp;
       move.b    D2,D0
       move.l    (A7)+,D2
       unlk      A6
       rts
; }
; //Subroutine to send a character to Hyperterminal
; void sendchar(unsigned char asciiout)
; {
       xdef      _sendchar
_sendchar:
       link      A6,#-4
       movem.l   D2/D3/D4,-(A7)
; unsigned char temp = 0;
       clr.b     D2
; unsigned char dummyread = 0;
       clr.b     -1(A6)
; unsigned char * const C = (unsigned char *) ACIAC;
       move.l    #32769,D3
; unsigned char * const D = (unsigned char *) ACIAD;
       move.l    #32771,D4
; temp = *C & RDRF;
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
; while (temp != 0)
sendchar_1:
       tst.b     D2
       beq.s     sendchar_3
; {
; dummyread = *D;
       move.l    D4,A0
       move.b    (A0),-1(A6)
; temp = *C & RDRF;
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
       bra       sendchar_1
sendchar_3:
; }
; while (temp == 0) {temp = *C & TDRE;}
sendchar_4:
       tst.b     D2
       bne.s     sendchar_6
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #2,D0
       move.b    D0,D2
       bra       sendchar_4
sendchar_6:
; *D = asciiout;
       move.l    D4,A0
       move.b    11(A6),(A0)
       movem.l   (A7)+,D2/D3/D4
       unlk      A6
       rts
; }
; //Subroutine to send a message string to Hyperterminal
; void sendmsg(unsigned int msg)
; {
       xdef      _sendmsg
_sendmsg:
       link      A6,#0
       movem.l   D2/D3,-(A7)
; unsigned char * strptr = (unsigned char *) msg;
       move.l    8(A6),D3
; unsigned char ASCII = *strptr;
       move.l    D3,A0
       move.b    (A0),D2
; while (ASCII != 0)
sendmsg_1:
       tst.b     D2
       beq.s     sendmsg_3
; {
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       _sendchar
       addq.w    #4,A7
; strptr = strptr + 1;
       addq.l    #1,D3
; ASCII = *strptr;
       move.l    D3,A0
       move.b    (A0),D2
       bra       sendmsg_1
sendmsg_3:
       movem.l   (A7)+,D2/D3
       unlk      A6
       rts
; }
; }
; //Subroutine to start a new line in Hyperterminal
; void newline()
; {
       xdef      _newline
_newline:
; sendchar(LF);
       lea       10,A7
       jsr       _sendchar
       addq.w    #4,A7
; sendchar(CR);
       f       13
       jsr       _sendchar
       addq.w    #4,A7
       rts
; }
       section   const
io_1:
       dc.b      69,110,116,101,114,32,70,105,114,115,116,32
       dc.b      78,117,109,98,101,114,58,32,0
io_2:
       dc.b      69,110,116,101,114,32,83,101,99,111,110,100
       dc.b      32,78,117,109,98,101,114,58,32,0
io_3:
       dc.b      78,117,109,49,58,32,0
io_4:
       dc.b      78,117,109,50,58,32,0
io_5:
       dc.b      82,101,115,117,108,116,58,32,0
io_6:
       dc.b      65,100,100,32,65,103,97,105,110,63,0
io_7:
       dc.b      71,111,111,100,98,121,101,33,0

