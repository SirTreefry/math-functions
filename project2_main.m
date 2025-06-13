fprintf("============================================================\n")
fprintf("Project 2 - finding the root of a scalar equation\n")
fprintf("\n")%put your name
display(date())
fprintf("============================================================\n\n")

clc, clear, close all;
%everything is in feet
r = 2.667e-4;
Re = 1.5e5;
L = 12500;
D = 3;
V = 0.55;
G = 32.2;
f = @(x) 1./sqrt(x) + 2*log10( (r/(3.7)) + 2.51./(Re*sqrt(x)) );
df =  @(x) -0.5 * x.^(-3/2) - ((2.51/Re) ./ (r/3.7 + 2.51 ./ (Re*sqrt(x)))).*x.^(-1.5);
h=@(f) f*(L/D)*(V^2 / (2*G));

max_iter = 100;
guess1 = .01;
guess2 = .001;
res_tol = 1*10^(-8);
conv_tol = 1*10^(-8);

% plot the function
x = 0.001:0.001:0.1;
fval = f(x);
guess_i = f(guess1);
figure;
plot(x, fval, x, zeros(length(x)))
title('Function to find the root')

% Run the solvers
fprintf('Newton Raphson\n')
% call the newton_raphson() function here
[x_vals, conv_vals, res_vals, iters_newton] = newton_raphson_function(f, df, guess1, conv_tol, res_tol, max_iter);

fprintf('\n\n=====================================================\n')
fprintf('Secant\n')
% call the secant() function here
[x_vals_s, conv_vals_s, res_vals_s, iters_secant] = secant_function(f, guess1,guess2, conv_tol, res_tol, max_iter);
fprintf('\n==========================================================\n')
fprintf('Answers:\n')
value = x_vals(iters_newton + 1);
chopped_value = fix(value * 1e8) / 1e8;
  % Print final result in fixed-point notation
  fprintf('Newton results in: %.8f in %i iterations\n', chopped_value,iters_newton);
 value1 = x_vals_s(iters_secant + 2);
chopped_value1 = fix(value1 * 1e8) / 1e8;
  % Print final result in fixed-point notation
  fprintf('Secant results %.8f in %i iterations\n', chopped_value1,iters_secant);

  
  head_newt = x_vals*(L/D)*(V^2 / (2*G));
head_secan = x_vals_s*(L/D)*(V^2 / (2*G));
valueh = head_newt(iters_newton + 1);
choppedh_value = fix(valueh * 1e8) / 1e8;
  % Print final result in fixed-point notation
  fprintf('Newton Head Loss: %.8f\n', choppedh_value);
valuehs = head_secan(iters_secant + 2);
choppedhs_value = fix(valuehs * 1e8) / 1e8;
fprintf('Secant Head Loss: %.8f\n', choppedhs_value);


plot_iters_nr =0:iters_newton;
 
figure
hold on
[ax, h1, h2] = plotyy(plot_iters_nr, res_vals, plot_iters_nr, conv_vals);
title('Newton-raphson')
xlabel('iterations')
ylabel(ax(1), 'residual')
ylabel(ax(2), 'convergence')
grid on
hold off

plot_iters_s = 0:length(res_vals_s) - 1;
figure
hold on
[ax, hh1, hh2] = plotyy(plot_iters_s(2:end), res_vals_s(2:end), plot_iters_s(2:end), conv_vals_s(2:end));
title('secant')
xlabel('iterations')
ylabel(ax(1), 'residual')
ylabel(ax(2), 'convergence')
grid on
hold off

