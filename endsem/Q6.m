clear; close all;
%% plot phase portrait
% writing it as a function of mu, when evaluating derivatives will pass
% appropriate mu
f1 = @(x,y)(y);
f2 = @(x,y)(-x + y*(1-x^2-y^2));
[Xa,Ya,Ua,Va] = derivatives(3,30,@(x,y)f1(x,y),@(x,y)f2(x,y));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
h = quiver(Xa,Ya,Ua,Va,0.5);
set(h,'linewidth', 1);
xlabel('x_1'); ylabel('x_2');
title('Phase portrait Q6');
set(gca, 'fontweight','bold'); % gca: get current axis
%% obtaining derivatives
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