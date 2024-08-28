//Andrew Trefry
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define M_PI 3.14159265358979323846

void propellant_assign(double* burn_expo, double* temp_co,double *c_star){
char b_rate_name[10] = {"white lightning"};
//float c_[10] = {};//cstar
double b_rate_x[10] = {0.45};
double temp_re[10] = {0.012};
int choice = 0,num = 0,i,total = 1;//to keep track total number of propellants,and to iterate through list in assinging values

printf("PROPELLANT DESIGN VALUES\n");
while(num < 3){
printf("\ntype 1 for propellant list\n");
printf("type 2 to add a new propellant type\n");
printf("type 3 to assign propellant for nozzle simulation\n");
scanf("%d",&num);
if(num == 1){
    for(i = 0;total > i;i++){
       printf("%f  ",b_rate_x[i]);
       printf("%f  \n",temp_re[i]);
    }
}
if(num == 2){
    printf("assign new burn rate exponent\n");
    scanf("%f", &b_rate_x[total]);
    printf("\nassign new temperature coeffcient\n");
    scanf("%f", &temp_re[total]);
    printf("\n Give propellant formula a name");
    scanf("%s", &b_rate_name[total]);
    total++;
}
if(num == 3){
    printf("which propellant do you want to assign\n");
    for(i = 0;total > i;i++){
       printf("%d:  %f  %f  \n",i, b_rate_x[i], temp_re[i]);
    }
    printf("type the number of propellant you want\n");
    scanf("%d",&choice);
    *burn_expo = b_rate_x[choice];
    *temp_co = temp_re[choice];
    printf("Assingment complete\n");
}
}


}

void grain_geo(double* burn_area){//this only measures bates geometry
printf("This is for bates grains burning surface only\n");
double grain_length,hole,a;
printf("give us the grain length\n");
scanf("%lf",&grain_length);
printf("give us the hole diameter\n");
scanf("%lf",&hole);
*burn_area = (2*M_PI*(hole/2)*grain_length) + (2*M_PI*(hole/2));
}

int main(){
int choice;
double k = 1.3, p_den = 1820.23053 ,R = 8.3144; // r is molecular weight
double p_1,c_star; //pressure values
double inlet_rad, inlet_ar; //inlet values
double throat_rad; //throat values
double throat_ar;
double exit_rad, exit_ar; //exit values
double temp_co, burn_expo; //burn rate component
double mass_flow,burn_area;
double temp_1 = 2339.042;
printf("Do you want to assign a new propellant value or keep standard propellant 1 for no or 2 for yes \n");
scanf("%d",&choice);
if(choice == 2){//for propellant values
    propellant_assign(&burn_expo, &temp_co,&c_star);

}
printf("Do you want to find a burning area for specfic grain geometry 1 for no and 3 for yes \n");
scanf("%d",&choice);
if(choice == 3){
    grain_geo(&burn_area);
}
printf("What is your desired chamber pressure\n");
scanf("%lf",&p_1);

printf("these are burn rates values\n");
printf("%f ", temp_co);
printf("%f ", burn_expo);
printf("%f\n ", burn_area);

double burn_rate = temp_co * pow(p_1,burn_expo); //pow(p_1, burn_expo);


float sub_value = burn_area * (burn_rate * p_den * sqrt(R * temp_1));//denominator burn
float sub_value_2 = p_1 * sqrt(k * pow(2/(k + 1),(k + 1)/(k - 1)));
throat_ar = sub_value / sub_value_2;
throat_rad = sqrt(throat_ar/(M_PI));
printf("New Calculated values\n");
printf(" %f", sub_value);
printf(" %f", sub_value_2);
printf(" %f", burn_rate);
printf(" %f", throat_ar);
printf(" %f", throat_rad);
return 0;
}
