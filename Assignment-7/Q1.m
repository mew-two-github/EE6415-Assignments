clear; close all;
%% Solve
tspan = [0 100];
x0 = [1;1;1;1];
[t,x] = ode45(@(t,x)(de(x)),tspan,x0);
%% Plotting
% Observable states
plot(x(:,1),x(:,2),x(end,1),x(end,2),'x',x(1,1),x(1,2),'o');
legend('trajectory','final','initial','Location','Best');
title('Trajectory of observable states');
xlabel('$\xi_1$','interpreter','latex');ylabel('$\xi_2$','interpreter','latex')
% Unobservable states
figure;
plot(x(:,3),x(:,2)-x(:,4),x(end,3),x(end,2)-x(end,4),'x',x(1,3),x(1,2)-x(1,4),'o');
legend('trajectory','final','initial','Location','Best');
title('Trajectory of unobservable states');
xlabel('$\eta_1$','interpreter','latex');ylabel('$\eta_2$','interpreter','latex');
% plot of all states
figure;
hold on;
for i = 1:4
    plot(t,x(:,i));
end
legend('x1','x2','x3','x4');
title('State evolution');
ylabel('state');xlabel('time');
%% System
% u is substituted with value as mentioned in report
function dotx = de(x)
    dotx = zeros(4,1);
    dotx(1) = x(2);
    dotx(2) = - x(1) - 2*x(2) ; 
    dotx(3) = x(4);
    dotx(4) = -2*x(2) -x(1) -cos(x(3)) ;
end