#include <stdio.h>

// Deklaracja funkcji w assemblerze
extern float series(int n);


//float series(int n);
//an = 3.21*an-1 + 1.23*an-2
// a1 =2 , a2 = 3 


int main() {
    int n;
    
    // Wczytanie wartości n
    printf("Podaj n: ");
    scanf("%d", &n);

    // Początkowe wartości a1 = 2, a2 = 3
    float a1 = 2.0f, a2 = 3.0f;
    
    // Wywołanie funkcji rekurencyjnej
    float result = series(n, a1, a2);
    
    // Wyświetlenie wyniku
    printf("Wynik dla n=%d: %.4f\n", n, result);
    
    return 0;
}
