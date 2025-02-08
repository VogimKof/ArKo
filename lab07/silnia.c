#include <stdio.h>

extern int _silnia(int a);
int silnia(int a);


int main() {
    int number;

    // Pobranie liczby od użytkownika
    printf("Podaj liczbe: ");
    scanf("%d", &number);

    // Sprawdzenie, czy liczba jest nieujemna
    if (number < 0) {
        printf("Silnia jest zdefiniowana tylko dla liczb nieujemnych.\n");
    } else {
        // Obliczenie silni i wypisanie wyniku      
        printf("Silnia liczby %d wynik: ", silnia(number));
	}
	
	scanf("%c");
	return 0;
}