function quad3D_plot_and_animate_3D(t, x)
    figure('Color','w');
    axis equal;
    axis([-1 6 -1 6 0 5]);
    view(45, 25);
    grid on;
    xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
    title('Quadrotor 3D Motion');
    hold on;


    % Initialize arms and center
    h_arm1 = plot3([0 0], [0 0], [0 0], 'k-', 'LineWidth', 2); % front-back
    h_arm2 = plot3([0 0], [0 0], [0 0], 'k-', 'LineWidth', 2); % left-right
    h_center = plot3(0, 0, 0, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    h_time = text(1, 1.5, 3.5, '', 'FontSize', 10);

    L = 0.3; % half arm length

    for i = 1:5:length(t)
        % Extract position and Euler angles
        pos = x(i,1:3);           % [x, y, z]
        phi = x(i,4);             % roll
        theta = x(i,5);           % pitch
        psi = x(i,6);             % yaw

        % Rotation matrix from body to inertial frame
        R = eul2rotm([psi, theta, phi], 'ZYX');

        % Arm directions in body frame
        arm_x = R * [L; 0; 0];  % front-back
        arm_y = R * [0; L; 0];  % left-right

        % Compute endpoints
        p1a = pos' + arm_x; p1b = pos' - arm_x;
        p2a = pos' + arm_y; p2b = pos' - arm_y;

        % Update graphics
        set(h_arm1, 'XData', [p1a(1), p1b(1)], 'YData', [p1a(2), p1b(2)], 'ZData', [p1a(3), p1b(3)]);
        set(h_arm2, 'XData', [p2a(1), p2b(1)], 'YData', [p2a(2), p2b(2)], 'ZData', [p2a(3), p2b(3)]);
        set(h_center, 'XData', pos(1), 'YData', pos(2), 'ZData', pos(3));
        set(h_time, 'String', sprintf('t = %.2f s', t(i)));

        drawnow;
    end

    % Trace path
    plot3(x(:,1), x(:,2), x(:,3), 'b--', 'LineWidth', 1);
end
