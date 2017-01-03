// File Name :			Week 8 Part 1
// Description :		Calls assembly functions
// Chris Moffett

#include <stdio.h>
#include <windows.h>

// Define the assembly function prototypes
void normalMath();
void extendMath();
void extendMath2();
 

int main(void)
{
	//Please note only normalMath or extendMath may be activated at once, they both pull from same arrays
	printf("Op1 Op2 Normal Math: ");
	normalMath();
	printf("\nOp1 Op2 Extended Math: ");
	extendMath();
	printf("\nOp3 Op4 Extended Math: ");
	extendMath2();

	return 0;
}