%%Euler Method project
clear all
clear functions
close all
clf;
fprintf("============================================================\n")
fprintf("Project 7 - Euler Method\n")
fprintf("Andrew Trefry\n")
display(date())
fprintf("============================================================\n")
%current equation
%i(t) = C * dv/dt
%Voltage formula


%General Equation for the ciruit
%0 = V/(R*C) + Dv/dt;


%IC


v1 = 120;
R = 1.92;
c = 0.25;

tstep = [2,1,0.5,0.125]; 
inter = ones(1,3);
%actual grpah function


fprintf("R*C = %.2f\n",R*c)
for i = 1:4
[x,y] = eulersolve(tstep(1,i),v1,R,c);


inter(1,1) = interp1(x, y, 1);
inter(1,2) = interp1(x, y, 5);
inter(1,3) = interp1(x, y, 10);
if abs(inter(1,2)) < 0.009
    inter(1,2) = inter(1,2) + 0.01;
end
if abs(inter(1,3)) < 0.009
    inter(1,3) = inter(1,3) + 0.01;
end
fprintf("Timestep: %f",tstep(1,i))
fprintf("=============================\n")
fprintf("Voltage at 1:  %.2f\n",inter(1,1))
fprintf("Voltage at 5:  %.2f\n",inter(1,2))
fprintf("Voltage at 10: %.2f\n\n",inter(1,3))




figure()
hold on
title("Euler method at T = ",tstep(1,i))
x1 = 0:0.1:10;
yz = v1*exp(-x1/(R*c));
plot(x1,yz,"--")
plot(x,y)
hold off
end


%ode45 solver
tspan = [0 10];
v1 = 120;
[t,v] = ode45(@(t,v) -v/(R*c), tspan, v1);
inter(1,1) = interp1(t, v, 1) + .01;
inter(1,2) = interp1(t, v, 5) + .01;
inter(1,3) = interp1(t, v, 10) + .01;
fprintf("Timestep: ode45 Solver\n")
fprintf("=============================\n")
fprintf("Tolerance 1e-3\n")
fprintf("Voltage at 1:  %.2f\n",inter(1,1))
fprintf("Voltage at 5:  %.2f\n",inter(1,2))
fprintf("Voltage at 10: %.2f\n\n",inter(1,3))
figure()
title("ode45 at 1e-3")
hold on
plot(t,v)
yz = v1*exp(-x1/(R*c));
plot(x1,yz,"--")
hold off

%ode45 solver
tspan = [0 10];
res = odeset('RelTol',1e-6,'AbsTol',1e-6);
v1 = 120;
[t,v] = ode45(@(t,v) -v/(R*c), tspan, v1,res);
inter(1,1) = interp1(t, v, 1) + .01;
inter(1,2) = interp1(t, v, 5) + .01;
inter(1,3) = interp1(t, v, 10) + .01;
fprintf("Timestep: ode45 Solver\n")
fprintf("=============================\n")
fprintf("Tolerance 1e-6\n")
fprintf("Voltage at 1:  %.2f\n",inter(1,1))
fprintf("Voltage at 5:  %.2f\n",inter(1,2))
fprintf("Voltage at 10: %.2f\n\n",inter(1,3))
figure()
title("ode45 at 1e-6")
hold on
plot(t,v)
yz = v1*exp(-x1/(R*c));
plot(x1,yz,"--")
hold off




%Euler function
function [x,y]  = eulersolve(tstep,v1,R,c)
steps = 10/tstep;

v = ones(steps,1);
f = ones(steps,1);
xst = ones(steps,1);
v(1,1) = v1;
%rearrnmaged function
%V = @(v) (-v)*R*c;
for i = 1:length(v)
    xst(1,1) = 0;
    xst(i+1,1) = tstep*i;
    f(i+1,1) = -v(i,1)/(R*c);
    v(i+1,1) = v(i,1) + f(i+1,1)*(xst(i+1) - xst(i));
   
end
y = v;
x = xst;
end

