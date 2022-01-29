clear; close all;
%% Declare functions that dictate the dynamics
f1 = @(x,y,beta)(y);
f2 = @(x,y,beta)(-x - beta*y);

%% Declare 2-D mesh
lim = 1;
x = linspace(-lim,lim,25);
y = linspace(-lim,lim,25);
[X,Y] = meshgrid(x,y);
%% Case i
beta = 2;
% Storing derivatives
U = zeros(size(X));
V = zeros(size(X));
% Loop through each (x,y) pair in the mesh
for i = 1:length(X)
    for j = 1:length(Y)
        % Evaluate the derivatives
        u = f1(X(i,j),Y(i,j),beta);
        v = f2(X(i,j),Y(i,j),beta);
        r = sqrt(u^2+v^2);
        % Normalizing them to 1 and storing
        U(i,j) = u/r;
        V(i,j) = v/r;
    end
end
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
quiver(X,Y,U,V,0.75)
xlabel('x'); ylabel('y');
title('Case i: \beta = 2');
%% Case ii
beta = 0;
% Storing derivatives
U = zeros(size(X));
V = zeros(size(X));
% Plot an arrow for each (x,y) pair in the mesh
for i = 1:length(X)
    for j = 1:length(Y)
        % Evaluate the derivatives
        u = f1(X(i,j),Y(i,j),beta);
        v = f2(X(i,j),Y(i,j),beta);
        r = sqrt(u^2+v^2);
        % Normalizing them to 1 and storing
        U(i,j) = u/r;
        V(i,j) = v/r;
    end
end
% used figure to open a new plot window
figure;
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
quiver(X,Y,U,V,0.75)
xlabel('x'); ylabel('y');
title('Case ii: \beta = 0');
%% Case iii
beta = -2;
% Storing derivatives
U = zeros(size(X));
V = zeros(size(X));
% Plot an arrow for each (x,y) pair in the mesh
for i = 1:length(X)
    for j = 1:length(Y)
        % Evaluate the derivatives
        u = f1(X(i,j),Y(i,j),beta);
        v = f2(X(i,j),Y(i,j),beta);
        r = sqrt(u^2+v^2);
        % Normalizing them to 1 and storing
        U(i,j) = u/r;
        V(i,j) = v/r;
    end
end
% used figure to open a new plot window
figure;
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
quiver(X,Y,U,V,0.75)
xlabel('x'); ylabel('y');
title('Case iii: \beta = -2');