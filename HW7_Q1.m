% MATH 450: Partial Differential Equations, Homework # 7, Q1
% Mikhail Smirnov (ID: 1249994)

% Solving u_t = nu*u_xx over x = [0,1], and t > 0
% IC: u(x,0) = sin(2*pi*x)
% BC: u(0,t) = 0, t >= 0,
% BC: u(1,t) = 0, t >= 0,

tmax = 10;
dt = 0.01;
itert = (tmax/dt); % # of time steps
    
xmax = 1;
dx = 0.1;
iterx = xmax/dx; % # of x steps

nu = (1/6);
r = (nu * dt)/(dx^2);

u = zeros(iterx, itert); % Rows = x coordinates, Columns = t coordinates
u(1, :) = 0; % Left BC
u(iterx, :) = 0; % Right BC

u(2:(iterx-1), 1) = sin(2 * pi * (2:iterx-1) * dx); % Fill up with IC

for j = 1:(itert-1) % Time loop 
    u(1, j+1) = r*u(2,j) + (1-2*r)*u(1,j) + 0; % for i = 0; (1 is 0 here)
    for i = 2:(iterx-1) % x loop excluding BC's
       u(i, j+1) = r*u(i+1,j) + (1-2*r)*u(i,j); % + r*u(i-1,j);
    end
end

plot(u(:,(0.001*1000))); % 0.001 of 1000 ( t = 0.01)
hold on
plot(u(:,(0.01*1000))); % 0.01 of 1000
hold on 
plot(u(:,(0.1*1000))); % 0.1 of 1000
hold on
plot(u(:,(1*1000))); % at last time step
hold on
xlabel('$x$','Interpreter', 'LaTex')
ylabel('$u$','Interpreter','LaTex')
title('Question 1 Numerical Solution at Various Times','Interpreter','LaTex')
legend('$t = 0.01$','$t = 0.1$', '$t = 1$', '$t = 10$')
set(legend,'Location','northwest')
set(legend,'Interpreter','LaTeX')
hold off
