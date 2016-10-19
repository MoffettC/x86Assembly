// File Name :			Week 7 Part 1
// Description :		Calls assembly functions
// Chris Moffett

#include <stdio.h>
#include <windows.h>


// Color definitions
#define	lightgreen 10
#define lightBlue 9
#define white 15

HANDLE hConsole;

// Define the assembly function prototypes
void randomColor();
 
//------------------------------------------------------------------
// The following function is called from the assembly module
void printTheNumber(int num) {
	printf("The number is %d\n", num);
} 
  
void generateColor(int num) {							//Generates color based on number
	if (num <= 9830) {				 					//30% white
		SetConsoleTextAttribute(hConsole, white);
	}
	else if (9830 < num && num <= 13106) { 
		SetConsoleTextAttribute(hConsole, lightBlue);   //10% lightBlue 
	}
	else {
		SetConsoleTextAttribute(hConsole, lightgreen);  //60% lightgreen
	}
}

int main(void)
{
	hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
	randomColor(); 

	return 0;
}