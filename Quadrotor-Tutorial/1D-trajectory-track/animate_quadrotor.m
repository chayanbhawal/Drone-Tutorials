function animate_quadrotor(ax, z, t, z_ref)
    cla(ax); view(ax, 45, 25);

    % Dynamic Z-axis limits based on both z and z_ref
    z_all = [z; z_ref];
    z_min = min(z_all) - 0.1;
    z_max = max(z_all) + 0.1;

    axis(ax, [-1 1 -1 1 z_min z_max]);
    grid(ax, 'on');
    xlabel(ax, 'X'); ylabel(ax, 'Y'); zlabel(ax, 'Z');
    title(ax, '3D Quadrotor Animation');

    % ----- Add IITG Logo as Inset -----
    logo = imread('iitg.jpg');  % Ensure this file is accessible
    logo_ax = axes('Position', [0.86 0.5 0.08 0.08], 'Parent', ancestor(ax, 'figure'));
    imshow(logo, 'Parent', logo_ax);
    axis(logo_ax, 'off');
    set(logo_ax, 'HandleVisibility', 'off');  % Prevent accidental reuse
    % -----------------------------------

    arm_length = 0.4;

    for k = 1:20:length(t)
        cla(ax); hold(ax, 'on');
        z_pos = z(k);
        z_ref_k = z_ref(k);

        % Quadrotor arm coordinates centered at z_pos
        armX = arm_length/2 * [-1 1; 0 0; 0 0];
        armY = arm_length/2 * [0 0; -1 1; 0 0];

        for i = 1:2
            armX(:,i) = armX(:,i) + [0; 0; z_pos];
            armY(:,i) = armY(:,i) + [0; 0; z_pos];
        end

        % Draw quadrotor frame
        plot3(ax, armX(1,:), armX(2,:), armX(3,:), 'k', 'LineWidth', 3);
        plot3(ax, armY(1,:), armY(2,:), armY(3,:), 'k', 'LineWidth', 3);

        % Draw rotors
        scatter3(ax, armX(1,:), armX(2,:), armX(3,:), 100, 'filled', 'r');
        scatter3(ax, armY(1,:), armY(2,:), armY(3,:), 100, 'filled', 'b');

        % Draw vertical line to current reference altitude
        plot3(ax, [0 0], [0 0], [0 z_ref_k], 'r--');

        axis(ax, [-1 1 -1 1 z_min z_max]);
        pause(0.05);
    end
end
