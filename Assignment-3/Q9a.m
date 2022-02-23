clear; close all;
clear all

%% functions
% writing it as a function of mu, when evaluating derivatives will pass
% appropriate mu
f1 = @(x,y,mu)(mu-x^2);
f2 = @(x,y,mu)(-y);
%% Initialize video
vid = VideoWriter('CH18B020_Q9a');
vid.FrameRate = 4;  
open(vid)
figure(1);
xlim([-10 10])
ylim([-10 10])
for mu = -10:10
    [Xa,Ya,Ua,Va] = derivatives(10,30,@(x,y)f1(x,y,mu),@(x,y)f2(x,y,mu));
    % Use quiver to plot; S = 0.5 to ensure arrows don't intersect
    figure(1);
    quiver(Xa,Ya,Ua,Va,0.5)
    xlabel('x'); ylabel('y');
    axis tight equal;
    title(['Saddle node bifurcation: \mu = ',num2str(mu)])
    frame = getframe(gcf);  writeVideo(vid, frame);
end
close(vid)