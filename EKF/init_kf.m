%initialise all variables for ekf

%sensor numbers
global s1; 
global s2; 
global s3;

s1 = 1;
s2 = 2;
s3 = 3;

%link length
global L;
L = 0.5; %check the length to antennas actually 

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

%time 
global t_beg;
global t_end;

%01
t_beg  = 37500;
t_end  = 37630;

%02
% t_beg = 50160;
% t_end = 50270;

%03
%t_beg = 50790;
%t_end = 50869.9;

%06 circle old
%t_beg = 51715;
%t_end = 51778.9;

%06
% t_beg = 51740;
% t_end = 51778.9;

%07
% t_beg = 52080;
% t_end = 52149.9;

%08
% t_beg = 52470;
% t_end = 52569.9;

%check initial points again

%01
x_0 = 2.7;  
y_0 = 4.4;
z_0 = 0.5;

%02
% x_0 = 2;
% y_0 = 10;
% z_0 = 0;

%03
%x_0 = 4.5;
%y_0 = 11;
%z_0 = 0;

%06
% x_0 = 4.5;
% y_0 = 10;
% z_0 = 1.5;

%07
% x_0 = 4;
% y_0 = 11;
% z_0 = 2;

%08
% x_0 = 4.5;
% y_0 = 11;
% z_0 = 0;

%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz]
xhat =    [x_0; y_0; z_0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];  

%initialise error covariances (pos - higher covariance) change 
P_0  = [0.5; 0.5; 0.5; 0; 0; 0; 0; 0; 0; 2; 2; 2; 0; 0; 0; 0; 0; 0];
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

% filename_s1 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ECEF\20211014_(01).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ECEF\20211014_(02).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ECEF\20211014_(03).csv";

% filename_s1 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ENU\20211014_(01)_ENU.csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ENU\20211014_(02)_ENU.csv"
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ENU\20211014_(03)_ENU.csv"

% filename_s1 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ENU\20211014_(01)_ENU.csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\SQUARE\20211019_02.csv"
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\Thursday 10-14\ENU\20211014_(03)_ENU.csv"

% filename_s1 = "C:\Users\avall\OneDrive\Desktop\Wednesday 10-20\TiltedSquare\20211020_01.csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\Wednesday 10-20\TiltedSquare\20211020_02.csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\Wednesday 10-20\TiltedSquare\20211020_03.csv";

%01
filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\square(01)\sensor1_211024(01).csv";
filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\square(01)\sensor2_211024(01).csv";
filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\square(01)\sensor3_211024(01).csv"
% 
%02
% filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\square(02)\sensor1_211024(02).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\square(02)\sensor2_211024(02).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\square(02)\sensor3_211024(02).csv";

%03
% filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\square(03)\sensor1_211024(03).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\square(03)\sensor2_211024(03).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\square(03)\sensor3_211024(03).csv";

%06
% filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\Circle(06)\sensor1_211024(06).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\Circle(06)\sensor2_211024(06).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\Circle(06)\sensor3_211024(06).csv";


%07
% filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\Random1(07)\sensor1_211024(07).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\Random1(07)\sensor2_211024(07).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\Random1(07)\sensor3_211024(07).csv";

%08
% filename_s1 = "C:\Users\avall\OneDrive\Desktop\211024\Random2(08)\sensor1_211024(08).csv";
% filename_s2 = "C:\Users\avall\OneDrive\Desktop\211024\Random2(08)\sensor2_211024(08).csv";
% filename_s3 = "C:\Users\avall\OneDrive\Desktop\211024\Random2(08)\sensor3_211024(08).csv";

meas.sensor1 = readmatrix(filename_s1);
meas.sensor2 = readmatrix(filename_s2);
meas.sensor3 = readmatrix(filename_s3);

%initialise process noise covariances
global sigmaq_ddx;
global sigmaq_ddy;
global sigmaq_ddz;
             
global sigmaq_drx;
global sigmaq_dry;
global sigmaq_drz; 

%check maximum acceleration that we can change
sigmaq_ddx = 0.0001;
sigmaq_ddy = 0.0001;
sigmaq_ddz = 0.0001;

sigmaq_drx = 0.001;
sigmaq_dry = 0.001;
sigmaq_drz = 0.001;

%initialise struct to save states
global kinematic

kinematic.covariance    = [];
kinematic.time          = [];
kinematic.state         = [];
kinematic.pred_states   = []; 
kinematic.pred_P        = [];
kinematic.F             = [];

%initialise vars for outlier rejection 
global outliers;
outliers = 0;
