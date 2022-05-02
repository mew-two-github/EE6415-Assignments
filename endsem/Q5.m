clear; close all;
%% Solve
tspan = [0 20];
x0 = [0;0;pi/6;0];
[t,x] = ode45(@(t,x)(de(x)),tspan,x0);
%% Plotting
% Observable states
plot(x(:,3),x(:,4),x(end,3),x(end,4),'x',x(1,3),x(1,4),'o');
legend('trajectory','final','initial','Location','Best');
title('Trajectory of observable states');
xlabel('$\xi_1$','interpreter','latex');ylabel('$\xi_2$','interpreter','latex')
% Unobservable states
figure;
eta1 = x(:,1);
eta2 = x(:,2).*cos(x(:,3))/2 + x(:,4);
plot(eta1(:),eta2(:),eta1(end),eta2(end),'x',eta1(1),eta2(1),'o');
legend('trajectory','final','initial','Location','Best');
title('Trajectory of unobservable states');
xlabel('$\eta_1$','interpreter','latex');ylabel('$\eta_2$','interpreter','latex');
% plot of all states
figure;
hold on;
for i = 1:4
    plot(t,x(:,i));
end
legend('x','v','\theta','\omega');
title('State evolution');
ylabel('state');xlabel('time');
hold off;

figure; 
subplot(2,2,1);
plot(t,x(:,1),"linewidth", 2);
legend('x');
title('State evolution - x');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");
subplot(2,2,2);
plot(t,x(:,2),"r", "linewidth", 2);
legend('v');
title('State evolution - v');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");
subplot(2,2,3);
plot(t,x(:,3),"g", "linewidth", 2);
legend('\theta');
title('State evolution - \theta');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");
subplot(2,2,4);
plot(t,x(:,4),"m", "linewidth", 2);
legend('\omega');
title('State evolution - \omega');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold"); 
%% System
% u is substituted with value as mentioned in report
function dotx = de(x)
    % renaming states
    v = x(2);
    theta = x(3);
    omega = x(4);
    % feedback linearization
    udesired =-1*(theta+2*omega);
    u = -1*(4*(6-cos(theta).^2))/(2*cos(theta))*udesired;
    u = u + 1/(2*cos(theta))*(-120*sin(theta)-2*cos(theta)*(2*omega^2*sin(theta)-v));
    % state equations
    dotx = zeros(4,1);
    dotx(1) = v;
    dotx(2) = (4*u + 40*cos(theta)*sin(theta)+4*(2*omega^2*sin(theta)-v))./(4*(6-cos(theta).^2)); 
    dotx(3) = x(4);
    dotx(4) = (-120*sin(theta)-2*cos(theta)*(2*omega^2*sin(theta)-v)-2*u*cos(theta))./(4*(6-cos(theta).^2));
end