function R = rotationMatrix(phi, th, psi)

%R Rotation matrix
%returns the rotation matrix of Euler 321 zyx

roll = [[1          0           0       ];...
        [0          cos(phi)   -sin(phi)];...
        [0          sin(phi)    cos(phi)]];
pitch = [[cos(th)    0           sin(th) ];...
        [0          1           0       ];...
        [-sin(th)   0           cos(th)]];
yaw  = [[cos(psi)   -sin(psi)   0       ];...
        [sin(psi)   cos(psi)    0       ];...
        [0          0           1       ]];

roll = roll.';
pitch = pitch.';
yaw = yaw.';
eulerOrder = 'rpy';

switch eulerOrder
    case 'rpy'
        R = roll * pitch * yaw;
    case 'rpr'
        R = roll * pitch * roll;
    case 'ryp'
        R = roll * yaw * pitch;
    case 'ryr'
        R = roll * yaw * roll;
    case 'pyr'
        R = pitch * yaw * roll;
    case 'pyp'
        R = pitch * yaw * pitch;
    case 'pry'
        R = pitch * roll * yaw;
    case 'prp'
        R = pitch * roll * pitch;
    case 'yrp'
        R = yaw * roll * pitch;
    case 'yry'
        R = yaw * roll * yaw;
    case 'ypr'
        R = yaw * pitch * roll;
    case 'ypy'
        R = yaw * pitch * yaw;
    otherwise
        warning('Unexpected Euler order. Switch to roll-pitch-yaw')
        R = roll * pitch * yaw;
end
    R = R.';
    
end