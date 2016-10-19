// File Name :			Week 8 Part 1
// Description :		Calls assembly functions
// Chris Moffett

#include <stdio.h>
#include <windows.h>
#include <stdlib.h>

unsigned char varPrecision = 16; //input from user settings
unsigned char currentNum[16];
unsigned char nextNum[16];
unsigned long long inputNum;

int main(void)
{

	printf("Please enter your initial number: ");		//get initial user number
	scanf("%llu", &inputNum);
	int j = 0;
	for (int i = 0; i < 16; i++) {
		currentNum[i] = inputNum >> j;
		j += 8;
	}
	displayAsHexInt(currentNum, sizeof(currentNum));


	printf("\nPlease enter your next number to add: "); //get next user number to add
	scanf("%llu", &inputNum);
	j = 0;
	for (int i = 0; i < 16; i++) {
		nextNum[i] = inputNum >> j;
		j += 8;
	}
	displayAsHexInt(nextNum, sizeof(nextNum));

	printf("\n");
	extendAdd(currentNum, nextNum, varPrecision); // args(previous number, number to add, precision var)
	printf("Current Number: ");
	displayAsHexInt(currentNum, sizeof(currentNum));	//display added total


	printf("\nPlease enter your next number to subtract: "); //get next user number to subtract
	scanf("%llu", &inputNum);
	j = 0;
	for (int i = 0; i < 16; i++) {
		nextNum[i] = inputNum >> j;
		j += 8;
	}
	displayAsHexInt(nextNum, sizeof(nextNum));
	
	printf("\n");
	extendSub(currentNum, nextNum, varPrecision); // args(previous number, number to sub, precision var)
	printf("Current Number: ");
	displayAsHexInt(currentNum, sizeof(currentNum)); //display sub total

	return 0;
}