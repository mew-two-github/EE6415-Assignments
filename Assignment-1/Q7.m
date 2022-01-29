clear; close all;
%% unforced dynamics
% Here q and qdot are the states x1 and x2
% system dynamics:
% x1dot = x2
% x2dot = -sin(x1)-x2
f1 = @(x,y)(y);
f2 = @(x,y)(-sin(x)-y);
[Xa,Ya,Ua,Va] = derivatives(10,51,f1,f2);
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
quiver(Xa,Ya,Ua,Va,0.5);
grid on; grid minor;
xlabel('x'); ylabel('y');
title('Free dynamics');
%% feedback control
% Equations as derived in report
f1 = @(x,y)(y);
f2 = @(x,y)(-x-y+1);
[Xa,Ya,Ua,Va] = derivatives(2,41,f1,f2);
figure;
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
quiver(Xa,Ya,Ua,Va,0.5);
grid on; grid minor;
xlabel('x'); ylabel('y');
title('Feedback control');