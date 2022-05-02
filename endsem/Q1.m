clear; close all;
%% Define tfs
s = tf('s');
G0 = 10/(s+4);
G1 = 4/(s+1)/(0.5*s+1)/(s/3+1);
G2 = (s+2)/(s^2 + 2*s +1);
G3 = (s^2 + 8*s + 15)/(s^2 + 6*s + 8);
G = [G0;G1;G2;G3];
% Set tolerance for solver
tol = 10^-9;
opt = sdpsettings('solver','mosek','verbose',1,'debug',1);
%% Part a)
[P0,results0] = PR(G0,tol)
[P1,results1] = PR(G1,tol)
[P2,results2] = PR(G2,tol)
[P3,results3,res] = PR(G3,tol)
% Part a: Plot the nyquist plots to validate answers
% for i = 1:4
%     figure;
%     nyquist(G(i));
%     saveas(gcf,'q1-nyq-'+string(i)+'.png')
% end
%% Part b) 
answers_b = zeros(3,3);
for i = 2:4
    for j = i+1:4
        % Using feedback to ensure minimal realisation of the system is
        % passed to PR function
        [Pi,res] = PR(feedback(G(i),G(j)),tol);
        answers_b(i-1,j-1) = res;
        [Pj,res] = PR(feedback(G(j),G(i)),tol);
        answers_b(j-1,i-1) = res;
    end
end
%% Part c)
answers_c = zeros(3,3);
for i = 2:4
    for j = i+1:4
        % Passing minimal realisation of GiGj into PR
        [P,res] = PR(minreal(G(i)*G(j)),tol);
        answers_c(i-1,j-1) = res;
    end
end
%% Function to find P in the Positive Real lemma
% 0 - not positive real => not passive
% 1 - positive real  but not strict => passive
% 2 - strictly positive real => passive
function [Pfeasible,result,res] = PR(G,tol)
    result = 1;
    % Extract numerator and denominator from tf
    [NUM,DEN] = tfdata(G,'v');
    % Convert to statespace form
    [A,B,C,D] = tf2ss(NUM,DEN);
    % Get the number of states
    [n,~] = size(A);
    % Impose constraints and solve for P
    P = sdpvar(n,n);
    F = [P>=0,[A'*P+P*A, P*B-C';B'*P-C, -D'-D]<=0];
    
    optimize(F);
    Pfeasible = value(P);
    % Check if constraints are satisfied
    [res,~] = check(F);
    % Both constraints strictly satisfied
    if (res(1) > tol) && (res(2) > tol)
        result = 2;
    % One of the constraints not satisfied
    elseif (res(1) < -1*tol) || (res(2) < -1*tol)
        result = 0;
    end
end