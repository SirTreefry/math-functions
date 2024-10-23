//Andrew Trefry
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
//cold air standard
int main(){
//preset values or measured values
float M_dot = .64; //mass flow of system
float k = 1.4;
float cp = 1.005;
float cv = .7165;
float R; //gas constant for air
float tm_1 = 300; //temp of state 1 entering compressor ambient air
float tm_2; //temp state 2 exiting compressor
float tm_3 = 2000; //temp of state 3 exiting the combustor
float tm_4; //temp of state 4 exiting the turbine into the ambient air
float Q_in; //heat entering the combustor
float W_C; // work of the compressor
float C_R = 6; // compression ratio
float T_R = 4; //turbine pressure ratio
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
float thrust; //total thrust
float in_v, out_v; //inlet and outlet velocity
float Press_diff; //ratio between turbione exit and atmospheric pressure
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
W_net = W_T - W_C;
Press_diff = P_5 / P_4;
out_v = sqrt(2* cp * tm_4 * N_eff * (1 - (1/pow(1/Press_diff,((k-1)/k)))));// equation for exit velocity
thrust = M_dot * out_v;
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
}
