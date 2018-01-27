//Constants
#define ACIAC 0x8001
#define ACIAD 0x8003
#define RDRF 1
#define TDRE 2
#define MENU "\nMenu\n\r 1. Add\n\r 2. Subtract\n\r 3. Multiply\n\r 4. Divide\n\r"
#define answer "Result: "
#define MSG0 "Single Digit Result Addition \n"
#define MSG1 "Enter your 1st number: "
#define MSG2 "Enter your 2nd number: "
#define MSG3 " + "
#define MSG4 " = "
#define MSG5 "Would you like to do another addition?\n"
#define MSG6 "Goodbye!\n"
#define MSG7 "Num1: "
#define MSG8 "Num2: "
#define CR   0x0D
#define LF   0x0A

//Protocols
unsigned char getInput();
void printPrompt();
void printAnswer();

//Main Code
void main()
{
    unsigned char choice;
    unsigned char num1 = 0;
    unsigned char num2 = 0;
    unsigned char result = 0;

    while(again == 'Y' || again == 'y')
    {
       printPrompt(&MENU);
       choice = getInput();
       printPrompt(choice);
       switch(choice)
       {
            case '1':          //addition
                printPrompt();
                ASCII = getInput();
                printPrompt(ASCII);
                num1 = ASCII - 48;
                printPrompt(&MSG2);
                ASCII = getInput();
                printPrompt(ASCII);
                num2 = ASCII - 48;
        	    result = num1 + num2;
                printPrompt(&answer);
                printAnswer(result + 48);
                printPrompt(&MSG5);
                newline();
                again = getInput();
               break;

            case '2':           //subtraction
        	    newline();
                printPrompt(&MSG1);
                ASCII = getInput();
                printPrompt(ASCII);
                num1 = ASCII - 48;
                newline();
                printPrompt(&MSG2);
                ASCII = getInput();
                printPrompt(ASCII);
                num2 = ASCII - 48;
        	    result = num1 - num2;
                newline();
                printPrompt(&answer);
                printAnswer(result + 48);
                newline();
                printPrompt(&MSG5);
                newline();
                again = getInput();
               break;

            case '3':           //multiplication
        	    newline();
                printPrompt(&MSG1);
                ASCII = getInput();
                printPrompt(ASCII);
                num1 = ASCII - 48;
                newline();
                printPrompt(&MSG2);
                ASCII = getInput();
                printPrompt(ASCII);
                num2 = ASCII - 48;
        	    result = num1 * num2;
                newline();
                printPrompt(&answer);
                printAnswer(result + 48);
                newline();
                printPrompt(&MSG5);
                newline();
                again = getInput();
                break;

            case '4':           //division
                newline();
                printPrompt(&MSG1);
                ASCII = getInput();
                printPrompt(ASCII);
                num1 = ASCII - 48;
                newline();
                printPrompt(&MSG2);
                ASCII = 0;
                ASCII = getInput();
                printPrompt(ASCII);
                num2 = ASCII - 48;
                printPrompt(&MSG7);
                newline();
                printPrompt(num1 + 48);
                newline();
                printPrompt(&MSG8);
                printPrompt(num2 + 48);
                newline();
        	    result = num1 / num2;
                newline();
                printPrompt(&answer);
                printAnswer(result + 48);
                newline();
                printPrompt(&MSG5);
                newline();
                again = getInput();
                break;
       }
	}

	printPrompt(&MSG6);
	newline();
}

//Subroutine to get an int typed into Hyperterminal
void getInput()
{
    
}

//Subroutine to print a prompt string to Hyperterminal
void printPrompt()
{
    
}

//Subroutine to print an answer string to Hyperterminal
void printAnswer()
{
    
}
