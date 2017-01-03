// File Name :			Week 7 Part 1
// Description :		Calls assembly functions
// Chris Moffett

#include <stdio.h>
#include <windows.h>

// Define the assembly function prototypes
void compoundExp();

int main(void)
{
	printf("7, 8, 13\n");
	compoundExp(7, 8, 13);
	printf("13, 8, 7\n");
	compoundExp(13, 8, 7);
	printf("0, 8, 13\n");
	compoundExp(0, 8, 13);
	printf("7, 7, 13\n");
	compoundExp(7, 7, 13);
	printf("7, 13, 13\n");
	compoundExp(7, 13, 13);

	printf("\nWhat about: 13, 7, 13\n");
	compoundExp(13, 7, 13);
	printf("\nWhat about: 7, 13, 7\n");
	compoundExp(7, 13, 7);

	return 0;
}