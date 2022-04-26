clear; close all;
%% Case-2: no chatter
tspan = [0 10];
x0 = [0;0];
ahat = 1.5;
bhat = sqrt(32);
lambda = 1;
phi = 0.05; % boundary layer thickness
[t,x] = ode45(@(t,x)(de(t,x,ahat,bhat,lambda,phi)),tspan,x0);
%% plotting
% sliding variable
S = x(:,2) - xddot(t) + lambda*(x(:,1) - xd(t));
plot(t,S);
title('Sliding variable - no chatter');ylabel('S');xlabel('time');
% trajectory
figure;
plot(x(:,1),x(:,2),x(end,1),x(end,2),'x',x(1,1),x(1,2),'o',xd(t),xddot(t),'r-.');
legend('trajectory','final','initial','desired','Location','Best');
title('Trajectory - no chatter');
xlabel('x','interpreter','latex');ylabel('$\dot{x}$','interpreter','latex')
% control effort
figure;
u = (1/bhat)*(ahat*x(2).^2.*cos(5*x(1)) - (0.5*x(2).^2+1).*sat(S,phi));
plot(t,u);
title('Control efforts - no chatter');
xlabel('t');ylabel('u')
%% a(t)
function val = a(t)
    % for the purpose of simulation a(t) assumed as uniform random variable
    % between 1 and 2. At each instant, it is sampled from that
    % distribution
    val = rand()+1;
end
%% b(t)
function val = b(t)
    % for the purpose of simulation b(t) assumed as uniform random variable
    % between 4 and 8. At each instant, it is sampled from that
    % distribution
    val = 4*rand()+4;
end
%% xd(t)
function val = xd(t)
    val = sin(t);
end
%% xd dot (t)
function val = xddot(t)
    val = cos(t);
end
%% saturation function
function val = sat(S,phi)
    if abs(S) > phi
        val = sign(S);
    else
        val = S/phi;
    end
end
%% ODE: without chatter
% need to setup as system of first orders
% u value as shown in report
function xdot = de(t,x,ahat,bhat,lambda,phi)
    xdot = zeros(2,1);
    xdot(1) = x(2);
    S = xdot(1) - xddot(t) + lambda*(x(1) - xd(t));
    u = (1/bhat)*(ahat*x(2).^2.*cos(5*x(1)) - (0.5*x(2).^2+1).*sat(S,phi));
    xdot(2) = b(t)*u- a(t)*x(2).^2.*cos(5*x(1));
end