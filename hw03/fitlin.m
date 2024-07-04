function [U,C] = fitlin(A,k)
    % AAT = A * A';
    % [V, D] = eig(AAT);
    % [sorted_D, sorted_index] = sort(diag(D), 'descend');
    % sorted_V = V(:, sorted_index);
    % U = sorted_V(:, 1:k);
    % C = U * U' * A;
    [U, ~, ~] = svd(A);
    U = U(:, 1:k);
    C = U' * A;
end


