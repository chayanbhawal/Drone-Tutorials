function animate_quadrotor(ax, z, t, z_ref)
    cla(ax); view(ax, 45, 25);
    axis(ax, [-1 1 -1 1 0 1.5*z_ref]);
    grid(ax, 'on'); xlabel(ax, 'X'); ylabel(ax, 'Y'); zlabel(ax, 'Z');
    title(ax, '3D Quadrotor Animation');

    arm_length = 0.4;
    for k = 1:20:length(t)
        cla(ax); hold(ax, 'on');
        z_pos = z(k);
        armX = arm_length/2 * [-1 1; 0 0; 0 0];
        armY = arm_length/2 * [0 0; -1 1; 0 0];

        for i = 1:2
            armX(:,i) = armX(:,i) + [0; 0; z_pos];
            armY(:,i) = armY(:,i) + [0; 0; z_pos];
        end

        plot3(ax, armX(1,:), armX(2,:), armX(3,:), 'k', 'LineWidth', 3);
        plot3(ax, armY(1,:), armY(2,:), armY(3,:), 'k', 'LineWidth', 3);
        scatter3(ax, armX(1,:), armX(2,:), armX(3,:), 100, 'filled', 'r');
        scatter3(ax, armY(1,:), armY(2,:), armY(3,:), 100, 'filled', 'b');
        plot3(ax, [0 0], [0 0], [0 z_ref], 'r--');

        axis(ax, [-1 1 -1 1 0 1.5*z_ref]);
        pause(0.05);
    end
end
