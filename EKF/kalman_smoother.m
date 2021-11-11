%% kalman smoother 
% This script will run the backward smoothing on the EKF estimates.
% It assumes that 'pos_ekf.m' has been run.

%% Backward recursion
xSmooth = kinematic.state;
xEst    = xSmooth;

PSmooth = kinematic.covariance;
Pcov = PSmooth;

xPred   = kinematic.pred_states; 
Ppred   = kinematic.pred_P;
F_j     = kinematic.F;

N = size(kinematic.state(1,:));
N = N(2);
% 
for j = N-1:-1:1  
    % Calculate Smoothing Gain
    A = Pcov(:,:,j)*F_j(:,:,j)'/(Ppred(:,:,j+1));
  
    % Smoothing
    xSmooth(:,j) = xEst(:,j) + A*(xSmooth(:,j+1) - xPred(:,j+1));
    
    % Smoothed Covariance
    PSmooth(:,:,j) = Pcov(:,:,j) + A*(PSmooth(:,:,j+1) - Ppred(:,:,j+1))*A';
end