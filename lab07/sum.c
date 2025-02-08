#include <stdio.h>

extern int _sum(int a, int b);
int sum(int a, int b);

int main()
{
	int a, b, result;
	
	printf("Enter first value: ");
	scanf("%d", &a);
	
	printf("Enter second value: ");
	scanf("%d", &b);
	
	result = sum(a, b);
	printf("%d + %d = %d\n", a, b, result);
	
	//scanf("%c");
	return 0;
}