//Andrew Trefry
//Runge Kutta Method
#include <string.h>
#include <math.h>
#include <time.h>


void intial_value(){//rk4 approximation
float h_size = 0.1;
int iterate;
float y_int = 1,x_int = 0;//y_0 and x_0
float function_y,function_x;//iterative steps after y_0 and x_0
float y,x;
float diff_eq;//-2*y + 2 - exp(-4*x);
int c,s;
float k_sum = 0,k_total;//sum part of runge kutta summation loop
float a[10];
float k[10];
float b[10];
float x[10], y[10];

y = y_int;
x = x_int;//euler method for first time of 4
diff_eq = -2*y + 2 - exp(-4*x); //change this depedning on the differential equation of choice
x[0] = h_size;
y[0] = y_int + diff_eq*h_size; //euler step, y_int + diff_eq*(function_x + x_int)
k[0] = diff_eq;

iterate = 1;
while(10 > iterate){
    k_sum = 0;
    for(s = 0; iterate > s;s++){// k_loop sum value for f(x,y) of n+1
    if(s == iterate ){
        y = y_int + k_sum*h_size; // input into function to obtasin final point
        x[iterate] = x_int + c*h_size;
        k[iterate] =  2*y + 2 - exp(-4*x);
    }

    else{
    k_sum = a[s]*k[s-1] + k_sum; //obtain k_n for specific s amount  in interval
    }
    }
    k_total = 0;
    for(s = 0; iterate > s;s++){//loop for actual y n+1 sum actual runge kutta method
    k_total = k[s]*b[s] + h_size*k_total;
    }
    y[iterate] = y_int + K_total;
}

printf("%f ",function_y);
printf("%f", function_x);
return 0;
}


int main(){
intial_value();



return 0;
}
