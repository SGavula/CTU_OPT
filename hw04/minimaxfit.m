function [a,b,r] = minimaxfit(x,y)
    % Get the size of the matrix X
    [n, m] = size(x);
   
    A_to_linprog = [
        x', ones(m, 1), -ones(m, 1);
        -x', -ones(m, 1), -ones(m, 1)
    ];

    b_to_linprog = [y'; -y'];

    f = [zeros(1, n), 0, 1];

    fprintf('A_to_linprog: \n');
    disp(A_to_linprog);
    
    solution = linprog(f, A_to_linprog, b_to_linprog);
    % [a, b, r] = linprog(f, A_to_linprog, b_to_linprog);
    a = solution(1:n);
    b = solution(n+1);
    r = solution(n+2);
    
end