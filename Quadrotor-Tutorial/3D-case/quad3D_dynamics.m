function dx = quad3D_dynamics(t, x, p)
    % Extract states
    x_pos = x(1); y_pos = x(2); z_pos = x(3);
    phi = x(4); theta = x(5); psi = x(6);
    x_dot = x(7); y_dot = x(8); z_dot = x(9);
    phi_dot = x(10); theta_dot = x(11); psi_dot = x(12);

    % Errors (assumes desired values are constant or predefined in p)
    ex = p.x_des - x_pos; ex_dot = p.x_dot_des - x_dot;
    ey = p.y_des - y_pos; ey_dot = p.y_dot_des - y_dot;
    ez = p.z_des - z_pos; ez_dot = p.z_dot_des - z_dot;

    % Control gains
    Kp_xy = 6;  Kd_xy = 10;
    Kp_z  = 20; Kd_z  = 8;
    Kp_ang = 50; Kd_ang = 15;

    % Desired accelerations
    x_ddot_c = Kp_xy*ex + Kd_xy*ex_dot;
    y_ddot_c = Kp_xy*ey + Kd_xy*ey_dot;
    z_ddot_c = Kp_z*ez + Kd_z*ez_dot + p.g;

    % Desired roll and pitch from outer loop
    phi_des   = -(1/p.g)*(y_ddot_c);
    theta_des =  (1/p.g)*(x_ddot_c);

    % Apply bounds on desired angles (±30 deg)
    phi_des = min(max(phi_des, deg2rad(-30)), deg2rad(30));
    theta_des = min(max(theta_des, deg2rad(-30)), deg2rad(30));
    psi_des = min(max(p.psi_des, deg2rad(-180)), deg2rad(180));  % wrap or clamp

    % Thrust
    T = p.m * z_ddot_c;
    T = min(max(T, 0), 2*p.m*p.g);  % bound thrust (N)

    % Torque commands
    tau_phi   = Kp_ang*(phi_des - phi)   + Kd_ang*(0 - phi_dot);
    tau_theta = Kp_ang*(theta_des - theta) + Kd_ang*(0 - theta_dot);
    tau_psi   = Kp_ang*(psi_des - psi) + Kd_ang*(0 - psi_dot);

    % Apply torque limits (Nm)
    tau_phi   = min(max(tau_phi,   -0.5), 0.5);
    tau_theta = min(max(tau_theta, -0.5), 0.5);
    tau_psi   = min(max(tau_psi,   -0.3), 0.3);

    % Compute accelerations
    x_ddot = (T/p.m)*(cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi));
    y_ddot = (T/p.m)*(cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi));
    z_ddot = (T/p.m)*cos(phi)*cos(theta) - p.g;

    phi_ddot   = tau_phi   / p.Ixx;
    theta_ddot = tau_theta / p.Iyy;
    psi_ddot   = tau_psi   / p.Izz;

    % Apply velocity limits (m/s)
    x_dot = min(max(x_dot, -5), 5);
    y_dot = min(max(y_dot, -5), 5);
    z_dot = min(max(z_dot, -5), 5);

    % Apply attitude limits (±45 deg)
    phi = min(max(phi, deg2rad(-45)), deg2rad(45));
    theta = min(max(theta, deg2rad(-45)), deg2rad(45));
    psi = min(max(psi, deg2rad(-180)), deg2rad(180));

    % State derivative
    dx = [x_dot; y_dot; z_dot;
          phi_dot; theta_dot; psi_dot;
          x_ddot; y_ddot; z_ddot;
          phi_ddot; theta_ddot; psi_ddot];
end
