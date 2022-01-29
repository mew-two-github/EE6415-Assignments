clear; close all;
%% functions
f1 = @(x,y,mu)(mu - x^2);
f2 = @(x,y,mu)(-y);
%% mu = -2
mu = -2;
[Xa,Ya,Ua,Va] = derivatives(2,20,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
quiver(Xa,Ya,Ua,Va,0.5)
xlabel('x'); ylabel('y');
title('\mu = -2');
%% mu = 0
mu = 0;
[Xb,Yb,Ub,Vb] = derivatives(2,26,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
figure;
quiver(Xb,Yb,Ub,Vb,0.5)
xlabel('x'); ylabel('y');
title('\mu = 0');
%% mu = 2
mu = 2;
[Xc,Yc,Uc,Vc] = derivatives(2,56,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
% Use quiver to plot; S = 0.5 to ensure arrows don't intersect
figure;
quiver(Xc,Yc,Uc,Vc,0.5)
xlabel('x'); ylabel('y');
title('Part c');
title('\mu = 2');
