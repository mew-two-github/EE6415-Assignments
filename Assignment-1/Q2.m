clear; close all;
%% Part a
f1a = @(x,y)(x*(5 - x - 2*y));
f2a = @(x,y)(y*(4 - x - y));
x = linspace(0,6,50);
y = linspace(0,6,50);
[X,Y] = meshgrid(x,y);
% Storing derivatives
U = zeros(size(X));
V = zeros(size(X));
% Loop through each (x,y) pair in the mesh
for i = 1:length(X)
    for j = 1:length(Y)
        % Evaluate the derivatives
        u = f1a(X(i,j),Y(i,j));
        v = f2a(X(i,j),Y(i,j));
        r = sqrt(u^2+v^2);
        % Normalizing them to 1 and storing
        U(i,j) = u/r;
        V(i,j) = v/r;
    end
end
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
quiver(X,Y,U,V,0.75)
xlabel('x'); ylabel('y');
title('Part a');
%% Part b
f1b = @(x,y)(-x);
f2b = @(x,y)(y^2);
[Xb,Yb,Ub,Vb] = derivatives(1,20,f1b,f2b);
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xb,Yb,Ub,Vb,0.5)
xlabel('x'); ylabel('y');
title('Part b');
%% Part c
f1c = @(x,y)(y);
f2c = @(x,y)(x-x^3);
[Xc,Yc,Uc,Vc] = derivatives(2,101,f1c,f2c);
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xc,Yc,Uc,Vc,0.5);
xlabel('x'); ylabel('y');
title('Part c');
%% Part d
f1d = @(x,y)(sin(y));
f2d = @(x,y)(sin(x));
[Xd,Yd,Ud,Vd] = derivatives(3.5,60,f1d,f2d);
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xd,Yd,Ud,Vd,0.5)
xlabel('x'); ylabel('y');
title('Part d');