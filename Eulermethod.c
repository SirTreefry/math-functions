#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

int main(){
int i = 0;
int g = 0;
double h = 0.1;
double t_n[10] = {0};
double y_n[10] = {1};
double f_n;



for(i = 0; i < 10; i++){
printf("%lf  ", t_n[i]);
printf("%lf  \n", y_n[i]);
f_n = 2 - exp(-4*t_n[i]) - 2*y_n[i];
g = i + 1;
y_n[g] = y_n[i] + (f_n)*h;
t_n[g] = t_n[i] + h;
}

}
