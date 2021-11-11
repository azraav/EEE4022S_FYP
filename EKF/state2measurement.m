function [y, H]  = state2measurement(sensor, xhat, L, dT)
%states = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz];
%vars = [x, y, z, dx, dy, dz, ddx, ddy, ddz, rx, ry, rz, drx, dry, drz, ddrx, ddry, ddrz, L, dt];

%s is sensor number 
if     (sensor == 1)
    y = update_hs1 (xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);
    H = update_hjs1(xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);

elseif (sensor == 2)
    y = update_hs2 (xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);
    H = update_hjs2(xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);       
else
    y = update_hs3 (xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);
    H = update_hjs3(xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);      
end
    
end