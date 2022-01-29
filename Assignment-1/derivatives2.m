function [X,Y,U,V] = derivatives2(xlim,ylim,N,f1,f2)
    % ---------------------------------------------------------------------
    % function to generate derivatives
    % lim - limits of the x,y grid of the plot. derivatives will be
    % evaluated at points between -lim to +lim
    % 
    % N - number of points on axis
    %
    % f1 - x derivative
    % f2 - y derivative
    % ---------------------------------------------------------------------
    % Generate mesh
    x = linspace(xlim(1),xlim(2),N);
    y = linspace(ylim(1),ylim(2),N);
    [X,Y] = meshgrid(x,y);
    % Variables to store derivatives
    U = zeros(size(X));
    V = zeros(size(X));
    for i = 1:length(X)
        for j = 1:length(Y)
            % Evaluate the derivatives
            u = f1(X(i,j),Y(i,j));
            v = f2(X(i,j),Y(i,j));
            r = sqrt(u^2+v^2);
            % Normalizing them to 1 and storing
            U(i,j) = u/r;
            V(i,j) = v/r;
        end
    end
end