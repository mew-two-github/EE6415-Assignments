syms a b c d e f;
A = [1.3 0.2 0.2;-1 0.4 -0.4;-0.4 -0.2 0.7];
Q = [2 0 0;0 1 0;0 0 3];
% Eigen values 0.7, 0.8, 0.9. < 1 so asymptotically stable
P = [a b c;b d e;c e f];
matrix = vpa( A'*P - P*inv(A),2);
rhs = -1*Q*inv(A);
% Equations: 
% 0.9*a - 2.7*b - 1.1*c= 0.7937
% 0.36*a - 0.66*b - 0.36*c - 1.0*d - 0.4*e= -0.7143
% 0.32*a - 0.63*b - 0.13*c - 1.0*e - 0.4*f= -0.6349
% 0.56*b - 1.6*d - 0.56*e= 1.9643
% 0.32*b + 0.2*c - 0.63*d - 1.0*e - 0.2*f= 0.6349
% 0.52*c - 1.0*e - 0.73*f= 4.2857
row = zeros(6);
row(1,:) = [0.9 -2.7 -1.1 0 0 0];
row(2,:) = [0.36 -0.66 -0.36 -1.0 -0.4 0];
row(3,:) = [0.32 -0.63 -0.13 0 -1.0 -0.4];
row(4,:) = [0 0.56 0 -1.6 -0.56 0];
row(5,:) = [0 0.32 0.2 -0.63 -1.0 -0.2];
row(6,:) = [0 0 0.52 0 -1.0 -0.73];
b =[rhs(1,1);rhs(1,2);rhs(1,3);rhs(2,2);rhs(2,3);rhs(3,3)];
x = row\b;
P = [x(1) x(2) x(3); x(2) x(4) x(5); x(3) x(5) x(6)];
eigval = eig(P);
