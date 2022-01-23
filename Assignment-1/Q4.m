clear; close all;
%% functions
f1 = @(x,y,mu)(mu*x + y + sin(x));
f2 = @(x,y,mu)(x - y);
%% mu = -2.5
[Xa,Ya,Ua,Va] = derivatives(6,50,@(x,y)f1(x,y,-1),@(x,y)f2(x,y,-1));
quiver(Xa,Ya,Ua,Va,0.5)
xlabel('x'); ylabel('y');
title('\mu = -2.5');
%% mu = -2
[Xb,Yb,Ub,Vb] = derivatives(1,20,@(x,y)f1(x,y,0),@(x,y)f2(x,y,0));
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xb,Yb,Ub,Vb,0.5)
xlabel('x'); ylabel('y');
title('\mu = -2');
%% mu = -1.5
[Xc,Yc,Uc,Vc] = derivatives(1,20,@(x,y)f1(x,y,1),@(x,y)f2(x,y,1));
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xc,Yc,Uc,Vc,0.5)
xlabel('x'); ylabel('y');
title('Part c');
title('\mu = -1.5');
