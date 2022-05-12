close all;
f1 = @(x,y)(-x.^3-6*x.^2-11*x+y);
f2 = @(x,y)(3*x-y);
[X,Y,U,V] = derivatives(2,16,f1,f2);
quiver(X+2,Y+6,U,V,0.25);
hold on;
x1 = linspace(-2,2,1001);
x2 = linspace(-2,2,1001);
[X1, X2] = meshgrid(x1,x2);
V = 0.0938*0.5*X1.^2 + 0.5*0.6771*X2.^2 + 0.1771.*X1.*X2;
contour(X1+2,X2+6,V,[0.05 0.05],'ShowText','on');
hold off;
function [X,Y,U,V] = derivatives(lim,N,f1,f2)
    % ---------------------------------------------------------------------
    % function to generate derivatives
    % lim - limits of the x,y grid of the plot. derivatives will be
    % evaluated at points between -lim to +lim
    % 
    % N - number of points on each axis
    %
    % f1 - x derivative (xdot)
    % f2 - y derivative (ydot)
    % ---------------------------------------------------------------------
    % Generate mesh
    x = linspace(-lim,lim,N);
    y = linspace(-lim,lim,N);
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