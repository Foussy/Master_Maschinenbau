% Eine 3d-Graphik mit homogenen Koordinaten :
% Zylindrische Scheibe mit patch 
% S. 138: Stehpendel
clc, clear, clf, shg

% Daten :
r=1.0; bx=0.5; by=0.5; bz=2.0;
phimax=30*pi/180;
T=1;
w=2*pi/T;

% Körper-eigeine Punkte aufstellen :
N=36;
phi=linspace(pi,2*pi,N)';

KP1=[-bx/2             -by/2             bz            1
     -bx/2             -by/2             0             1
     r*cos(phi)   -(by/2)*ones(N,1)   r*sin(phi)     ones(N,1)
      bx/2             -by/2             0             1
      bx/2             -by/2             bz            1];
  
  
KP2=KP1;
KP2(:,2)=-KP2(:,2);
KP=[KP1
    KP2];
F1=[1:40
   41:80];

for t=0:T/50:T*3
phi=phimax*sin(w*t);
x=r*phi;
y=0;
z=r;

WTK=[cos(phi)  0  sin(phi)  x
        0      1     0      y
    -sin(phi)  0  cos(phi)  z
        0      0     0      1  ];

WP=(WTK*KP')';

cla % clear axis = lösche das innere des Koord.-Systems und alle in die Graphik-Karte übertragenen Patches

patch('vertices',WP(:,1:3), 'faces',F1,'Facecolor',[0.8,0.5,0.3])

% Jetzt die Fläschen der Virecke zeichnen :

F2=[1 40 80 41 % Zuerst 5 einzelne Fläschenn
  40 80 79 39
   1  2 42 41
  39 38 78 79
   3  2 42 43
  (3:37)'  (4:38)' (44:78)' (43:77)']; % dann die vielen schmalen Fläschen um den Halbzylinder herum

patch('vertices',WP(:,1:3), 'faces',F2,'Facecolor',[0.8,0.5,0.3])

box on
axis equal
rotate3d on
view([-30,20])
axis([-1.8 1.8 -1.8 1.8 0 3.5]) % coord (-x x -y y -z z)
drawnow

end




