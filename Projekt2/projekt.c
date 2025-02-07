#include <stdio.h>

extern float x_cube_root(float x);

int main() {
    float x, result; 
    int precision; 
    char decision;
    const float FLT_MAX = 3.40282347e+38F;              
    const unsigned int UINT_MAX = 2147483647 * 2U + 1U; 
    
    printf("Program wyliczajacy pierwiastek 3 stopnia z x.\n");

    do {

        printf("Podaj wartosc x: ");
        if (scanf("%f", &x) != 1) {
            printf("Niepoprawna wartosc x. Upewnij sie, ze podales liczbe.\n");
            while (getchar() != '\n'); 
            continue;
        }
        if (x < -FLT_MAX || x > FLT_MAX) {
            printf("Niepoprawna wartosc x.\n");
            continue;
        }

        printf("Podaj dokladnosc zaokraglenia po przecinku: ");
        if (scanf("%d", &precision) != 1) {
            printf("Niepoprawna wartosc przyblizenia. Upewnij sie, ze podales liczbe calkowita.\n");
            while (getchar() != '\n'); 
            continue;
        }
        if (precision < 0 || precision > UINT_MAX || -UINT_MAX > precision) {
            printf("Niepoprawna wartosc przyblizenia.\n");
            continue;
        }

        if (x < 0) {
            result = -x_cube_root(-x);
        } else {
            result = x_cube_root(x);
        }

        printf("Pierwiastek trzeciego stopnia z %f wynosi %.*f\n", x, precision, result);

        printf("Czy chcesz kontynuowac? (wpisz y, aby kontynuowac lub dowolny klawisz aby zakonczyc): ");
        char c;
        scanf(" %c", &c);
        if (c != 'y' && c != 'Y') {
            break;
        }
    } while (1); 
    
    return 0;
}
