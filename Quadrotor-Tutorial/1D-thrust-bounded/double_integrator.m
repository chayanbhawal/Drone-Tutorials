function dx = double_integrator(t, x, z_ref, Kp, Kv,m,g,Tmax)
   
    z = x(1);
    zdot = x(2);
    e = z_ref - z;
    edot = -zdot;
    u = m*(g + Kv * edot + Kp * e)
    if(u>Tmax)
        u=Tmax;
    end
    if(u<0)
        u=0;
    end
    dx = [zdot; -g+u/m];  % dz/dt = zdot, dzdot/dt = 1/m(T-mg)
end