%%
close all;
L = 0.5;
writerObj = VideoWriter('EKF');
writerObj.FrameRate = 30;
open(writerObj);
dt=0.1
%% Positions
x     = xSmooth(1,470:1000)';
y     = xSmooth(2,470:1000)';
z     = xSmooth(3,470:1000)';
phi   = xSmooth(10,470:1000)';
theta = xSmooth(11,470:1000)';
psi   = xSmooth(12,470:1000)';
n = length(x);

P_S1 = [x-L.*(cos(phi).*sin(psi)-cos(psi).*sin(phi).*sin(theta)), y+L.*(cos(phi).*cos(psi)+sin(phi).*sin(theta).*sin(psi)), z+L.*sin(phi).*cos(theta)];
P_S2 = [x+L.*(cos(phi).*sin(psi)-cos(psi).*sin(phi).*sin(theta)), y-L.*(cos(phi).*cos(psi)+sin(phi).*sin(theta).*sin(psi)), z-L.*sin(phi).*cos(theta)];
P_S3 = [x+L.*cos(theta).*cos(psi), y+L.*cos(theta).*sin(psi), z-L.*sin(theta)];

%% Create Figure Handles
figure()
axis([0 4 4 9 0 1])
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
xlabel({'X Position (m)'},'FontSize',10,'FontName','AvantGarde');
ylabel({'Y Position (m)'},'FontSize',10,'FontName','AvantGarde');
zlabel({'Z Position (m)'},'FontSize',10,'FontName','AvantGarde');
    
title({'T-Link'},'FontWeight','bold','FontSize',12,...
    'FontName','AvantGarde');

 view(-37.5,30)

%% Update the rod and masses in the plot in a loop
FigHandle = gcf;

for i = 1:n
    title('T-Link','FontWeight','bold','FontSize',12,'FontName','AvantGarde');
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
    
    
    
   % pause(0.2);  
    
    frame_no(i) = getframe(gcf);
    writeVideo(writerObj, frame_no(i));
    
    drawnow
    
    xlim('manual')
    ylim('manual')
    zlim('manual')
    view(-37.5,30)
end

% close the writer object
close(writerObj);