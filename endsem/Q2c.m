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
%% System
function dotx = de(t,x)
    dotx = zeros(2,1);
    dotx(1) = x(2);
    dotx(2) = -10*sin(x(1))-x(1); 
end