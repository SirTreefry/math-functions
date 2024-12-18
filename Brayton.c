//Andrew Trefry
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
//void initgraph(int *graphicsDriver, int *graphicsMode, char *driverDirectoryPath);
//cold air standard
int main(){
//preset values or measured values
int i,count; //for gnu plot output loop
float M_dot = 12; //mass flow of system
float k = 1.4;
float cp = 1.005;
float cv = .7165;
float R = 8.314; //gas constant for air
float tm_1 = 300; //temp of state 1 entering compressor ambient air
float tm_2; //temp state 2 exiting compressor
float tm_3 = 2000; //temp of state 3 exiting the combustor
float tm_4; //temp of state 4 exiting the turbine into the ambient air
float tm_5;
float Q_in; //heat entering the combustor
float W_C; // work of the compressor
float C_R = 5; // compression ratio
float T_R = 4.5; //turbine pressure ratio
float W_T; //work of the turbine
float N_eff; // effeincey of the cycle
float BWR; //backwork of cycle
float W_net;
float H_1; //enthalpy 1
float H_2; //enthalpy 2
float H_3; // enthalpy 3
float H_4; //enthalpy at 4
float P_1 = 101.25; //ambient air
float P_2;
float P_3;
float P_4;
float P_5 = 101.25; //ambient air
float V_1;//volume state 1
float V_2;
float V_3;
float V_4;
float V_5;
float thrust; //total thrust
float in_v, out_v; //inlet and outlet velocity
float Press_diff; //ratio between turbine exit and atmospheric pressure
float n; //number moles air
float m_m = 28.96;//molar mass

n = M_dot / m_m;
in_v = 0;
P_2 = C_R * P_1; //pressure calculation for p2
tm_2 = tm_1 * pow((P_2 / P_1), ((k-1)/k));//temp 2
Q_in = M_dot * cp * (tm_3 - tm_2);//q in taken from desired qin
P_3 = P_2;//temp for pressure 3
P_4 = P_3 / T_R; //pressure after turbine
tm_4 = tm_3 * pow((P_4 / P_3), ((k-1)/k)); //temp for 4
W_C = M_dot * cp * (tm_1 - tm_2);//compressor work
W_T = M_dot * cp * (tm_3 - tm_4);//turbine work
BWR = (W_C * -1)/(W_T); //back work ratio
N_eff = (W_T + W_C)/Q_in; //thermal effciency
W_net = W_T - W_C;//net work done
Press_diff = P_5 / P_4;
tm_5 = tm_4;
out_v = sqrt(2* cp * tm_4 * N_eff * (1 - (1/pow(1/Press_diff,((k-1)/k)))));// equation for exit velocity
thrust = M_dot * out_v; //thrust equation
V_1 = (n* R * tm_1) / P_1;
V_2 = (n* R * tm_2) / P_2;
V_3 = (n* R * tm_3) / P_3;
V_4 = (n* R * tm_4) / P_4;
V_5 = (n* R * tm_5) / P_5;

printf("%f \n", P_2);
printf("%f \n", tm_2);
printf("%f \n", Q_in);
printf("%f \n", tm_4);
printf("%f \n", W_C);
printf("%f \n", W_T);
printf("Back Work Ratio %f \n", BWR);
printf("Thermal Effciency %f \n", N_eff);
printf("Power Produced %f \n", W_net);
printf("Exit Velocity %f \n", out_v);
printf("Thrust %f \n", thrust);

// Open a file in write mode ("w") or binary write mode ("wb")
FILE *file = fopen("brayton.dat", "w");  // Use "w" for text, "wb" for binary

// Sample data to write to the file

//size_t written = fwrite(numbers, sizeof(int), num_elements, file);
//fprintf(file, "Temp  Pressure\n");
fprintf(file, "%f  %f\n", V_1,P_1);
fprintf(file, "%f  %f\n", V_2,P_2);
fprintf(file, "%f  %f\n", V_3,P_3);
fprintf(file, "%f  %f\n", V_4,P_4);
fprintf(file, "%f  %f\n", V_5,P_5);
fprintf(file, "%f  %f\n", V_1,P_1);

// Close the file
fclose(file);

FILE *gnuplotPipe = popen("gnuplot -persistent", "w");
    if (gnuplotPipe == NULL) {
        fprintf(stderr, "Could not open Gnuplot pipe.\n");
        return 1;
    }

    // Send commands to Gnuplot
    fprintf(gnuplotPipe, "set title 'Brayton Cycle Plot'\n");
    fprintf(gnuplotPipe, "set xlabel 'X-axis Label'\n"); // Change to your actual label
    fprintf(gnuplotPipe, "set ylabel 'Y-axis Label'\n"); // Change to your actual label
    fprintf(gnuplotPipe, "plot 'brayton.dat' using 1:2 with lines title 'Data'\n");


    // Close the pipe
    pclose(gnuplotPipe);
}
