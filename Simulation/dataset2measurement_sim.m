function [z, R]  = dataset2measurement_sim(sensor, index)
%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz];
%vars = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz, L, dt];
global meas 
%s is sensor number 
if (sensor == 1)
    z = [meas.sensor1(index,1); meas.sensor1(index,2); meas.sensor1(index,3)];
    meas_noise = [0.01^2; 0.01^2; 0.01^2];
    R = diag(meas_noise);
        
elseif (sensor == 2)
    z = [meas.sensor2(index,1); meas.sensor2(index,2); meas.sensor2(index,3)];
    meas_noise = [0.01^2; 0.01^2; 0.01^2];
    R = diag(meas_noise);

else
    z = [meas.sensor3(index,1); meas.sensor3(index,2); meas.sensor3(index,3)];
    meas_noise = [0.01^2; 0.01^2; 0.01^2];
    R = diag(meas_noise);
end
    
end