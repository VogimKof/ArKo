#include <stdio.h>

	extern void _tablica (int *a); 

	void tablica (int *a);

	int tab[4];

	int main()
	{
		int i;
		for (i=0;i<4;i++)
			tab[i]=2*(i+1)+5;
		for (i=0;i<4;i++)
			printf("%d ", tab[i]);
		tablica(tab);
		for (i=0;i<4;i++)
			printf("%d ", tab[i]);
		return 0;
	}

/*	void wskaznik (int *a)
	{
		//*a=45;
	}
*/