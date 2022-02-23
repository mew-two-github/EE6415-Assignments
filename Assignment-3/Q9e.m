clear; close all;
%% functions
% writing it as a function of mu, when evaluating derivatives will pass
% appropriate mu
f1 = @(x,y,mu)(x*(mu-x^2-y^2)+y);
f2 = @(x,y,mu)(-x+ y*(mu-x^2-y^2));
%% Initialize video
vid = VideoWriter('CH18B020_Q9e');
vid.FrameRate = 4;  
open(vid)
figure(1);
xlim([-10 10])
ylim([-10 10])
for mu = -20:20
    [Xa,Ya,Ua,Va] = derivatives(20,30,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
    % Use quiver to plot; S = 0.5 to ensure arrows don't intersect
    figure(1);
    quiver(Xa,Ya,Ua,Va,0.5)
    xlabel('x'); ylabel('y');
    axis tight equal;
    title(['Supercritical Hopf Bifurcation: \mu = ',num2str(mu)])
    frame = getframe(gcf);  writeVideo(vid, frame);
end
close(vid)