function Reste=H(X)

global r2 r3 r4 L delta s
global phi2 

phi3=X(1);
phi4=X(2);
Dx=X(3);
Dy=X(4);

R1=r2*cos(phi2)+r3*cos(phi3)-r4*cos(phi4)-s;
R2=r2*sin(phi2)+r3*sin(phi3)-r4*sin(phi4)-0;

R3=r2*cos(phi2)+r3*cos(phi3)+L*cos(phi3+pi-delta)-Dx;
R4=r2*sin(phi2)+r3*sin(phi3)+L*sin(phi3+pi-delta)-Dy;

Reste=[R1
       R2
       R3
       R4];
