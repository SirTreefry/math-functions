% Project 4
%include header
clc, clear, close all;
format long;
A = [10 , -1 ,16;
    1 ,5 ,9;
    4,17.5,5];
B = [-61.5;-1.5;-17];


% Declare initial guess vector
guess = zeros(length(b),1);

%max iters
max_iter = 1e5;

% residual and iterative tolerance
tol = 1e-4;

%check the diangolity of the matrix
[dom] = diagdom(A);
%setup your inital geuss as 110, 100 ,120 from 1-51 dont hard code in use
%loop

% SOR parameter
omega = 1;

% run Gauss-Seidel with SOR
[x] = GS_SOR(A,B);

fprintf("using omega = %.2f", omega)
fprintf('\nnum iters to converge = %i\n',num_iters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Printing T values from Gauss Sidel
%fprintf('T(n) is %f \n', x(n))
fprintf('\nres = %.6e\n', res(end))
fprintf('conv = %.6e\n\n', conv(end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("===================================\n")
% run GS SOR for different omegas and save number of iterations
% to convergence for each omega
omegas = ; % remember, start : step : stop
for i = 1:length(omegas)
    [] = GS_SOR;
    iters_ran(i) = max_iter;
end
%% Plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot omega vs number of iterations to convergence
figure(1) % number your figures as below so you can always reference it later
plot()
title("finding the optimal omega")
xlabel("")
ylabel("")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot residual norm at each iteration for different omegas
% we could automate this but since only a few lines..
% probably faster and simpler to copy/paste
% different story if we wanted to do this many times..

% use "semilogy" instead of "plot" to plot y axis using log10 scale
% feel free to use "plot" instead of "semilogy" so your plots look like
% in lecture (decaying exponential)
% [Use for loop for calling back the function for different omegas]
figure(2)
hold on

set(gca, 'Xscale','log','Yscale','log');

for i  = ;
    %scaling the GS_SOR


end
%pseudo loop is being used
title("Residual at each iteration for various omegas")
xlabel("")
ylabel("")


%====================================================================
function [x] = GS_SOR(A,B)
    n = length(A);
    i = 1;
    for(i:n)
        aij = (B(i))/A(i,i);
    end

end

