function quad2D_plot_and_animate_3D(t, x)
      figure('Color','w');
    axis([-0.5 5 -0.2 5 -0.5 5]);
    %view(45, 25); 
    grid on;
    xlabel('Y (m)'); ylabel('Z (m)'); zlabel('X (dummy)');
    title('Quadrotor 2D Motion (2D View with 2 Arms)');
    hold on;

    % Plot path trace
    %plot3(x(:,1), x(:,2), zeros(size(x,1),1), 'b--', 'LineWidth', 1);

    % Initialize arms and center
    h_arm1 = plot3([0 0], [0 0], [0 0], 'k-', 'LineWidth', 3);  % front-back
    %h_arm2 = plot3([0 0], [0 0], [0 0], 'k-', 'LineWidth', 3);  % left-right
    h_center = plot3(0, 0, 0, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    h_time = text(1.0, 1.4, 0.2, '', 'FontSize', 10);

    L = 0.2;  % arm length (total = 2L)

    for i = 1:1:length(t)
        y = x(i,1); z = x(i,2); phi = x(i,3);

        % Rotation matrix for pitch
        R = [cos(phi), -sin(phi); sin(phi), cos(phi)];

        % Arm vectors in 2D (Y-Z)
        arm1 = R * [L; 0];     % left-right (Y axis)
        arm2 = R * [0; L];     % front-back (Z axis)

        % Coordinates of arm tips
        p1a = [y; z] + arm1; p1b = [y; z] - arm1;
        p2a = [y; z] + arm2; p2b = [y; z] - arm2;

        % Update plots (Z is dummy = 0)
        set(h_arm1, 'XData', [p1a(1), p1b(1)], 'YData', [p1a(2), p1b(2)], 'ZData', [0, 0]);
        %set(h_arm2, 'XData', [p2a(1), p2b(1)], 'YData', [p2a(2), p2b(2)], 'ZData', [0, 0]);
        set(h_center, 'XData', y, 'YData', z, 'ZData', 0);
        set(h_time, 'String', sprintf('t = %.2f s', t(i)));

        drawnow;
    end
    plot3(x(:,1), x(:,2), zeros(size(x,1),1), 'b--', 'LineWidth', 1);
end
