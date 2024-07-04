function drawfitline(A)
    [U, C, b0] = fitaff(A, 1);
    
    x_points = A(1, :);
    y_points = A(2, :);
    scatter(x_points, y_points, 'r', 'x');
    hold on;

    min_x = min(x_points);
    max_x = max(x_points);

    m = (U(2) - b0(2)) / (U(1) - b0(1));
    
    c = U(2) - m * U(1);
        
    x_range = linspace(min_x, max_x, 100);
    
    y = m * x_range + c;
    
    plot(x_range, y, 'g', 'LineWidth', 1);
    hold on;
    
    % disp("C size: ");
    % disp(size(C));
    % for i = 1:size(A, 2)
    %    b_i = C(:, i);
    %    line([A(1, i), b_i(1)], [A(2, i), (m * b_i(1) + c)], 'Color', 'r');
    % end

    axis equal;
end


