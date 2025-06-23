function dx = double_integrator(~, x, z_ref, Kp, Kv)
    z = x(1);
    zdot = x(2);
    e = z_ref - z;
    edot = -zdot;
    u = Kv * edot + Kp * e; %Control law: zddot_des + Kv*edot + Kp*e = u
    dx = [zdot; u];         % dz/dt = zdot, dzdot/dt = u
end