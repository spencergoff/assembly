*-----------------------------------------------------------
* Title         : Simple Calculator for EASy68k
* Written by    : Spencer Goff
* Date Created  : Jan-21-2018

*-----------------------------------------------------------
    ORG     $1000

start   move.b  #14,d0      Display instructions
    lea     instrMsg,a1
    trap    #15

    move.b  #4,d1          Display 'enter operation' prompt
    lea     opMsg,a1
    trap    #15
    
    move.b  #4,d0         get user choice and puts into d1
    trap    #15

    cmp     #1,d1           if 1, add
    beq     add               branch if equal
    
    cmp     #2,d1           if 2, subtract
    beq     subtract        branch if equal
    
    cmp     #3,d1           if 3, multiply
    beq     multiply         branch if equal
    
    cmp     #4,d1           if 4, divide
    beq     divide           branch if equal
    
    cmp     #0,d1           if 0, exit
    move.b  #14,d0       Display 'The program has ended' prompt
    lea     exitMsg,a1
    trap    #15
    beq     end               branch if equal
  
end     SIMHALT

add move.b #14,d0   Display 'enter first number' prompt
    lea firstNumMsg,a1
    trap #15
    move.b #4,d0 retrieves user's input and saves to d1
    trap    #15  
    move d1,d2 takes whatever's in d1 (the user's input) and puts it into d2 so it can be displayed
    
    move.b  #14,d0          Display 'enter second number' prompt
    lea     secondNumMsg,a1
    trap    #15
    move.b #4,d0
    trap    #15
    
   add.b d2,d1 adds user input, stores result in d1
   
   move.b #14,d0 #displays 'your result is: '
   lea resultMsg,a1
   trap #15
      
   move.b #3,d0 #used to display contents of d1
   trap #15
    
   bra start    go back to start
    
subtract move.b #14,d0   Display 'enter first number' prompt
    lea firstNumMsg,a1
    trap #15
    move.b #4,d0 retrieves user's input and saves to d1
    trap    #15  
    move d1,d2 takes whatever's in d1 (the user's input) and puts it into d2 so it can be displayed
    
    move.b  #14,d0          Display 'enter second number' prompt
    lea     secondNumMsg,a1
    trap    #15
    move.b #4,d0
    trap    #15
    
   sub.l d2,d1 #subtracts first number from second number, stores result in d1
   
   move.b #14,d0 #displays 'your result is: '
   lea resultMsg,a1
   trap #15
      
   move.b #3,d0 #used to display contents of d1
   trap #15

   bra start    goes back to start

multiply move.b #14,d0   Display 'enter first number' prompt
    lea firstNumMsg,a1
    trap #15
    move.b #4,d0 retrieves user's input and saves to d1
    trap    #15  
    move d1,d2 takes whatever's in d1 (the user's input) and puts it into d2 so it can be displayed
    
    move.b  #14,d0          Display 'enter second number' prompt
    lea     secondNumMsg,a1
    trap    #15
    move.b #4,d0
    trap    #15
    
   muls.w d2,d1 multiplies first and second number, stores result in d1
   
   move.b #14,d0 #displays 'your result is: '
   lea resultMsg,a1
   trap #15
      
   move.b #3,d0 #used to display contents of d1
   trap #15

   bra start    goes back to start

divide

   bra start    goes back to start

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
firstNumMsg    dc.b    CR,LF,'Enter a number from 00 to 99: ',0
secondNumMsg dc.b CR,LF,'Enter another number from 00 to 99: ',0
resultMsg dc.b CR,LF,'Your result is: ',0
exitMsg dc.b CR,LF,'The program has ended.',0
        
    END     start
