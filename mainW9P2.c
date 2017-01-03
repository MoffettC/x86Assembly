// File Name :			Week 9 Part 2 GROUP
// Description :		Calls assembly functions
// Chris Moffett


#include <stdio.h>
#include <windows.h>
#include <stdlib.h>



int main(void)
{
	char tokens[] = "token1 token2 token3 token4";
	char *tokenPtrs[5], *ptr;
	int tokenCount = 0;
	char s[] = " ";


	// Use strtok to get pointers to tokens in the tokens string
	ptr = strtok(tokens, s);
	while (ptr != NULL) {
		tokenPtrs[tokenCount++] = ptr;
		ptr = strtok(NULL, s);
	}
	for (int i = 0; i < tokenCount; i++)
		printf("Token %d: %s\n", (i + 1), tokenPtrs[i]);

	return 0;
}