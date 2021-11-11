function [z, R]  = dataset2measurement(sensor, index)
%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz];
%vars = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz, L, dt];
global meas 
%s is sensor number 
if (sensor == 1)
    z = [meas.sensor1(index,2); meas.sensor1(index,3); meas.sensor1(index,4)];
    R = [meas.sensor1(index,5)^2 meas.sensor1(index,8)^2 meas.sensor1(index,10)^2; meas.sensor1(index,8)^2 meas.sensor1(index,6)^2 meas.sensor1(index,9)^2; meas.sensor1(index,10)^2 meas.sensor1(index,9)^2 (1*meas.sensor1(index,7))^2];
        
elseif (sensor == 2)
    z = [meas.sensor2(index,2); meas.sensor2(index,3); meas.sensor2(index,4)];
    R = [meas.sensor2(index,5)^2 meas.sensor2(index,8)^2 meas.sensor2(index,10)^2; meas.sensor2(index,8)^2 meas.sensor2(index,6)^2 meas.sensor2(index,9)^2; meas.sensor2(index,10)^2 meas.sensor2(index,9)^2 (1*meas.sensor2(index,7))^2];


else
    z = [meas.sensor3(index,2); meas.sensor3(index,3); meas.sensor3(index,4)];
    R = [meas.sensor3(index,5)^2 meas.sensor3(index,8)^2 meas.sensor3(index,10)^2; meas.sensor3(index,8)^2 meas.sensor3(index,6)^2 meas.sensor3(index,9)^2; meas.sensor3(index,10)^2 meas.sensor3(index,9)^2 (1*meas.sensor3(index,7))^2];

end
    
end