clear; close all;
mu = -10:1:-2;
mum = -2:0.25:0;
mur = 0:1:5;
p1 = plot(mum,sqrt(6*(mum+2)),'b');
hold on;
plot(mum,-1*sqrt(6*(mum+2)),'b');
plot(mur,sqrt(6*(mur+2)),'b');
plot(mur,-1*sqrt(6*(mur+2)),'b')
% hold on;
plot(mu,zeros(size(mu)),'b');
p2 = plot([mum mur], zeros(size([mum mur])), 'r--');
legend([p1 p2],{'stable','saddle'},'Location','best');
xlabel('\mu');ylabel('x');
title('Bifurcation plot: $(x+2)\mu - \frac{x^3}{6} = 0$','Interpreter','latex')
