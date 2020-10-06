% Aufgabe 20
 clc, clear, clf, shg
% S.139
 
 global r2 r3 r4 L delta s
 global phi2 Kurve
 %daten:
 Kurve=[];
 r2=0.8;
 r3=1.5;
 r4=2.6;
 L=2.0;
 
 s=3;
 delta=130*pi/180;
 
 phi2p=1;
 
 % Die Funktion H 

 XStart=[80*pi/180
         140*pi/180
         1.0
         2.0];
    

 
 % Die kinetostatiche grundaufgabe
 
 yTexte=char('phi3','phi4','Dx','Dy');
 XListe=[];
 phi2Liste=[0:pi/50:2*pi];
 XpListe=[];
 
 
 for phi2=phi2Liste
     X=Nsolve('H',XStart);
     XStart=X;
     XListe=[XListe X];
     
     phi3=X(1);
     phi4=X(2);
     Dx=X(3);
     Dy=X(4);
     
     
     % Geschwindigkeiten aus linearem GL.-System berechnen :
     J=JacNum('H',X);
     
     J2=[-r3*sin(phi3)                         r4*sin(phi4)   0    0
          r3*cos(phi3)                        -r4*cos(phi4)   0    0
         -r3*sin(phi3)-L*sin(phi3+pi-delta)          0       -1    0
          r3*cos(phi3)+L*cos(phi3+pi-delta)          0        0   -1];
     
     round(J-J2,8);
     
     b=-[-r2*sin(phi2)
         r2*cos(phi2)
         -r2*sin(phi2)
         r2*cos(phi2)]*phi2p;
     
     Xp=J\b;
     XpListe=[XpListe Xp];
     
 end
 
   
 for n=1:4
     subplot(4,3,3*(n-1)+2)
     plot(phi2Liste,XListe(n,:),'r.')
     hold on
     xlabel('phi2')
     ylabel(yTexte(n,:))
     xlim([0 2*pi])
     
     subplot(4,3,3*(n-1)+3)
     plot(phi2Liste,XpListe(n,:),'r.')
     hold on
     xlabel('phi2')
     ylabel([strtrim(yTexte(n,:)),'pp'])
     xlim([0 2*pi])
 end

  
 %Animation :
 for n=1:length(phi2Liste)
     phi2=phi2Liste(n);
     X=XListe(:,n);
     pGetr(X)
     drawnow
 end
 
 
figure(2)
dphi2=phi2Liste(2)-phi2Liste(1);
dt=dphi2/phi2p;
XppListe=(XpListe(:,2:end)-XpListe(:,1:end-1))/dt;
phi2Listem=0.5*(phi2Liste(2:end)+phi2Liste(1:end-1));
 
  for n=1:4
     subplot(4,3,3*(n-1)+1)
     plot(phi2Listem,XppListe(n,:),'r.')
     hold on
     xlabel('phi2')
     ylabel([strtrim(yTexte(n,:)),'pp'])
     xlim([0 2*pi])
  end
