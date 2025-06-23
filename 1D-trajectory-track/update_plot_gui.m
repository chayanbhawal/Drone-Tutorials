function update_plot_gui(kp_slider, kv_slider, kp_val_txt, kv_val_txt, ax1, ax3, ax2, metric_txt,z_ref_func,zdot_ref_func,zddot_ref_func,x0,T,m,g)
    kp_val_txt.String = sprintf('%.1f', kp_slider.Value);
    kv_val_txt.String = sprintf('%.1f', kv_slider.Value);

    Kp = kp_slider.Value;
    Kv = kv_slider.Value;


    tspan = linspace(0, T, 500);

    % ODE simulation
    [t, x] = ode45(@(t, x) double_integrator(t, x, z_ref_func, zdot_ref_func, zddot_ref_func,Kp, Kv,m,g), tspan, x0);

    z = x(:,1);
    zdot = x(:,2);
    z_ref_vals = z_ref_func(t);  % Evaluate trajectory over time
    zdot_ref_vals = zdot_ref_func(t);


    % Plotting
    plot_altitude(ax1, t, z, z_ref_vals, T);
    %plot_velocity(ax3, t, zdot, T);
    plot_velocity(ax3, t, zdot, T, zdot_ref_vals);
    animate_quadrotor(ax2, z, t, z_ref_vals);
end

