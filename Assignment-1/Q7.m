clear; close all;
%% unforced dynamics
% Here q and qdot are the states x1 and x2
% system dynamics:
% x1dot = x2
% x2dot = -sin(x1)-x2
f1 = @(x,y)(y);
f2 = @(x,y)(-sin(x)-y);
[Xa,Ya,Ua,Va] = derivatives(2,10,f1,f2);
quiver(Xa,Ya,Ua,Va,0.5);
xlabel('x'); ylabel('y');
title('Free dynamics');
%% feedback control
f1 = @(x,y)(y);
f2 = @(x,y)(-x-y+1);
[Xa,Ya,Ua,Va] = derivatives(2,10,f1,f2);
figure;
quiver(Xa,Ya,Ua,Va,0.5);
xlabel('x'); ylabel('y');
title('Feedback control');