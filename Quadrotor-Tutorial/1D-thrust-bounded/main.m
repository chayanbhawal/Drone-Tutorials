% Reference altitude
z_ref = 5;


% Initial condition: [z; zdot]
x0 = [0; 0];

% Simulation Time
T = 10;

% Quadrotor mass
m=3;

% Acceleration due to gravity
g=9.8;

% Maximum allowable thrust
Tmax = 20;

quadrotor_3d_metrics_gui(z_ref,x0,T,m,g,Tmax);