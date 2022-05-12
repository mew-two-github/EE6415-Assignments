clear; close all;
x1 = linspace(-2,2,101);
x2 = linspace(-2,2,101);
[X1, X2] = meshgrid(x1,x2);
V = (X1 + X2).^2./(1 + (X1 + X2).^2) + (X1 - X2).^2;

contour(X1,X2,V);

