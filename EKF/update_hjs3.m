function hj_s3 = update_hjs3(x,y,z,dx,dy,dz,ddx,ddy,ddz,rx,ry,rz,drx,dry,drz,ddrx,ddry,ddrz,L,dt)
%UPDATE_HJS3
%    HJ_S3 = UPDATE_HJS3(X,Y,Z,DX,DY,DZ,DDX,DDY,DDZ,RX,RY,RZ,DRX,DRY,DRZ,DDRX,DDRY,DDRZ,L,DT)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    25-Oct-2021 21:46:20

t2 = cos(ry);
t3 = cos(rz);
t4 = sin(ry);
t5 = sin(rz);
hj_s3 = reshape([1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-L.*t3.*t4,-L.*t4.*t5,-L.*t2,-L.*t2.*t5,L.*t2.*t3,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[3,18]);
