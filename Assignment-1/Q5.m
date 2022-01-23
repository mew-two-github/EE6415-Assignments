clear; close all;
%% constants
m1 = 1;
m2 = 10;
a = 10;
G = 6.674*10^(-11);
xeqbm = a/(sqrt(m2/m1)+1);
%% setup equations
% xdot -> x and x.. -> y
f1 = @(x,y)(y);
f2 = @(x,y)(-G*m1/x^2+G*m2/(a-x)^2);
[X,Y,U,V] = derivatives(4,20,f1,f2);
quiver(X,Y,U,V,0.5)
xlabel('x'); ylabel('y');
title('Phase portrait');