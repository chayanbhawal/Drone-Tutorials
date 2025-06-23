function update_plot_gui(kp_slider, kv_slider, kp_val_txt, kv_val_txt, ax1, ax3, ax2, metric_txt,z_ref,x0,T,m,g)
    kp_val_txt.String = sprintf('%.1f', kp_slider.Value);
    kv_val_txt.String = sprintf('%.1f', kv_slider.Value);

   

    Kp = kp_slider.Value;
    Kv = kv_slider.Value;


    %tspan = [0 T];
    tspan = linspace(1,T,100);

    % ODE simulation
    [t, x] = ode45(@(t, x) double_integrator(t, x, z_ref, Kp, Kv,m,g), tspan, x0);


    z = x(:,1);
    zdot = x(:,2);

    [peak_time, overshoot_pct, settle_time] = compute_metrics(t, z, z_ref);
    metric_txt.String = sprintf('Peak Time: %.2f s     Max Overshoot: %.2f %%     Settling Time: %.2f s', peak_time, overshoot_pct, settle_time);                                
    
    
    plot_altitude(ax1, t, z, z_ref, T);
    plot_velocity(ax3, t, zdot, T);
    animate_quadrotor(ax2, z, t, z_ref);
end

