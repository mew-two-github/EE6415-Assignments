clear; close all;
%% Case-1: with chatter
tspan = [0 10];
x0 = [1;1];
ahat = 0.5;
bhat = 1.5;
a = 0.5;
b = rand() + 1;
lambda = 0.5;
phi= 0.5;
[t,x] = ode45(@(t,x)(de(t,x,a,b,ahat,bhat,lambda,phi)),tspan,x0);
%% plotting
xdot = (1-ahat)*x(:,2) + x(:,1);
% sliding variable
S = xdot  + lambda*(x(:,1));
plot(t,S,'linewidth',2);
title('Sliding variable - without chatter');ylabel('S');xlabel('time');
set(gca, "fontweight","bold");
% trajectory
figure;
plot(x(:,1),x(:,2),x(end,1),x(end,2),'x',x(1,1),x(1,2),'o','linewidth',2);
legend('trajectory','final','initial','Location','Best');
title('Trajectory - without chatter');
xlabel('x','interpreter','latex');ylabel('$\dot{x}$','interpreter','latex')
set(gca, "fontweight","bold");
% control effort
figure;
K = abs(-(1-ahat).*(bhat.*((xdot-x(:,1))./(1-a)).^2)-(1-a).*(b.*((xdot-x(:,1))./(1-a)).^2)) + 1;
u = 1/(1-a)*(-(1-ahat).*(bhat.*((xdot-x(:,1))./(1-a)).^2 - x(:,1)) - xdot - K.*sat(S,phi)) ;
plot(t,u,'linewidth',2);
title('Control efforts - without chatter');
xlabel('t');ylabel('u')
set(gca, "fontweight","bold");


%% saturation function
function val = sat(S,phi)
    if abs(S) > phi
        val = sign(S);
    else
        val = S/phi;
    end
end
%% ODE: without chatter
% need to setup as system of first orders to use ode45
% u value as shown in report
function xdot = de(t,x,a, b,ahat,bhat,lambda,phi)
    xdot = zeros(2,1);
    xdot(1) = (1-ahat)*x(2) + x(1);
    S = xdot(1) + lambda*x(1);
    K = abs(-(1-ahat).*(bhat.*((xdot(1)-x(1))./(1-a))^2)-(1-a).*(b.*((xdot(1)-x(1))./(1-a))^2)) + 1;
    u = 1/(1-a)*(-(1-ahat).*(bhat.*((xdot(1)-x(1))./(1-a))^2 - x(1)) - xdot(1) - K*sat(S,phi)) ;
    xdot(2) = b*x(2).^2 + x(1) + u;
end