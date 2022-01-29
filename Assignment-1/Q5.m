clear; close all;
%% constants
m1 = 1;
m2 = 10;
a = 10;
G = 6.674*10^(-11);
xeqbm = a/(sqrt(m2/m1)+1);
%% setup equations
% xdot -> x and x.. -> y
xlim = [0 10];
ylim = [-3 3];
N = 51;
f1 = @(x,y)(y);
f2 = @(x,y)(-G*m1/x^2+G*m2/(a-x)^2);
% Using derivatives2 so that can have separate limits for x axis and y axis
[X,Y,U,V] = derivatives2(xlim,ylim,N,f1,f2);
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
quiver(X,Y,U,V,0.5)
xlabel('x'); ylabel('y');
title('Phase portrait');