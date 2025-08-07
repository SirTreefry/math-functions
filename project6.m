clc, clear, close all;
fprintf("============================================================\n")
fprintf("Project 6 - Least Squares\n")
fprintf("Andrew Trefry\n")
display(date())
fprintf("============================================================\n")
x = importdata('X_DATA_SU2025.DAT');
y = importdata('Y_DATA_SU2025.DAT');
len = length(y);
R2 = ones(3,1);
Syx = ones(3,1);
yse = ones(3,2);
yse2 = ones(3,2);
SSD = ones(3,1);
SSE = ones(3,1);
y_point = ones(3,1);
%linear Method
%========================================
sxmatrix = ones(2,2);
symatrix = ones(2,1);
%calculations for the actual linear fit
%already set as the inverse matrix for x 4by4
sxmatrix(1,1) = len;%s
sxmatrix(1,2) = sum((x));%sx
sxmatrix(2,1) = sum((x));%sx
sxmatrix(2,2) =  sum(x.^2);%sxx
%y matrix
symatrix(1,1) = sum(y);
symatrix(2,1) = sum(y.*x);
acoeff = linsolve(sxmatrix,symatrix);

y_est1 = acoeff(1,1) + acoeff(2,1)*x;
y_point(1,1) = acoeff(1,1) + acoeff(2,1)*1.25;
%devation of data from the mean
%find the y mean of the data "Y vals"
y_mean = (1/len) * symatrix(1,1);

SSD(1,1) = sum((y - y_mean).^2);
SSE(1,1) = sum((y - y_est1).^2);

R2(1,1) = (SSD(1,1) - SSE(1,1))/SSD(1,1);%regression coeffcient
%upper and lower bound lines
Syx(1,1) = sqrt(SSE(1,1)/((len + 1) - (2 + 1)));
y_upL = acoeff(1,1) + acoeff(2,1)*x +Syx(1,1);
y_dwL = acoeff(1,1) + acoeff(2,1)*x -Syx(1,1);
yse(1,1) = acoeff(1,1) + acoeff(2,1)*1.25 +Syx(1,1);
yse(1,2) = acoeff(1,1) + acoeff(2,1)*1.25 - Syx(1,1);
yse2(1,1) = acoeff(1,1) + acoeff(2,1)*1.25 + 2*Syx(1,1);
yse2(1,2) = acoeff(1,1) + acoeff(2,1)*1.25 - 2*Syx(1,1);



%4-Order poly Method
%==================================================
sxmatrix4 = ones(5,5);
symatrix4 = ones(5,1);
%already set as the inverse matrix for x 4by4
sxmatrix4(1,1) = len; sxmatrix4(1,2) = sum((x));sxmatrix4(1,3) =  sum(x.^2);sxmatrix4(1,4) =  sum(x.^3);sxmatrix4(1,5) = sum(x.^4);%sxx
sxmatrix4(2,1) = sum((x));sxmatrix4(2,2) =  sum(x.^2);sxmatrix4(2,3) =  sum(x.^3);sxmatrix4(2,4) =  sum(x.^4);sxmatrix4(2,5) =  sum(x.^5);
sxmatrix4(3,1) =  sum(x.^2);sxmatrix4(3,2) =  sum(x.^3);sxmatrix4(3,3) =  sum(x.^4);sxmatrix4(3,4) =  sum(x.^5);sxmatrix4(3,5) =  sum(x.^6);
sxmatrix4(4,1) =  sum(x.^3);sxmatrix4(4,2) =  sum(x.^4);sxmatrix4(4,3) =  sum(x.^5);sxmatrix4(4,4) =  sum(x.^6);sxmatrix4(4,5) =  sum(x.^7);
sxmatrix4(5,1) =  sum(x.^4);sxmatrix4(5,2) =  sum(x.^5);sxmatrix4(5,3) =  sum(x.^6);sxmatrix4(5,4) =  sum(x.^7);sxmatrix4(5,5) =  sum(x.^8);

%y matrix
symatrix4(1,1) = sum(y);
symatrix4(2,1) = sum(y.*x);
symatrix4(3,1) = sum(y.*x.^2);
symatrix4(4,1) = sum(y.*x.^3);
symatrix4(5,1) = sum(y.*x.^4);
acoeff3 = linsolve(sxmatrix4,symatrix4);

