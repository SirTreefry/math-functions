function [x, conv, res, i] = ...
  newton_raphson_func(f, df, initial_guess, conv_tol, res_tol, max_iter)

  % initial guess
  x(1) = initial_guess;
  % initial convergence
  conv(1) = 0;
  % initial residual
  res(1) = f(initial_guess);
  
  fprintf('iteration     x            residual    convergence\n');
  fprintf('=========   =====          =========    ==========\n');
  fprintf('    %2i      %.8e    %.4e     %.4e\n', 0,x(1),res(1),conv(1));
  
  % initialize the iteration counter
  i = 1;
  
  % iterate using our formula
  while i<max_iter
    fval = f(x(i));
    dfval = df(x(i));
    if (dfval == 0) || isnan(dfval)
      error("!!! FAILED. The derivative value is %i. Try another guess.", dfval)
      break;
    end
    x(i+1) = x(i) -  fval/dfval;% apply Newton-Raphson formula
    conv(i+1) = abs(x(i+1) - x(i)); % calculate iterative convergence
    res(i+1) = abs(f(x(i+1))); % calculate the residual
    fprintf('     %i      %.8e    %.4e     %.4e\n', ...
                  i,x(i+1),res(i+1),conv(i+1));
 

    % check for convergence
    if  (conv(i+1) < conv_tol) && (res(i+1) < res_tol)
      break;
    end
    i=i+1; % increment our iteration counter
    
  end
end
