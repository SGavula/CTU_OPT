% data = load("mzdy.txt","-ascii");

% t = data(:, 1);
% M = data(:, 2);

% Plot the data
% plot(t, M, 'o');
% hold on;

% x = fit_wages_func(t, M);
% result = x(1) + x(2) * t;
% plot(t, result);
% hold off;
% M = quarter2_2009(x);

function x =  fit_wages(t, M)
    % I want to return P^-1 * M
    n = length(t);
    P = ones(n, 2);
    P(:, 2) = t;

    x = P\M;
end

% function M = quarter2_2009(x)
%     M = x(1) + x(2)*2009.25;
% end