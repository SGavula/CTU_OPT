function [d, e, f] = fit_circle_nhom(X)
    % function [d e f] = fit_circle_hom(X)
    %
    % INPUT: 
    % X: n-by-2 vector
    %    with data
    %
    % OUTPUT: 
    % quadric coordinates of the circle
    
    n = size(X, 1);
    A = [X(:,1), X(:,2), ones(n,1)];
    b = -(X(:,1).^2 + X(:,2).^2);
    x = lsqr(A,b);
    d = x(1);
    e = x(2);
    f = x(3);
    disp(d);
    disp(e);
    disp(f);
end
