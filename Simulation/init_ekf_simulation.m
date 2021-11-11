%initialise all variables for simulation ekf 
%sensor numbers
global s1; 
global s2; 
global s3;

s1 = 1;
s2 = 2;
s3 = 3;

%link length
global L;
L = 0.5;

%initialise kf variables
%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz]

global xhat;
global P;
global H;
global F;
global Q;
global y;
global R;
global z;
global dT;

%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz]
xhat = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; pi/2; 0; 0; 0; 0; 0; 0; 0];  

%initialise error covariances (pos - higher covariance) change 
P_0  = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
P    = diag(P_0);

H = [];
F = [];
Q = [];
y = [];
R = [];
z = [];
dT = 0.1;

%initialise data 
global meas;

meas.sensor1 = out.ps1_meas;
meas.sensor2 = out.ps2_meas;
meas.sensor3 = out.ps3_meas;

%initialise process noise covariances
global sigmaq_ddx;
global sigmaq_ddy;
global sigmaq_ddz;
             
global sigmaq_drx;
global sigmaq_dry;
global sigmaq_drz; 

%check maximum acceleration that we can change???
sigmaq_ddx = 0.5;
sigmaq_ddy = 0.5;
sigmaq_ddz = 0.5;

sigmaq_drx = 0.1;
sigmaq_dry = 0.1;
sigmaq_drz = 0.1;

%initialise struct to save states
global kinematic

kinematic.covariance    = [];
kinematic.time          = [];
kinematic.state         = [];
kinematic.pred_states   = []; 
kinematic.pred_P        = [];
kinematic.F             = [];
