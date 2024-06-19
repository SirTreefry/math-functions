//Andrew Trefry
//Flame Tube code
#include <stdio.h>
# define M_PI           3.14159265358979323846  /* pi */

int main(){
int type;
float turbo_in,turbo_rad;
float flame_length,flame_width;
float casing;
float area, diameter;
float hole_1[7] = {}; //area, percentage, area_perc, hole_number, area per hole, number holes
float hole_2[7] = {0,20,0};
float hole_3[7] = {0,50,0};
printf("operating in mm\n");
printf("What is your turbo inlet diameter");
scanf("%f",&turbo_in);
turbo_rad = turbo_in / 2;

flame_width = turbo_in *2;
flame_length = turbo_in *6;
casing = flame_width + 30;

printf("Hole determination\n");
printf("Number of holes 0 or Size of holes 1 CHOICE:");
scanf("%d",&type);

if(type == 0){
//section 1
hole_1[0] = turbo_rad * turbo_rad * M_PI;
hole_1[1] = .3;
hole_1[2] = hole_1[0] * hole_1[1];//area_perc
printf("\nHow many holes do you want for the first set:");
scanf("%f",&hole_1[3]);
hole_1[4] = hole_1[2] / hole_1[3];

//section 2
hole_2[0] = turbo_rad * turbo_rad * M_PI;
hole_2[1] = .2;
hole_2[2] = hole_2[0] * hole_2[1];//area_perc
printf("\nHow many holes do you want for the second set:");
scanf("%f",&hole_2[3]);
hole_2[4] = hole_2[2] / hole_2[3];

//section 3
hole_3[0] = turbo_rad * turbo_rad * M_PI;
hole_3[1] = .5;
hole_3[2] = hole_3[0] * hole_3[1];//area_perc
printf("\nHow many holes do you want for the third set:");
scanf("%f",&hole_3[3]);
hole_3[4] = hole_3[2] / hole_3[3];

printf("\nSECTION 1");
printf("\nTotal area 1st section: %f", hole_1[2]);
printf("\nArea per-hole: %f", hole_1[4]);
printf("\nNumber holes choosen %f", hole_1[3]);

printf("\nSECTION 2");
printf("\nTotal area 2st section: %f", hole_2[2]);
printf("\nArea per-hole: %f", hole_2[4]);
printf("\nNumber holes choosen %f", hole_2[3]);

printf("\nSECTION 3");
printf("\nTotal area 3st section: %f", hole_3[2]);
printf("\nArea per-hole: %f", hole_3[4]);
printf("\nNumber holes choosen %f", hole_3[3]);

}

if(type == 1){
hole_1[0] = turbo_rad * turbo_rad * M_PI;
hole_1[1] = .3;
hole_1[2] = hole_1[0] * hole_1[1];//area_perc
printf("\what size holes do you want 1st section DIAMETER:");
scanf("%f",&diameter);
hole_1[4] = (diameter / 2)*(diameter / 2)* M_PI;
hole_1[3] = hole_1[2] / hole_1[4];

hole_2[0] = turbo_rad * turbo_rad * M_PI;
hole_2[1] = .2;
hole_2[2] = hole_2[0] * hole_2[1];//area_perc
printf("\what size holes do you want 2nd section DIAMETER:");
scanf("%f",&diameter);
hole_2[4] = (diameter / 2)*(diameter / 2)* M_PI;
hole_2[3] = hole_2[2] / hole_2[4];

hole_3[0] = turbo_rad * turbo_rad * M_PI;
hole_3[1] = .5;
hole_3[2] = hole_3[0] * hole_3[1];//area_perc
printf("\what size holes do you want 3rd section DIAMETER:");
scanf("%f",&diameter);
hole_3[4] = (diameter / 2)*(diameter / 2)* M_PI;
hole_3[3] = hole_3[2] / hole_3[4];


printf("\nSECTION 1");
printf("\nTotal area 1st section: %f", hole_1[2]);
printf("\nArea per-hole: %f", hole_1[4]);
printf("\nNumber holes %f", hole_1[3]);

printf("\nSECTION 2");
printf("\nTotal area 2st section: %f", hole_2[2]);
printf("\nArea per-hole: %f", hole_2[4]);
printf("\nNumber holes %f", hole_2[3]);

printf("\nSECTION 3");
printf("\nTotal area 3st section: %f", hole_3[2]);
printf("\nArea per-hole: %f", hole_3[4]);
printf("\nNumber holes %f", hole_3[3]);

printf("\nFlame tube length: %f", flame_length);
printf("\nFlame tube width: %f", flame_width);

}
}