y_est3 = acoeff3(1,1) + acoeff3(2,1)*x + acoeff3(3,1)*x.^2 + acoeff3(4,1)*x.^3 + acoeff3(5,1)*x.^4;
y_point(3,1) =  acoeff3(1,1) + acoeff3(2,1)*1.25 + acoeff3(3,1)*1.25^2 + acoeff3(4,1)*1.25^3 + acoeff3(5,1)*1.25^4;
SSD(3,1) = sum((y - y_mean).^2);
SSE(3,1) = sum((y - y_est3).^2);

R2(3,1) = (SSD(3,1) - SSE(3,1))/SSD(3,1);%regression coeffcient
%upper and lower bound lines
Syx(3,1) = sqrt(SSE(3,1)/((len + 1) - (5 + 1)));
y_up4 = acoeff3(1,1) + acoeff3(2,1)*x + acoeff3(3,1)*x.^2 + acoeff3(4,1)*x.^3 + acoeff3(5,1)*x.^4 + Syx(3,1);
y_dw4 = acoeff3(1,1) + acoeff3(2,1)*x + acoeff3(3,1)*x.^2 + acoeff3(4,1)*x.^3 + acoeff3(5,1)*x.^4 -Syx(3,1);
y_up42 = acoeff3(1,1) + acoeff3(2,1)*x + acoeff3(3,1)*x.^2 + acoeff3(4,1)*x.^3 + acoeff3(5,1)*x.^4 +2*Syx(3,1);
y_dw42 = acoeff3(1,1) + acoeff3(2,1)*x + acoeff3(3,1)*x.^2 + acoeff3(4,1)*x.^3 + acoeff3(5,1)*x.^4 -2*Syx(3,1);
yse(3,1) = acoeff3(1,1) + acoeff3(2,1)*1.25 + acoeff3(3,1)*1.25^2 + acoeff3(4,1)*1.25^3 + acoeff3(5,1)*1.25^4 + Syx(3,1);
yse(3,2) = acoeff3(1,1) + acoeff3(2,1)*1.25 + acoeff3(3,1)*1.25^2 + acoeff3(4,1)*1.25^3 + acoeff3(5,1)*1.25^4 - Syx(3,1);
yse2(3,1) = acoeff3(1,1) + acoeff3(2,1)*1.25 + acoeff3(3,1)*1.25^2 + acoeff3(4,1)*1.25^3 + acoeff3(5,1)*1.25^4 + 2*Syx(3,1);
yse2(3,2) = acoeff3(1,1) + acoeff3(2,1)*1.25 + acoeff3(3,1)*1.25^2 + acoeff3(4,1)*1.25^3 + acoeff3(5,1)*1.25^4 - 2*Syx(3,1);


%quadratic method
%==================================================
sxmatrixq = ones(3,3);
symatrixq = ones(3,1);
%already set as the inverse matrix for x 4by4
sxmatrixq(1,1) = len; sxmatrixq(1,2) = sum((x));sxmatrixq(1,3) =  sum(x.^2);%sxx
sxmatrixq(2,1) = sum((x));sxmatrixq(2,2) =  sum(x.^2);sxmatrixq(2,3) =  sum(x.^3);
sxmatrixq(3,1) =  sum(x.^2);sxmatrixq(3,2) =  sum(x.^3);sxmatrixq(3,3) =  sum(x.^4);
%y matrix
symatrixq(1,1) = sum(y);
symatrixq(2,1) = sum(y.*x);
symatrixq(3,1) = sum(y.*x.^2);
acoeff2 = linsolve(sxmatrixq,symatrixq);

y_est2 = acoeff2(1,1) + acoeff2(2,1)*x + acoeff2(3,1)*x.^2;
y_point(2,1) = acoeff2(1,1) + acoeff2(2,1)*1.25 + acoeff2(3,1)*1.25^2;

SSD(2,1) = sum((y - y_mean).^2);
SSE(2,1) = sum((y - y_est2).^2);

R2(2,1) = (SSD(2,1) - SSE(2,1))/SSD(2,1);%regression coeffcient
%upper and lower bound lines
Syx(2,1) = sqrt(SSE(2,1)/((len + 1) - (3 + 1)));
y_upq = acoeff2(1,1) + acoeff2(2,1)*x + acoeff2(3,1)*x.^2 +Syx(2,1);
y_dwq = acoeff2(1,1) + acoeff2(2,1)*x + acoeff2(3,1)*x.^2 -Syx(2,1);
yse(2,1) = acoeff2(1,1) + acoeff2(2,1)*1.25 + acoeff2(3,1)*1.25^2 + Syx(2,1);
yse(2,2) = acoeff2(1,1) + acoeff2(2,1)*1.25 + acoeff2(3,1)*1.25^2 - Syx(2,1);
yse2(2,1) = acoeff2(1,1) + acoeff2(2,1)*1.25 + acoeff2(3,1)*1.25^2 + 2*Syx(2,1);
yse2(2,2) = acoeff2(1,1) + acoeff2(2,1)*1.25 + acoeff2(3,1)*1.25^2 - 2*Syx(2,1);


