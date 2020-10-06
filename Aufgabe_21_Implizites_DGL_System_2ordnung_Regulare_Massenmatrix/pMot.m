function pMot(phi1,phi2)

global a L2
R1=1.2*a;
Br=2.4*R1;

b=0.1*L2;

Mot=[-Br -Br  Br  Br
    -Br  Br  Br -Br];

subplot(2,3,[3 6])
fill(Mot(1,:),Mot(2,:),'c')
hold on

beta=phi1+(0:pi/20:2*pi);
Rad=[R1*cos(beta)
    R1*sin(beta)];

fill(Rad(1,:),Rad(2,:),'r')

KSt=[0  0  L2  L2
     b -b -b   b
     1  1  1   1  ];
 
WTK=[cos(phi2)  -sin(phi2)   a*cos(phi1)
     sin(phi2)  cos(phi2)   a*sin(phi1)
        0           0            1     ];
WSt=WTK*KSt;

fill(WSt(1,:),WSt(2,:),'g')

hold off
axis equal
Lges=1.2*(a+L2);
axis([-Lges Lges -Lges Lges])
drawnow