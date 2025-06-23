% Reference trajectory (e.g., sinusoidal)
A = 2;
omega = 2 * pi / 100;
z_ref_func = @(t) A * sin(omega * t);
zdot_ref_func = @(t) A * omega * cos(omega * t);  % Reference velocity
zddot_ref_func = @(t) -A * omega * omega * sin(omega*t);

% Initial condition: [z; zdot]
x0 = [1; 0];

%Simulation time
T = 100;

%Quadrotor Mass
m = 3;

% Acceleration due to gravity
g = 9.8;

quadrotor_3d_metrics_gui(z_ref_func,zdot_ref_func,zddot_ref_func,x0,T,m,g);