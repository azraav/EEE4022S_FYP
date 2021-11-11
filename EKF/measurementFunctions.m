syms x y z 
syms dx dy dz
syms ddx ddy ddz

syms rx ry rz 
syms drx dry drz
syms ddrx ddry ddrz 

syms L dt

states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz];
vars = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz, L, dt];

xyz = [x; y; z];

R_b2i = rotationMatrix(rx, ry, rz); % body to inertial: euler 321
%% sensor 1 (euler 321)
P_OA = R_b2i*[0; L; 0];

h_s1 = P_OA + xyz;
%h_s1 = xyz;
hj_s1 = jacobian(h_s1, states);

matlabFunction(h_s1, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hs1','Vars', vars);
matlabFunction(hj_s1, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hjs1','Vars', vars);
%% sensor 2 (euler 321)
P_OB = R_b2i*[0; -L; 0];

%h_s2 = xyz;
h_s2 = P_OB + xyz;
hj_s2 = jacobian(h_s2, states);

matlabFunction(h_s2, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hs2','Vars', vars);
matlabFunction(hj_s2, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hjs2','Vars', vars);
%% sensor 3 (euler 321)
P_OC = R_b2i*[L; 0; 0];

h_s3 = P_OC + xyz;
%h_s3 = xyz;
hj_s3 = jacobian(h_s3, states);

matlabFunction(h_s3, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hs3','Vars', vars);
matlabFunction(hj_s3, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\update_hjs3','Vars', vars);