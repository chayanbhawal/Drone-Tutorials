function quadrotor_3d_metrics_gui(z_ref_func,zdot_ref_func,zddot_ref_func,x0,T,m,g)
    f = figure('Position', [100, 100, 1150, 750], 'Name', 'Quadrotor 1D Control + Metrics');

    ax1 = axes('Units', 'pixels', 'Position', [70, 450, 380, 220]);
    ax3 = axes('Units', 'pixels', 'Position', [70, 130, 400, 250]);
    ax2 = axes('Units', 'pixels', 'Position', [580, 280, 500, 400]);

    uicontrol('Style', 'text', 'Position', [150, 70, 100, 20], 'String', 'Kp');
    kp_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 50, 'Value', 10, ...
        'Position', [190, 70, 200, 20]);
    kp_val_txt = uicontrol('Style', 'text', 'Position', [400, 70, 50, 20]);

    uicontrol('Style', 'text', 'Position', [150, 40, 100, 20], 'String', 'Kv');
    kv_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 50, 'Value', 5, ...
        'Position', [190, 40, 200, 20]);
    kv_val_txt = uicontrol('Style', 'text', 'Position', [400, 40, 50, 20]);

    metric_txt = uicontrol('Style', 'text', 'Position', [580, 50, 500, 60], ...
        'FontSize', 11, 'HorizontalAlignment', 'left');

    % Assign callback with parameters using anonymous function
    kp_slider.Callback = @(~, ~) update_plot_gui(kp_slider, kv_slider, kp_val_txt, kv_val_txt, ...
                                                  ax1, ax3, ax2, metric_txt,z_ref_func,zdot_ref_func,zddot_ref_func,x0,T,m,g);
    kv_slider.Callback = kp_slider.Callback;  % Same callback

    % Initial plot
    kp_slider.Callback();
end