%Plots
%===========================================================
x_fit = 0:0.01:2;
y_fit1 = acoeff(1) + acoeff(2)*x_fit;
y_fit2 = acoeff2(1) + acoeff2(2)*x_fit + acoeff2(3)*x_fit.^2;
y_fit3 = acoeff3(1) + acoeff3(2)*x_fit + acoeff3(3)*x_fit.^2 + acoeff3(4)*x_fit.^3 + acoeff3(5)*x_fit.^4;



figure%scatter plot 1
hold on
scatter(x,y)
title("Original Data")
hold off


figure
hold on
plot(x_fit, y_fit1, '-')
plot(x_fit, y_fit2, '--')
plot(x_fit, y_fit3, '.')
scatter(x,y)
title("Plots of Ls Fits 1,2,4")
legend('Order 1','Order 2','Order 4')
hold off

figure
hold on
plot(x,y_est3,"LineWidth",2)
scatter(x,y)
plot(x,y_up4,"--r")
plot(x,y_dw4,"--r")
plot(x,y_up42,".b")
plot(x,y_dw42,".b")
title("Plot of 4th Order Poly Fit")
legend('4th Order Fit','Data','+SE1','-SE1','+SE2','-SE2')

hold off

fprintf("Y mean %f\n\n",y_mean)
fprintf("Number of Data points = 140\n\n")
fprintf("Linear P1(x)\n")
fprintf("==========================================\n")
fprintf("Least Squares coeffcients %.4f %.4f\n\n",acoeff(1,1),acoeff(2,1))
fprintf("R^2 is = %.4f\n\n",R2(1,1))
fprintf("SSE = %.4f\n\n", SSE(1,1))
fprintf("%-8s = %.4f\n", "y",      y_point(1,1))
fprintf("%-8s = %.4f\n", "SE",     Syx(1,1))
fprintf("%-8s = %.4f\n", "y+SE",   yse(1,1))
fprintf("%-8s = %.4f\n", "y-SE",   yse(1,2))
fprintf("%-8s = %.4f\n", "y+2*SE", yse2(1,1))
fprintf("%-8s = %.4f\n", "y-2*SE", yse2(1,2))

fprintf("\nQuadratic P2(x)\n")
fprintf("==========================================\n")
fprintf("Least Squares coeffcients %.4f %.4f %.4f\n\n",acoeff2(1,1),acoeff2(2,1),acoeff2(3,1))
fprintf("R^2 is = %.4f\n\n",R2(2,1))
fprintf("SSE = %.4f\n\n", SSE(2,1))
fprintf("%-8s = %.4f\n", "y",      y_point(2,1))
fprintf("%-8s = %.4f\n", "SE",     Syx(2,1))
fprintf("%-8s = %.4f\n", "y+SE",   yse(2,1))
fprintf("%-8s = %.4f\n", "y-SE",   yse(2,2))
fprintf("%-8s = %.4f\n", "y+2*SE", yse2(2,1))
fprintf("%-8s = %.4f\n", "y-2*SE", yse2(2,2))

fprintf("\nPolynomial P4(x)\n")
fprintf("==========================================\n")
fprintf("Least Squares coeffcients %.4f %.4f %.4f %.4f %.4f\n\n",acoeff3(1,1),acoeff3(2,1),acoeff3(3,1),acoeff3(4,1),acoeff3(5,1))
fprintf("R^2 is = %.4f\n\n",R2(3,1))
fprintf("SSE = %.4f\n\n", SSE(3,1))
fprintf("%-8s = %.4f\n", "y",      y_point(3,1))
fprintf("%-8s = %.4f\n", "SE",     Syx(3,1))
fprintf("%-8s = %.4f\n", "y+SE",   yse(3,1))
fprintf("%-8s = %.4f\n", "y-SE",   yse(3,2))
fprintf("%-8s = %.4f\n", "y+2*SE", yse2(3,1))
fprintf("%-8s = %.4f\n", "y-2*SE", yse2(3,2))