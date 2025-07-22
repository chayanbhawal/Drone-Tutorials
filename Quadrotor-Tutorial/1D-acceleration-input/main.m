z_ref = 2;  %Reference trajectory
    
% Initial condition: [z; zdot]
x0 = [0; 0];

% Simulation time
T = 10;

quadrotor_3d_metrics_gui(z_ref,x0,T);