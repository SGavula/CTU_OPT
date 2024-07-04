function [x y r] = grad_iter(X, x0, y0, r0, a)
% [x y r] = grad_iter(X, x0, y0, r0, a)
%
% makes the gradient method iteration. 
%
% INPUT: 
% X: n-by-2 matrix
%    with data
% x0, y0 are the coordinates of the circle center.
% r0 is the circle radius
% a is the stepsize
%
% OUTPUT: 
% coordinates and radius after one step of gradient method.

% x = x0+1;
% y = y0+1;
% r = r0;

    % Calculate the residuals -- in our case d
    d = dist(X, x0, y0, r0);
    
    % Calculate the jacobian matrix
    J = jacobian(X, x0, y0);

    delta = inv((1/(2*a)) * eye(3)) * J' * d;

    x = x0 - delta(1);
    y = y0 - delta(2);
    r = r0 - delta(3);

    disp(x);
    disp(y);
    disp(r);

end

function J = jacobian(X, x0, y0)
     n = length(X);
     J = zeros(n, 3);

     for i = 1:n
         x_i = X(i, 1);
         y_i = X(i, 2);
         J(i, 1) = (x0 - x_i) / sqrt((x_i - x0)^2 + (y_i - y0)^2);
         J(i, 2) = (y0 - y_i) / sqrt((x_i - x0)^2 + (y_i - y0)^2);
         J(i, 3) = -1;
     end
end