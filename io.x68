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
void getInput();
void printPrompt();
void printAnswer();

//Main Code
void main()
{
    unsigned char choice = 5;
    unsigned char num1 = 0;
    unsigned char num2 = 0;
    unsigned char result = 0;

    while(choice != 0)
    {
       printPrompt();
       choice = getInput();
       printPrompt();
       switch(choice)
       {
            case '0':   //exit
                break;

            case '1':          //addition
                printPrompt();
        	    result = num1 + num2;
                printAnswer();
                break;

            case '2':           //subtraction
                printPrompt();
        	    result = num1 - num2;
                printAnswer();
                break;

            case '3':           //multiplication
                printPrompt();
        	    result = num1 * num2;
                printAnswer();
                break;

            case '4':           //division
                printPrompt();
        	    result = num1 / num2;
                printAnswer();
                break;
       }
	}

	printPrompt();
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
