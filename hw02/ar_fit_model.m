function [a] = ar_fit_model(y, p)
    n = length(y);
    M = ones(n-p, p+1);

    for i = 1:(n-p)
        for j = 1:p
            M(i, (j+1)) = y((p+i-j));
        end
    end
    
    disp("M size: ");
    disp(size(M));
    
    b = y((p+1):end);
    disp("b size: ");
    disp(size(b));
    
    a = M\b;
end

% function [a] = ar_fit_model(y,p)
%
% INPUT:
% y : N-by-1 vector, sound signal
%
% p : required order of AR model
%
% OUTPUT:
% a: (p+1)-by-1 vector, estimated parameters of AR model 
% 
% ordering of vector *a* is such that: 
%   a(1) = a_0 [ from Eq. (2) in this Task description ]
%   a(2) = a_1 [ from Eq. (2) in this Task description ]
%   .
%   .
%   a(p+1) = a_p [ from Eq. (2) in this Task description ]
%
% M, b: matrix and vector as in the Task description, 
%       M*a = b (in LSQ sense) 
% discard the code from here and implement the functionality:


