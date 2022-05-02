clear; close all;
%% Solve
tspan = [0 100];
x0 = [1;1;1;1];
[t,xi] = ode45(@(t,x)(de(t,x)),tspan,x0);
%% Retrieve x from xi
x = zeros(size(xi));
x(:,1) = xi(:,1);
x(:,2) = xi(:,2);
x(:,3) = xi(:,3) + 10*sin(xi(:,1)) + xi(:,1);
x(:,4) = xi(:,4) + 10.*xi(:,2).*cos(xi(:,1)) + xi(:,2);
%% Plotting
% plot of all states
figure;
hold on;
for i = 1:4
    plot(t,x(:,i));
end
legend('x_1','x_2','x_3','x_4');
title('State evolution');
ylabel('state');xlabel('time');
hold off;

figure; 
subplot(2,2,1);
plot(t,x(:,1),"linewidth", 2);
legend('x_1');
title('State evolution - x_1');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");

subplot(2,2,2);
plot(t,x(:,2),"r", "linewidth", 2);
legend('x_2');
title('State evolution - x_2');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");

subplot(2,2,3);
plot(t,x(:,3),"g", "linewidth", 2);
legend('x_3');
title('State evolution - x_3');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold");

subplot(2,2,4);
plot(t,x(:,4),"m", "linewidth", 2);
legend('x_4');
title('State evolution - x_4');
ylabel('state');xlabel('time');
set(gca, "fontweight","bold"); 

figure;
plot(t,x(:,1),"b",t,sin(t),"r-.", "linewidth", 2);
legend('y','set-point');
title('Output - y');
ylabel('y');xlabel('time');
set(gca, "fontweight","bold"); 
grid on;
%% Designing u
A = [0 1 0 0;0 0 1 0; 0 0 0 1;0 0 0 0];
B = [0;0;0;1];
K = place(A,B,[-1;-2;-5;-10]);
%% System
% u is substituted with value as mentioned in report
function dotx = de(t,x)
    dotx = zeros(4,1);
    A = [0 1 0 0;0 0 1 0; 0 0 0 1;0 0 0 0];
    B = [0;0;0;1];
    K = place(A,B,[-1;-2;-5;-10]);
    v = - K*(x-[sin(t);cos(t);-sin(t);-cos(t)]);
    u = x(3)*(10*cos(x(1)) + 2) - 10\sin(x(1))*(x(2)^2-1) + v;
    % feedback linearization
    dotx(1) = x(2);
    dotx(2) = x(3); 
    dotx(3) = x(4);
    dotx(4) = v;
end