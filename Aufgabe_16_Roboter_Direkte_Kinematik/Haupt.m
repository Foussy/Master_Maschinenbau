% Homogene Koordinaten - Direkten Kinematik
% 3-armiger, 2d-Roboter
% Skript S.31
clc, clear, clf, shg

global L1 L2 L3 r1 r2 r3 b h
global K1Arm1 K2Arm2 K3Arm3
global Bahn

% Daten :
L1=1.50; L2=1.20; L3=0.90;
r1=0.20; r2=0.15; r3=0.10;
b =1.00; h =0.40;

% "Körper-eigeine Koordinaten der dei Roboterarme :
N=24; % Anzahl Punkte auf Halbkreisen (HK)
phi1= 0.5*pi:pi/(N-1):1.5*pi; % Winkelliste linker HK
phi2= 1.5*pi:pi/(N-1):2.5*pi;  % Winkelliste rechter HK

K1Arm1=[r1*cos(phi1)         L1+r1*cos(phi2)    % x
        r1*sin(phi1)          r1*sin(phi2)      % y
        ones(size(phi1))    ones(size(phi2)) ]; % w=1
    
K2Arm2=[r2*cos(phi1)         L2+r2*cos(phi2)    % x
        r2*sin(phi1)          r2*sin(phi2)      % y
        ones(size(phi1))    ones(size(phi2)) ]; % w=1

K3Arm3=[r3*cos(phi1)         L3+r3*cos(phi2)    % x
        r3*sin(phi1)          r3*sin(phi2)      % y
        ones(size(phi1))    ones(size(phi2)) ]; % w=1

% Alle Arme im eigenen K-System zeichnen :
figure(1)
subplot(3,2,1)
fill(K1Arm1(1,:),K1Arm1(2,:),'r')
title('Arm1 in K_1')
axis equal
axis([-0.4 2 -0.4 0.4])

subplot(3,2,3)
fill(K2Arm2(1,:),K2Arm2(2,:),'g')
title('Arm2 in K_2')
axis equal
axis([-0.4 2 -0.4 0.4])

subplot(3,2,5)
fill(K3Arm3(1,:),K3Arm3(2,:),'b')
title('Arm3 in K_3')
axis equal
axis([-0.4 2 -0.4 0.4])


% Drei Winkel vorgeben und den Roboter zeichnen :
T=10;
w1=2*pi/T;
w2=1.3*w1;
w3=-2.5*w1;
Bahn=[];

for t=0:T/100:T*3
    phi1=w1*t;
    phi2=w2*t;
    phi3=w3*t;
    
    PlotRob(phi1,phi2,phi3)
end 













