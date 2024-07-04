function [U,C,b0] = fitaff(A,k)
    b0 = mean(A,2);
    A_centered = A - b0;
    [U, C] = fitlin(A_centered, k);
end

