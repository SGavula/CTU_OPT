function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
% function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
%
% INPUT: 
% X: n-by-2 vector
%    with data
% num_iter: number of RANSAC iterations
% threshold: maximal  distance of an inlier from the circumference
%
% OUTPUT: 
% cartesian coordinates of the circle
 
  % [d e f] = fit_circle_nhom(X);
  % [x0 y0 r] = quad_to_center(d, e, f);
  [N ~] = size(X);
  best_inliers_count = 0;

  for i = 1:num_iter
    idx = randperm(N, 3);
    points = X(idx, :);
    [c_x0, c_y0, c_r] = circle_from_points(points(1, :), points(2, :), points(3, :));
    d = dist(X, c_x0, c_y0, c_r);
    
    inliers_count = 0;
    for i = 1:length(d)
        if abs(d(i)) <= threshold
            inliers_count = inliers_count + 1;
        end
    end

    if inliers_count > best_inliers_count
        best_inliers_count = inliers_count;
        x0 = c_x0;
        y0 = c_y0;
        r = c_r;
    end
  end
end

function [x0, y0, r] = circle_from_points(p1, p2, p3)
    M11 = [p1(1), p1(2), 1;
       p2(1), p2(2), 1;
       p3(1), p3(2), 1];

    M12 = [p1(1)^2 + p1(2)^2, p1(2), 1;
           p2(1)^2 + p2(2)^2, p2(2), 1;
           p3(1)^2 + p3(2)^2, p3(2), 1];
    
    M13 = [p1(1)^2 + p1(2)^2, p1(1), 1;
           p2(1)^2 + p2(2)^2, p2(1), 1;
           p3(1)^2 + p3(2)^2, p3(1), 1];
    
    M14 = [p1(1)^2 + p1(2)^2, p1(1), p1(2);
           p2(1)^2 + p2(2)^2, p2(1), p2(2);
           p3(1)^2 + p3(2)^2, p3(1), p3(2)];
    
    x0 = 0.5 * (det(M12) / det(M11));
    y0 = -0.5 * (det(M13) / det(M11));
    r = sqrt(x0^2 + y0^2 + (det(M14) / det(M11)));
end
