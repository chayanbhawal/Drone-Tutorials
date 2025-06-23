% Reference trajectory 
z_ref = 1; 

% Initial condition: [z; zdot]
x0 = [0; 0];

% Simulation time
T = 10;

% Quadrotor mass
m=1;

% Acceleration due to gravity
g=9.8;

quadrotor_3d_metrics_gui(z_ref,x0,T,m,g);