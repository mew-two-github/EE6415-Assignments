clear; close all;
%% functions
% writing it as a function of mu, when evaluating derivatives will pass
% appropriate mu
f1 = @(x,y,mu)(mu*x + y + sin(x));
f2 = @(x,y,mu)(x - y);
%% mu = -2.5
mu = -2.5;
[Xa,Ya,Ua,Va] = derivatives(1,26,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
quiver(Xa,Ya,Ua,Va,0.5)
xlabel('x'); ylabel('y');
title('\mu = -2.5');
%% mu = -2
mu = -2;
[Xb,Yb,Ub,Vb] = derivatives(1,26,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
figure;
quiver(Xb,Yb,Ub,Vb,0.5);
xlabel('x'); ylabel('y');
title('\mu = -2');
%% mu = -1.5
mu = -1.5;
[Xc,Yc,Uc,Vc] = derivatives(5,26,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
figure;
quiver(Xc,Yc,Uc,Vc,0.5)
xlabel('x'); ylabel('y');
title('Part c');
title('\mu = -1.5');
