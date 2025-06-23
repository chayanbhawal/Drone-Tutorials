function plot_altitude(ax, t, z, z_ref, T)
    cla(ax);
    plot(ax, t, z, 'b', 'LineWidth', 1.5); hold(ax, 'on');
    yline(ax, z_ref, 'r--', 'LineWidth', 1.2);
    legend(ax, 'z(t)', 'z_{ref}');
    title(ax, 'Altitude Tracking', 'Interpreter', 'latex');
    xlabel(ax, 'Time [s]'); ylabel(ax, 'z(t)');
    grid(ax, 'on'); axis(ax, [0 T -10 1.5*z_ref]);
end
