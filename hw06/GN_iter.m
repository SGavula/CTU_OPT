function [x y r] = GN_iter(X, x0, y0, r0)
% [x y r] = GN_iter(X, x0, y0, r0)
%
% makes the Gauss-Newton iteration. 
%
% INPUT: 
% X: n-by-2 matrix
%    with data
% x0, y0 are the coordinates of the circle center.
% r0 is the circle radius
%
% OUTPUT: 
% coordinates and radius after one step of GN method.

% x = x0;
% y = y0+1;
%  r = r0;

    % Calculate the residuals -- in our case d
    d = dist(X, x0, y0, r0);
    
    % Calculate the jacobian matrix
    J = jacobian(X, x0, y0);

    % disp(size(J));
    % disp(size(J'));
    % disp(size(d));
    % disp(size(J' * J));
    % disp(size(J' * d'));

    % Compute the update step using the normal equations
    delta = inv(J' * J) * J' * d;

    % Update the parameters
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
