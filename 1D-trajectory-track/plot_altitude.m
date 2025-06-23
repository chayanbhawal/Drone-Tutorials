function plot_altitude(ax, t, z, z_ref, T)
    cla(ax);
    plot(ax, t, z, 'b', 'LineWidth', 1.5); hold(ax, 'on');
    plot(ax, t, z_ref, 'r--', 'LineWidth', 1.2);  % Time-varying reference
    legend(ax, 'z(t)', 'z_{ref}(t)');
    title(ax, 'Altitude Tracking', 'Interpreter', 'latex');
    xlabel(ax, 'Time [s]');
    ylabel(ax, 'z(t)');
    grid(ax, 'on');

    % Dynamic axis limits based on data range
    z_all = [z; z_ref];
    y_min = min(z_all) - 0.1;
    y_max = max(z_all) + 0.1;
    axis(ax, [0 T y_min y_max]);
end
