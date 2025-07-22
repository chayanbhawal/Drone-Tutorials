clc; clear;

%% PARAMETERS
params.m = 0.5; 
params.g = 9.81; 
params.Ixx = 0.0023;

% Reference 
params.y_des = 0; 
params.z_des = 3;

% Initial condition
x0 = [0; 0; 0; 0; 0; 0];   % [y; z; phi; y_dot; z_dot; phi_dot]

% Simulation time
T = 10;
tspan = linspace(0,T,200);

%% SIMULATION
[t, x] = ode45(@(t,x) quad2D_dynamics(t, x, params), tspan, x0);

%% ANIMATION AND TRAJECTORY PLOT
quad2D_plot_and_animate_3D(t, x);

figure('Color', 'w');

subplot(2,3,1);
plot(t, x(:,1), 'LineWidth', 1.5); ylabel('y (m)'); title('Position Y'); grid on;

subplot(2,3,2);
plot(t, x(:,2), 'LineWidth', 1.5); ylabel('z (m)'); title('Position Z'); grid on;

subplot(2,3,3);
plot(t, x(:,3)*180/pi, 'LineWidth', 1.5); ylabel('$\phi$ (deg)', 'Interpreter', 'latex'); title('$\phi$', 'Interpreter', 'latex'); grid on;

subplot(2,3,4);
plot(t, x(:,4), 'LineWidth', 1.5); ylabel('ẏ (m/s)'); xlabel('Time (s)'); title('Velocity Y'); grid on;

subplot(2,3,5);
plot(t, x(:,5), 'LineWidth', 1.5); ylabel('ż (m/s)'); xlabel('Time (s)'); title('Velocity Z'); grid on;

subplot(2,3,6);
plot(t, x(:,6)*180/pi, 'LineWidth', 1.5); ylabel('\phi̇ (deg/s)'); xlabel('Time (s)'); title('Angular Velocity'); grid on;

