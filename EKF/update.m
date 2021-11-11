
function [xhat, P] = update(xhat, P, y, R, H, z)
    %global outliers;
   
    residual = z - y;
   
    %residual covariance 
    S = H*P*H' + R;
    
    %outlier rejection
%     temp = 3*sqrt(diag(S)); %if measurement residual is worse than 3 sigma, set residual to 0 and rely on predicted state only 
%     
%     if ((abs(residual(1)) > temp(1)) || (abs(residual(2))>temp(2)) || (abs(residual(3))>temp(3)))
%         residual(1) = 0;
%         residual(2) = 0;
%         residual(3) = 0;
% %         outliers = outliers + 1; 
%     end
%     
    %Kalman gain
    K = P*H'*S^-1;
    
    %Correction
    xhat = xhat + K*residual;
    
    %update state covariance
    P = (eye(size(K*H)) - K*H)*P;
end
