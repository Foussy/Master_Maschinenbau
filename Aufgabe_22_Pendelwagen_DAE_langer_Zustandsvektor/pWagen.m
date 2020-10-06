function pWagen(t,x1,y1,x2,y2,phi2)

global br h L2 r0 

% Hilfsgrößen:
L=2;

Wagen=[x1-0.5*br x1-0.5*br x1+0.5*br x1+0.5*br
       y1+0.5*h  y1-0.5*h  y1-0.5*h  y1+0.5*h ];
   
fill(Wagen(1,:),Wagen(2,:),'c')

alpha=0:2*pi/20:2*pi;
Rad1=[x1-(0.5*br-r0)+r0*cos(alpha);
      y1-(0.5*h+r0)+r0*sin(alpha) ];
  
Rad2=[x1+(0.5*br-r0)+r0*cos(alpha);
      y1-(0.5*h+r0)+r0*sin(alpha) ];

hold on
fill(Rad1(1,:),Rad1(2,:),'g')
fill(Rad2(1,:),Rad2(2,:),'g')

psi=-x1/r0;  
Ventil1=[x1-(0.5*br-r0) x1-(0.5*br-r0)+0.8*r0*cos(psi);
         y1-(0.5*h+r0)  y1-(0.5*h+r0)+0.8*r0*sin(psi) ];

Ventil2=[x1+(0.5*br-r0) x1+(0.5*br-r0)+0.8*r0*cos(psi);
         y1-(0.5*h+r0)  y1-(0.5*h+r0)+0.8*r0*sin(psi) ];

plot(Ventil1(1,:),Ventil1(2,:),'r-')
plot(Ventil2(1,:),Ventil2(2,:),'r-')

plot([-L L],[0 0],'k-')

% Gelenkpunkt eintragen:
plot(x1,y1,'ro')

Stange=[x2-0.5*L2*cos(phi2) x2+0.5*L2*cos(phi2);
        y2-0.5*L2*sin(phi2) y2+0.5*L2*sin(phi2)];
    
plot(Stange(1,:),Stange(2,:),'b-','LineWidth',2)

axis equal
axis([-L L -L L])
hold off

title(num2str(t,4))

drawnow

     