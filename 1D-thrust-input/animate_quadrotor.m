function animate_quadrotor(ax, z, t, z_ref)
    % Clear old drone graphics but keep axes properties
    delete(findobj(ax, 'Tag', 'DronePart'));

    view(ax, 45, 25);
    axis(ax, [-1 1 -1 1 0 1.5*z_ref]);
    grid(ax, 'on'); xlabel(ax, 'X'); ylabel(ax, 'Y'); zlabel(ax, 'Z');
    title(ax, '3D Quadrotor Animation');
    hold(ax, 'on');

    arm_length = 0.4;
    z_pos = z(1);

    % Initial coordinates
    armX = arm_length/2 * [-1 1];
    armY = arm_length/2 * [-1 1];

    % Plot arms and rotors (with tags for clean deletion next time)
    h_armX = plot3(ax, armX, [0 0], [z_pos z_pos], 'k', 'LineWidth', 3, 'Tag', 'DronePart');
    h_armY = plot3(ax, [0 0], armY, [z_pos z_pos], 'k', 'LineWidth', 3, 'Tag', 'DronePart');
    h_rotorX = scatter3(ax, armX, [0 0], [z_pos z_pos], 100, 'filled', 'r', 'Tag', 'DronePart');
    h_rotorY = scatter3(ax, [0 0], armY, [z_pos z_pos], 100, 'filled', 'b', 'Tag', 'DronePart');
    h_ref = plot3(ax, [0 0], [0 0], [0 z_ref], 'r--', 'Tag', 'DronePart');

    % Animation loop
    for k = 1:20:length(t)
        z_pos = z(k);

        % Update Z position of arms and rotors
        set(h_armX, 'ZData', [z_pos z_pos]);
        set(h_armY, 'ZData', [z_pos z_pos]);
        set(h_rotorX, 'ZData', [z_pos z_pos]);
        set(h_rotorY, 'ZData', [z_pos z_pos]);

        drawnow limitrate;
        pause(0.1);  % Slower animation
    end
end
