function plot_velocity(ax, t, zdot, T, zdot_ref)
    cla(ax);
    plot(ax, t, zdot, 'm', 'LineWidth', 1.5); hold(ax, 'on');

    % Plot reference velocity if provided
    if nargin == 5 && ~isempty(zdot_ref)
        plot(ax, t, zdot_ref, 'k--', 'LineWidth', 1.2);
        legend(ax, '$\dot{z}(t)$', '$\dot{z}_{ref}(t)$', 'Interpreter', 'latex');
    else
        legend(ax, '$\dot{z}(t)$', 'Interpreter', 'latex');
    end

    title(ax, 'Vertical Velocity $$\dot{z}(t)$$', 'Interpreter', 'latex');
    xlabel(ax, 'Time [s]');
    ylabel(ax, 'Velocity [m/s]');
    grid(ax, 'on');

    % Dynamic axis limits
    if nargin == 5 && ~isempty(zdot_ref)
        all_vals = [zdot(:); zdot_ref(:)];
    else
        all_vals = zdot(:);
    end

    y_min = min(all_vals) - 0.1;
    y_max = max(all_vals) + 0.1;
    axis(ax, [0 T y_min y_max]);
end
