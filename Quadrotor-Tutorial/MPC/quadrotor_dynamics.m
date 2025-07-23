function dx = quadrotor_dynamics(x,u,m,g,Ix,Iy,Iz)
dx = zeros(12,1);


% States
phi = x(4); theta = x(5); psi = x(6);



% Translational dynamics
x_ddot = (u(1)/m)*(cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi));
y_ddot = (u(1)/m)*(cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi));
z_ddot = (u(1)/m)*cos(phi)*cos(theta) - g;

dx(1:3) = x(7:9);
dx(7:9) = [x_ddot;y_ddot;z_ddot];


% Rotation matrix

 % R = [cos(psi)*cos(theta), cos(psi)*sin(theta)*sin(phi)-sin(psi)*cos(phi), cos(psi)*sin(theta)*cos(phi)+sin(psi)*sin(phi);
 %     sin(psi)*cos(theta), sin(psi)*sin(theta)*sin(phi)+cos(psi)*cos(phi), sin(psi)*sin(theta)*cos(phi)-cos(psi)*sin(phi);
 %    -sin(theta),          cos(theta)*sin(phi),                            cos(theta)*cos(phi)];
% dx(1:3) = x(7:9);   % position derivatives
% F = [0; 0; u(1)];   % thrust in body frame
% acc = (1/m)*R*F - [0; 0; g];
% dx(7:9) = acc;




% Rotational dynamics

phi_dot = x(10); theta_dot = x(11); psi_dot = x(12);

dx(4:6) = [phi_dot; theta_dot; psi_dot];
phi_ddot   = u(2) / Ix;
theta_ddot = u(3) / Iy;
psi_ddot   = u(4) / Iz;

dx(10:12) = [phi_ddot;theta_ddot;psi_ddot];




% % Angular rates
% p = x(10); q = x(11); r = x(12);
% dx(4) = p + q*sin(phi)*tan(theta) + r*cos(phi)*tan(theta);
% dx(5) = q*cos(phi) - r*sin(phi);
% dx(6) = q*sin(phi)/cos(theta) + r*cos(phi)/cos(theta);
% 
% % Rotational dynamics
% tau = u(2:4);
% dx(10) = (tau(1) - (Iy - Iz)*q*r)/Ix;
% dx(11) = (tau(2) - (Iz - Ix)*p*r)/Iy;
% dx(12) = (tau(3) - (Ix - Iy)*p*q)/Iz;

end

