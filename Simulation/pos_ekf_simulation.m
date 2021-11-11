init_ekf_simulation;
index = 1;
%% EKF USING GPS SENSORS 
for t = 0:0.1:10
   
    %predict step 
    xhat = predict   (xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);
    F    = predict_j (xhat(1), xhat(2), xhat(3), xhat(4), xhat(5), xhat(6), xhat(7), xhat(8), xhat(9), xhat(10), xhat(11), xhat(12), xhat(13), xhat(14), xhat(15), xhat(16), xhat(17), xhat(18), L, dT);
    
    %process noise look at Liam/Zubair thesis again to make sure!
    noise = [dT^2*sigmaq_ddx^2;  dT^2*sigmaq_ddy^2;  dT^2*sigmaq_ddz^2;...
             dT*sigmaq_ddx^2;    dT*sigmaq_ddy^2;    dT*sigmaq_ddz^2;...
             sigmaq_ddx^2;       sigmaq_ddy^2;       sigmaq_ddz^2;...
             dT^2*sigmaq_drx^2;  dT^2*sigmaq_dry^2;  dT^2*sigmaq_drz^2;...
             dT*sigmaq_drx^2;    dT*sigmaq_dry^2;    dT*sigmaq_drz^2;...
             sigmaq_drx^2;       sigmaq_dry^2;       sigmaq_drz^2];
         
    Q = diag(noise);
    
    %predict 
    P = F*P*F' + Q;
    
    %store predictions
    kinematic.pred_states = [kinematic.pred_states, xhat]; 
    kinematic.F = cat(3, kinematic.F, F);
    kinematic.pred_P = cat(3, kinematic.pred_P, P); 
   
    %update 
    %correct using sensor 1
    [y, H]      = state2measurement(s1, xhat, L, dT);
    [z, R]      = dataset2measurement_sim(s1, index);    
    [xhat, P]   = update(xhat, P, y, R, H, z);  
     
    %correct using sensor 2
    [y, H]      = state2measurement(s2, xhat, L, dT);
    [z, R]      = dataset2measurement_sim(s2, index);
    [xhat, P]   = update(xhat, P, y, R, H, z);
%      
    %correct using sensor 3
    [y, H]      = state2measurement(s3, xhat, L, dT);
    [z, R]      = dataset2measurement_sim(s3, index);
    [xhat, P]   = update(xhat, P, y, R, H, z);

    %store data
    kinematic.state          = [kinematic.state, xhat];
    kinematic.covariance     = cat(3, kinematic.covariance, P);
    kinematic.time           = [kinematic.time; t];
    
    index = index + 1;
end 