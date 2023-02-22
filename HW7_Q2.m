% MATH 450: Partial Differential Equations, Homework # 7, Q2
% Mikhail Smirnov (ID: 1249994)

% Solving u_t = nu*u_xx over x = [0,1], and t > 0
% IC: u(x,0) = cos(pi*x/2)
% BC: u(0,t) = 0, t >= 0,
% BC: u(1,t) = 0, t >= 0,

tmax = 10;
dt = 0.01;
itert = (tmax/dt); % # of time steps (n)

xmax = 1;
dx = 0.1;
iterx = xmax/dx; % # of x steps

nu = (1/6);
r = (nu * dt)/(dx^2);

u = zeros(iterx, itert); % Rows = x coordinates, Columns = t coordinates

u(1:10, 1) = cos(pi * (1:10) * dx / 2); % Fill up with IC
A(1,2) = -2*r;
for i = 1:iterx
    A(i,i) = 1 + 2*r; % Diagonal terms
end

for i = 1:(iterx-1)
    A(i+1, i) = -r; % Below diagonal terms
end

for i = 2:(iterx-1)
    A(i,i+1) = -r; % Above diagonal terms
end


for j = 1:itert
   u(:,(j+1)) = A\u(:,j); % Solve for at time j
    
end

plot(u(:,(0.001*1000))); % 0.001 of 1000 ( t = 0.01)
hold on
plot(u(:,(0.01*1000))); % 0.01 of 1000 ( t = 0.1)
hold on 
plot(u(:,(0.1*1000))); % 0.1 of 1000 (t = 1)
hold on
plot(u(:,(1*1000))); % at last time step ( t = 10)
hold on
xlabel('$x$','Interpreter', 'LaTex')
ylabel('$u$','Interpreter','LaTex')
title('Question 2 Numerical Solution at Various Times','Interpreter','LaTex')
legend('$t = 0.01$','$t = 0.1$', '$t = 1$', '$t = 10$')
set(legend,'Location','northwest')
set(legend,'Interpreter','LaTeX')
hold off
