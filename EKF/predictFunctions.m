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
dxyz = [dx; dy; dz];
ddxyz = [ddx; ddy; ddz];

rxyz = [rx; ry; rz];
drxyz = [drx; dry; drz];
ddrxyz = [ddrx; ddry; ddrz];

%constant acceleration for rx,ry,rz
next_rxyz = rxyz + drxyz * dt;
next_drxyz = drxyz + ddrxyz * dt;
next_ddrxyz = ddrxyz;

%constant acceleration for x,y,z
next_xyz = xyz + dxyz * dt;
next_dxyz = dxyz + ddxyz * dt;
next_ddxyz = ddxyz;

%x_k+1 
next_state = [next_xyz; next_dxyz; next_ddxyz; next_rxyz; next_drxyz; next_ddrxyz];
next_state_jac = jacobian(next_state, states);

matlabFunction(next_state, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\predict','Vars', vars);
matlabFunction(next_state_jac, 'file','C:\Users\avall\MATLAB Drive\EEE4022S\GPS_EKF\predict_j','Vars', vars);