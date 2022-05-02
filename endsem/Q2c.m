clear; close all;
%% Solving for zero dynamics
tspan = [0 100];
x0 = [1;1];
[t,x] = ode45(@(t,x)(de(t,x)),tspan,x0);
%% Plotting
figure; 
subplot(2,1,1);
plot(t,x(:,1),"linewidth", 2);
legend('\eta_1');
title('State evolution - \eta_1');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");

subplot(2,1,2);
plot(t,x(:,2),"r", "linewidth", 2);
legend('\eta_2');
title('State evolution - \eta_2');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");
%% plot phase portrait
% writing it as a function of mu, when evaluating derivatives will pass
% appropriate mu
f1 = @(x,y)(y);
f2 = @(x,y)(-x + -10*sin(x));
[Xa,Ya,Ua,Va] = derivatives(2,51,@(x,y)f1(x,y),@(x,y)f2(x,y));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
figure;
h = quiver(Xa,Ya,Ua,Va,0.5);
set(h,'linewidth', 1);
xlabel('\eta_1'); ylabel('\eta_2');
title('Phase portrait of the zero dynamics');
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
%% System
function dotx = de(t,x)
    dotx = zeros(2,1);
    dotx(1) = x(2);
    dotx(2) = -10*sin(x(1))-x(1); 
end