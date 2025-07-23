close all;

%% PLOT RESULTS
figure('Color', 'w');

subplot(3,3,1);
plot(timempc, ref_full(:,1), 'LineWidth', 1.5); hold on;
plot(timempc, xmpc(:,1), 'LineWidth', 1.5);hold on;
plot(timepid, xpid(:,1), 'LineWidth', 1.5);hold on;


ylabel('x (m)');title('Position X');legend('x^{ref}','x^{MPC}','x^{PID}'); grid on;

subplot(3,3,2);
plot(timempc, ref_full(:,2), 'LineWidth', 1.5); hold on;
plot(timempc, xmpc(:,2), 'LineWidth', 1.5);
plot(timepid, xpid(:,2), 'LineWidth', 1.5);hold on;
ylabel('y (m)'); title('Position Y');legend('y^{ref}','y^{MPC}','y^{PID}'); grid on;

subplot(3,3,3);
plot(timempc, ref_full(:,3), 'LineWidth', 1.5); hold on;
plot(timempc, xmpc(:,3), 'LineWidth', 1.5);
plot(timepid, xpid(:,3), 'LineWidth', 1.5);hold on;
ylabel('z (m)'); title('Position Z');legend('z^{ref}','z^{MPC}','z^{PID}'); grid on;

subplot(3,3,4);
plot(timempc, xmpc(:,4)*180/pi, 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,4)*180/pi, 'LineWidth', 1.5);
ylabel('\phi (deg)'); title('Roll');legend('\phi^{MPC}','\phi^{PID}'); grid on;

subplot(3,3,5);
plot(timempc, xmpc(:,5)*180/pi, 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,5)*180/pi, 'LineWidth', 1.5); 
ylabel('\theta (deg)'); title('Pitch'); grid on;legend('\theta^{MPC}','\theta^{PID}'); grid on;

subplot(3,3,6);
plot(timempc, xmpc(:,6)*180/pi, 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,6)*180/pi, 'LineWidth', 1.5); 
ylabel('\psi (deg)'); title('Yaw'); grid on;legend('\psi^{MPC}','\psi^{PID}'); grid on;

subplot(3,3,7);
plot(timempc, xmpc(:,7), 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,7), 'LineWidth', 1.5);
ylabel('ẋ (m/s)'); xlabel('Time (s)'); title('Velocity X'); grid on;legend('ẋ^{MPC}','ẋ^{PID}'); grid on;


subplot(3,3,8);
plot(timempc, xmpc(:,8), 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,8), 'LineWidth', 1.5);
ylabel('ẏ (m/s)'); xlabel('Time (s)'); title('Velocity Y'); grid on; legend('ẏ^{MPC}','ẏ^{PID}'); grid on;

subplot(3,3,9);
plot(timempc, xmpc(:,9), 'LineWidth', 1.5); hold on;
plot(timepid, xpid(:,9), 'LineWidth', 1.5);
ylabel('ż (m/s)'); xlabel('Time (s)'); title('Velocity Z'); grid on; legend('ż^{MPC}','ż^{PID}'); grid on;

