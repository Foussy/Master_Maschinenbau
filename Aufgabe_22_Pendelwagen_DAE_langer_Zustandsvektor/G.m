function Zp=G(t,Z)

global m1 br h b 
global m2 L2 J2 beta 
global r0 gr
global F10y F12x F12y

x1=Z(1); y1=Z(2); x2=Z(3); y2=Z(4); phi2=Z(5);
xp1=Z(6); yp1=Z(7); xp2=Z(8); yp2=Z(9); phi2p=Z(10);

Ls=0.5*L2*sin(phi2);
Lc=0.5*L2*cos(phi2);

%   x1pp   y1pp   x2pp   y2pp   phi2pp   F10y   F12x   F12y
A=[-m1       0      0      0       0      0      1      0
    0       -m1     0      0       0      1      0      1
    0        0     -m2     0       0      0     -1      0
    0        0      0     -m2      0      0      0     -1
    0        0      0      0      -J2     0     -Ls     Lc
    0        1      0      0       0      0      0      0
   -1        0      1      0       Ls     0      0      0
    0       -1      0      1      -Lc     0      0      0];

c=[b*xp1
   m1*gr
   0
   m2*gr
   beta*phi2p
   0
   -Lc*phi2p^2
   -Ls*phi2p^2];

XppF=A\c;

x1pp=XppF(1);
y1pp=XppF(2);
x2pp=XppF(3);
y2pp=XppF(4);
phi2pp=XppF(5);

F10y=XppF(6);
F12x=XppF(7);
F12y=XppF(8);

Zp=[xp1
    yp1
    xp2
    yp2
    phi2p
    x1pp
    y1pp
    x2pp
    y2pp
    phi2pp];