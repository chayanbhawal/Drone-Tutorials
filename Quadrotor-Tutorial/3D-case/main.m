clc; clear; close all;

%% PARAMETERS
params.m = 0.5; 
params.g = 9.81; 
params.Ixx = 0.0023;
params.Iyy = 0.0023;
params.Izz = 0.004;

% Reference 
params.x_des = 5;
params.y_des = 6; 
params.z_des = 3;

params.x_dot_des = 0;
params.y_dot_des = 0;
params.z_dot_des = 0;
params.x_ddot_des = 0;
params.y_ddot_des = 0;
params.z_ddot_des = 0;

params.psi_des = 0;     % Yaw set-point
params.psi_ref = 0;     % Used in outer-loop control

% Initial condition
x0 = zeros(12,1);

% Simulation time
T = 10;
tspan = linspace(0,T,3000);

%% SIMULATION
[t, x] = ode45(@(t,x) quad3D_dynamics(t, x, params), tspan, x0);

%% ANIMATION AND TRAJECTORY PLOT
quad3D_plot_and_animate_3D(t, x);

%% PLOT RESULTS
figure('Color', 'w');

subplot(3,3,1);
plot(t, x(:,1), 'LineWidth', 1.5); ylabel('x (m)'); title('Position X'); grid on;

subplot(3,3,2);
plot(t, x(:,2), 'LineWidth', 1.5); ylabel('y (m)'); title('Position Y'); grid on;

subplot(3,3,3);
plot(t, x(:,3), 'LineWidth', 1.5); ylabel('z (m)'); title('Position Z'); grid on;

subplot(3,3,4);
plot(t, x(:,4)*180/pi, 'LineWidth', 1.5); ylabel('\phi (deg)'); title('Roll'); grid on;

subplot(3,3,5);
plot(t, x(:,5)*180/pi, 'LineWidth', 1.5); ylabel('\theta (deg)'); title('Pitch'); grid on;

subplot(3,3,6);
plot(t, x(:,6)*180/pi, 'LineWidth', 1.5); ylabel('\psi (deg)'); title('Yaw'); grid on;

subplot(3,3,7);
plot(t, x(:,7), 'LineWidth', 1.5); ylabel('ẋ (m/s)'); xlabel('Time (s)'); title('Velocity X'); grid on;

subplot(3,3,8);
plot(t, x(:,8), 'LineWidth', 1.5); ylabel('ẏ (m/s)'); xlabel('Time (s)'); title('Velocity Y'); grid on;

subplot(3,3,9);
plot(t, x(:,9), 'LineWidth', 1.5); ylabel('ż (m/s)'); xlabel('Time (s)'); title('Velocity Z'); grid on;
