function [x, y, r, success] = LM_iter(X, x0, y0, r0, mu)   
    % [x y r success] = LM_iter(X, x0, y0, r0, mu)
    %
    % makes the Levenberg-Marquardt iteration. 
    %
    % INPUT: 
    % X: n-by-2 matrix
    %    with data
    % x0, y0 are the coordinates of the circle center.
    % r0 is the circle radius
    % mu is the damping factor (the factor which multiplies the
    % regularizing identity matrix)
    
    % OUTPUT: 
    % success == 1 if the iteration is successful, i.e. 
    % value of criterion f is decreased after the update 
    % of x. 
    % success == 0 in the oposite case. 
    %
    % x,y,r are updated parameters if success == 1. 
    % x,y,r = x0,y0,r0 if success == 0.
    
    % x = x0;
    % y = y0-1;
    % r = r0;
    
    % success = 1;

    % Calculate the Jacobian
    J = jacobian(X, x0, y0);
    
    % Calculate the residuals
    d = dist(X, x0, y0, r0);
     
    % Update step
    delta = inv(J' * J + mu * eye(3)) * J' * d;
    
    % Update parameters
    x = x0 - delta(1);
    y = y0 - delta(2);
    r = r0 - delta(3);
    
    success = sum(dist(X, x, y, r).^2) < sum(dist(X, x0, y0, r0).^2);

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
