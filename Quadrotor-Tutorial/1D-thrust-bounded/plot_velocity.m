function plot_velocity(ax, t, zdot, T)
    cla(ax);
    plot(ax, t, zdot, 'm', 'LineWidth', 1.5);
    title(ax, 'Vertical Velocity $$\dot{z}(t)$$', 'Interpreter', 'latex');
    xlabel(ax, 'Time [s]'); ylabel(ax, 'Velocity [m/s]');
    grid(ax, 'on');
    axis(ax, [0 T min(-0.5, min(zdot)) max(1.5, max(zdot))]);
end
