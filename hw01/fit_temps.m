% data = load("teplota.txt" ,"-ascii");

% t = data(:, 1);
% T = data(:, 2);
% omega = (2*pi)/365

% plot(t, T, "o");
% hold on;
% x = fit_temps_func(t,T,omega);

% result = x(1) + x(2)*t + x(3)*sin(omega*t)+x(4)*cos(omega*t);
% plot(t, result);
% hold off;


function x = fit_temps(t, T, omega)
    n = length(t);
    sin_t = sin(omega*t);
    cos_t = cos(omega*t);

    P = ones(n, 4);
    P(:, 2) = t;
    P(:, 3) = sin_t;
    P(:, 4) = cos_t;
    
    x = P\T;
end