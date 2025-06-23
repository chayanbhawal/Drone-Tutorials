function dx = quad2D_dynamics(t, x, p)
    % Extract states
    y = x(1); z = x(2); phi = x(3);
    y_dot = x(4); z_dot = x(5); phi_dot = x(6);

    % Errors
    e_y = p.y_des - y; e_yd = -y_dot;
    e_z = p.z_des - z; e_zd = -z_dot;

    % Gains
    Kp_y = 6; Kd_y = 10;
    Kp_z = 20; Kd_z = 8;
    Kp_phi = 50; Kd_phi = 15;

    % Control
    % Altitude hold controller
    T = p.m * (Kd_z*e_zd + Kp_z*e_z + p.g);

     % Case-I: No control of roll angle.
    tau_phi = 0;
    
    % Case-II: Reference roll angle = 0
    %phi_des = 0; 
    %tau_phi = Kp_phi*(phi_des - phi) + Kd_phi*(-phi_dot); 
    
    
    % Accelerations
    y_ddot = -sin(phi)*T/p.m ;
    z_ddot = cos(phi)*T/p.m - p.g;
    phi_ddot = tau_phi / p.Ixx;

    % Disturbance in ydot only
    if t > 5 && t < 20
        dy = double(1 * sin(2*pi*2/10 * t) > 0);  % 1 if positive, 0 otherwise
    else
        dy = 0;
    end

    % State derivative
    dx = [y_dot+ 0*dy/p.m; z_dot; phi_dot+1*dy/p.m; y_ddot; z_ddot; phi_ddot];
end
