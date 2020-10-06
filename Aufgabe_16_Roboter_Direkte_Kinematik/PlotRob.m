function PlotRob(phi1,phi2,phi3)

global L1 L2 L3 r1 r2 r3 b h
global K1Arm1 K2Arm2 K3Arm3
global Bahn

% Transformationsmatrizen aufstellen :
WTK1=[cos(phi1) -sin(phi1)    0
      sin(phi1)  cos(phi1)    0
          0          0        1   ];
      
K1TK2=[cos(phi2) -sin(phi2)    L1
       sin(phi2)  cos(phi2)    0
           0          0        1   ];
       
K2TK3=[cos(phi3) -sin(phi3)    L2
       sin(phi3)  cos(phi3)    0
           0          0        1   ];
       
% Transformieren :
WArm1=WTK1*K1Arm1;
WArm2=WTK1*K1TK2*K2Arm2;
WArm3=WTK1*K1TK2*K2TK3*K3Arm3;

% Dern Werkzeugflasch "Tool Center Point" nach W transformieren :
K3TCP=[L3   % x
        0   % y
        1]; % w
    
WTCP=WTK1*K1TK2*K2TK3*K3TCP;

Bahn=[Bahn WTCP(1:2)];


% Alles zeichnen :
subplot(1,2,2)
plot(Bahn(1,:),Bahn(2,:),'k-')
hold on


Basis=[0 -b/2  b/2
       0   -h   h   ];

fill(Basis(1,:),Basis(2,:),'y')
axis equal
axis([-4 4 -4 4])

fill(WArm1(1,:),WArm1(2,:),'r')
fill(WArm2(1,:),WArm2(2,:),'g')
fill(WArm3(1,:),WArm3(2,:),'b')

hold off
drawnow