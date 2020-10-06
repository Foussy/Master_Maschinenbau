% Homogene Koordinaten - Direkten Kinematik
% 3-armiger, 2d-Roboter
% Sollkoordinaten xsoll, ysoll und WInkel phisoll
% des 

clc, clear, clf, shg

global L1 L2 L3 r1 r2 r3 b h
global K1Arm1 K2Arm2 K3Arm3
global Bahn
global xsoll ysoll phisoll

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


% Die Soll-Grössen aus einer Soll-Bahn berechnen und vergeben :

T=10;
w=2*pi/T;

Bahn=[];
% Bahnmittelpunkt und Radius :
R = 0.75;
xm = 1.0;
ym = 1.0;
XStart=[70
        10  
       -15]*pi/180;
   
for t=0:T/100:T*1
    xsoll=ym+R*cos(w*t);
    ysoll=ym+R*sin(4*w*t);
    phisoll=45*pi/180;
    
    % Die Servowinkel mit Nsolve ausrechnen :
    X=Nsolve('H',XStart);
    XStart = X;
   
    % Winkel aus X entnehmen :
    phi1=X(1);
    phi2=X(2);
    phi3=X(3);
    
    % Roboter zeichnen :
    plot(xsoll,ysoll,'ro')
    PlotRob(phi1,phi2,phi3)
end 













