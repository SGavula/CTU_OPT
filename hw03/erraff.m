function d = erraff(A)
    b0 = mean(A,2);
    A = A - b0;
    AAT = A' * A;
    [Eigenvectors, Eigenvalues] = eig(AAT);
    dia_eigenvalues = diag(Eigenvalues);
    [sorted_eigenvalues, sorted_index] = sort(dia_eigenvalues, 'descend');
    [m, ~] = size(A);
    d = zeros(m, 1);
    total = sum(sorted_eigenvalues);
    for k = 1:m
         d(k) = total - sum(sorted_eigenvalues(1:k)); 
    end
end

%{
function d = erraff(A)
    disp(size(A));
    b0 = mean(A, 2);
    A = A - b0;
    AAT = A * A';
    [m, ~] = size(A);
    [~, S, ~] = svd(A);
    d = zeros(m, 1);
    dia_eigenvalues = diag(S).^2;
    total = sum(dia_eigenvalues);
    % disp(dia_eigenvalues);
    for k = 1:m
         d(k) = total - sum(dia_eigenvalues(1:k));
    end
end
%}


