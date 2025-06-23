function dx = double_integrator(t, x, z_ref_func, zdot_ref_func, zddot_ref_func, Kp, Kv,m,g)
    z = x(1);
    zdot = x(2);

    z_ref = z_ref_func(t);  % Time-varying position reference
    z_dot_ref = zdot_ref_func(t); % Time-varying velocity reference
    z_ddot_ref = zddot_ref_func(t); % % Time-varying acceleration reference
    e = z_ref - z;
    edot = z_dot_ref - zdot;

    u = m * (g + z_ddot_ref + Kv * edot + Kp * e);
    dx = [zdot; -g + u/m];  % dz/dt = zdot, dzdot/dt = u
end
