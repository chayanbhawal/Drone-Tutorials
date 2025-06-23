function dx = double_integrator(t, x, z_ref, Kp, Kv,m,g)
    z = x(1);
    zdot = x(2);
    e = z_ref - z;
    edot = -zdot;
    u = m*(g + Kv * edot + Kp * e);
    dx = [zdot; (u/m)-g];  % dz/dt = zdot, dzdot/dt = 1/m(T-mg)
end