function [y] = ar_predict(a, y0, N)
    p = length(a) - 1;
    disp(p);
 
    y = zeros(N, 1);
    y(1:p) = y0;

    for i = (p+1):N
        sum = a(1);
        for j = 2:(p+1)
            sum = sum + a(j)*y(i-j+1);
        end
        y(i) = sum;
    end
end


