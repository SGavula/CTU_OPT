function d = erraff(A)
    % AAT = A * A';
    % [Eigenvectors, Eigenvalues] = eig(AAT);
    % dia_eigenvalues = diag(Eigenvalues);
    % [sorted_eigenvalues, sorted_index] = sort(dia_eigenvalues, 'descend');
    [m, ~] = size(A);
    [~, S, ~] = svd(A);
    d = zeros(m, 1);
    dia_eigenvalues = diag(S).^2;
    total = sum(dia_eigenvalues);
    % disp(dia_eigenvalues);
    for k = 1:m
         d(k) = total - sum(dia_eigenvalues(1:k));
         % d(k) = sum(dia_eigenvalues((m-k+1):m)); 
    end
end
