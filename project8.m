clear all
close all
clc
fprintf("============================================================\n")
fprintf("Project 8 - Pendulum\n")
fprintf("Andrew Trefry\n")
display(date())
fprintf("============================================================\n")
%time period function for numerical integration
g = 9.81;
%length of rope
L = 22.5; 
%intial angle
thetain = pi./2.5;
Vin = 0;
k = sin(thetain./2);
p = pi;

%Gauss-Kronrod quadrature part
%=======================================
%integal part of the equation
infunc = @(theta) 1./sqrt(1 - k.^2 *sin(theta).^2);
T = 4* sqrt(L./g)* quadgk(infunc,0,p/2);
fprintf("Calculated anylatical period T is: %.3f\n",T)

options1 = odeset('RelTol',1e-6,'AbsTol',1e-6);
options2 = odeset('RelTol',1e-3,'AbsTol',1e-3);
%No drag coeffcient
%ODE-45 
%======================================
tspan = [0 150];

thetain2 = [thetain,0]; %angular position : angular velocity
f = @(t, y) [y(2); (-g/L) * sin(y(1))];

fprintf("Case Cd=0\n")
fprintf("=========================\n")
for i = 1:2
if i == 1
val = 1e-3;
[t,y] = ode45(f, tspan, thetain2,options2);
fprintf("Solution at t=20.5 with tol = 1e-3\n")
end
if i == 2
val = 1e-6;
[t,y] = ode45(f, tspan, thetain2,options1);
fprintf("Solution at t=20.5 with tol = 1e-6\n")
end
interp(1,1) = interp1(t, y(:,1), 20.5);
interp(1,2) = interp1(t, y(:,2), 20.5);
chop1 = fix(interp(1,1)*1000)/1000;
chop2 = fix(interp(1,2)*1000)/1000;
fprintf("theta = %.3f\n",chop1)
fprintf("theta_dot = %.3f\n\n",chop2)


t_sample = 1:T:150;


y_sample = ones(size(t_sample)) * max(y(:,1));

figure()
hold  on
title(sprintf("Cd = 0, Displacement with tol = %.1e", val))
plot(t_sample, y_sample,'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r')
plot(t,y(:,1))
hold off


figure()
hold on
title(sprintf("Cd = 0, Velocity with tol = %.1e", val))
plot(t,y(:,2))
hold off

%poincare diagram
figure()
hold on
title(sprintf("Cd = 0, Poincare with tol = %.1e", val))
plot(y(:,1),y(:,2));
hold off
end




%Drag coeffcient
%ODE-45 
%======================================
tspan = [0 150];
thetain2 = [thetain,0]; %angular position : angular velocity
fprintf("Case Cd=0.325\n")
fprintf("=========================\n")
Cd = 0.325;
f = @(t, y) [y(2);(-g/L) * sin(y(1)) - Cd*y(2)*abs(y(2))];
for i = 1:2
if i == 1
val = 1e-3;
[t,y] = ode45(f, tspan, thetain2,options2);
fprintf("Solution at t=22.5 with tol = 1e-3\n")
end
if i == 2
val = 1e-6;
[t,y] = ode45(f, tspan, thetain2,options1);
fprintf("Solution at t=22.5 with tol = 1e-6\n")
end
inter(1,1) = interp1(t, y(:,1), 22.5);
inter(1,2) = interp1(t, y(:,2), 22.5);
chop1 = fix(inter(1,1)*1000)/1000;
chop2 = fix(inter(1,2)*1000)/1000;

fprintf("theta = %.3f\n",chop1)
fprintf("theta_dot = %.3f\n\n",chop2)

figure()
hold on
title(sprintf("Cd = 0.325, Displacement with tol = %.1e", val))
plot(t,y(:,1))
hold off

figure()
hold on
title(sprintf("Cd = 0.325, Velocity with tol = %.1e", val))
plot(t,y(:,2))
hold off

%poincare diagram
figure()
hold on
title(sprintf("Cd = 0.325, Poincare with tol = %.1e", val))
plot(y(:,1),y(:,2));
hold off
end




