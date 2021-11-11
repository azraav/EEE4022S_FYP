%%
close all;
L = 0.5;
writerObj = VideoWriter('EKF');
writerObj.FrameRate = 30;
open(writerObj);

%% Positions
x     = out.groundTruth.signals.values(:,1);
y     = out.groundTruth.signals.values(:,2);
z     = out.groundTruth.signals.values(:,3);
phi   = out.groundTruth.signals.values(:,4);
theta = out.groundTruth.signals.values(:,5);
psi   = out.groundTruth.signals.values(:,6);

P_S1 = [x-L.*(cos(phi).*sin(psi)-cos(psi).*sin(phi).*sin(theta)), y+L.*(cos(phi).*cos(psi)+sin(phi).*sin(theta).*sin(psi)), z+L.*sin(phi).*cos(theta)];
P_S2 = [x+L.*(cos(phi).*sin(psi)-cos(psi).*sin(phi).*sin(theta)), y-L.*(cos(phi).*cos(psi)+sin(phi).*sin(theta).*sin(psi)), z-L.*sin(phi).*cos(theta)];
P_S3 = [x+L.*cos(theta).*cos(psi), y+L.*cos(theta).*sin(psi), z-L.*sin(theta)];

%% Create Figure Handles
figure()
axis([-1 12 -2 2 -2 2])
grid on;
hold on;

% Rods
r1 = line('Color', 'b', 'LineWidth', 1);
r2 = line('Color', 'm', 'LineWidth', 1);
r3 = line('Color', 'g', 'LineWidth', 1);

%sensors 
b1 = plot3(P_S1(1,1),P_S1(1,2),P_S1(1,3), 'o','MarkerFaceColor','red','MarkerSize',3);
b2 = plot3(P_S2(1,1),P_S2(1,2),P_S2(1,3), 'o','MarkerFaceColor','red','MarkerSize',3);
b3 = plot3(P_S3(1,1),P_S3(1,2),P_S3(1,3), 'o','MarkerFaceColor','red','MarkerSize',3);

% general plot setup
xlabel({'X Position (m)'},'FontSize',14,'FontName','AvantGarde');
ylabel({'Y Position (m)'},'FontSize',14,'FontName','AvantGarde');
zlabel({'Z Position (m)'},'FontSize',14,'FontName','AvantGarde');
    
title({'T-Link'},'FontWeight','bold','FontSize',20,...
    'FontName','AvantGarde');

view(-37.5,30)

%% Update the rod and masses in the plot in a loop
FigHandle = gcf;

for i = 1:length(x)
    %sensor1 
    set(r1, 'XData', [x(i), P_S1(i,1)]);
    set(r1, 'YData', [y(i), P_S1(i,2)]);
    set(r1, 'ZData', [z(i), P_S1(i,3)]);
    set(b1, 'XData', P_S1(i,1));
    set(b1, 'YData', P_S1(i,2));
    set(b1, 'ZData', P_S1(i,3));
    
    %sensor2
    set(r2, 'XData', [x(i), P_S2(i,1)]);
    set(r2, 'YData', [y(i), P_S2(i,2)]);
    set(r2, 'ZData', [z(i), P_S2(i,3)]);
    set(b2, 'XData', P_S2(i,1));
    set(b2, 'YData', P_S2(i,2));
    set(b2, 'ZData', P_S2(i,3));
    
    %sensor3
    set(r3, 'XData', [x(i), P_S3(i,1)]);
    set(r3, 'YData', [y(i), P_S3(i,2)]);
    set(r3, 'ZData', [z(i), P_S3(i,3)]);
    set(b3, 'XData', P_S3(i,1));
    set(b3, 'YData', P_S3(i,2));
    set(b3, 'ZData', P_S3(i,3));
    
    
    pause(0.05);  
    
    frame_no(i) = getframe(gcf) ;
    writeVideo(writerObj, frame_no(i));
    drawnow
    
    xlim('manual')
    ylim('manual')
    zlim('manual')
    view(-37.5,30)
end

% close the writer object
close(writerObj);
