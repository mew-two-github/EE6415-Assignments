clear; close all;
%% functions
f1 = @(x,y,mu)(mu*x - y + x*y^2);
f2 = @(x,y,mu)(x + mu*y + y^3);
%% mu = -1
[Xa,Ya,Ua,Va] = derivatives(6,50,@(x,y)f1(x,y,-1),@(x,y)f2(x,y,-1));
quiver(Xa,Ya,Ua,Va,0.5)
xlabel('x'); ylabel('y');
title('\mu = -1');
%% mu = 0
[Xb,Yb,Ub,Vb] = derivatives(1,20,@(x,y)f1(x,y,0),@(x,y)f2(x,y,0));
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xb,Yb,Ub,Vb,0.5)
xlabel('x'); ylabel('y');
title('\mu = 0');
%% mu = 1
[Xc,Yc,Uc,Vc] = derivatives(1,20,@(x,y)f1(x,y,1),@(x,y)f2(x,y,1));
% Use quiver to plot; S = 0.75 to ensure arrows don't intersect
figure;
quiver(Xc,Yc,Uc,Vc,0.5)
xlabel('x'); ylabel('y');
title('Part c');
title('\mu = 1');
