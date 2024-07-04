function [d, e, f] = fit_circle_hom(X)
    % function [d e f] = fit_circle_hom(X)
    %
    % INPUT: 
    % X: n-by-2 vector
    %    with data
    %
    % OUTPUT: 
    % quadric coordinates of the circle    
    n = size(X, 1);
    
    A = [X(:,1).^2 + X(:,2).^2, X(:,1), X(:,2), ones(n,1)];
    
    [~, ~, V] = svd(A, 'econ');
    
    params = V(:, end);
    
    a = params(1);
    d = params(2) / a;
    e = params(3) / a;
    f = params(4) / a;
end
