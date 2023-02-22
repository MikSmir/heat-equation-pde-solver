# PDE_Solver
These MATLAB codes were part of homework for a Partial Differential Equations class. Both problems involved solving a similar boundary value problem for a second order partial differential equation using the finite difference method. 

The problems solved were non-homogenous heat equations with different initial conditions.

The first problem was the following: 
Solving u_t = nu*u_xx over x = [0,1], and t > 0
u(x,0) = sin(2*pi*x)
u(0,t) = 0, t >= 0,
u(1,t) = 0, t >= 0,

The second problem was the following:
Solving u_t = nu*u_xx over x = [0,1], and t > 0
IC: u(x,0) = cos(pi*x/2)
BC: u(0,t) = 0, t >= 0,
BC: u(1,t) = 0, t >= 0,
