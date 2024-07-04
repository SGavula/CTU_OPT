function plottraj2(C)
% function plottraj2(C)
%
% INPUT: 
% C: 2-by-m matrix
%    with data
%

    plot(C(1, :), C(2, :), '-o');
    xlabel('x');
    ylabel('y');
    title('Trajectory of Points');
    axis equal;
end
% plot(C)


