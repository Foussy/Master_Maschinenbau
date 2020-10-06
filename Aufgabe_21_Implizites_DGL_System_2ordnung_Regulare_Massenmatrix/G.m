function Zp=G(t,Z)

global Ra ke km kd U
global m2 beta a L2 J1 J2 gr

phi1=Z(1);
phi2=Z(2);
phi1p=Z(3);
phi2p=Z(4);

ia=(U-ke*phi1p)/Ra;
Man=km*ia-kd*phi1p;

% Merke : Wenn man, wie hier, die Koordinaten (phi1 und phi2) und
% Geschwindigkeiten(phi1p und phi2p) gegeben hat, ist das DGL-System. 2
% Ordnung ein lineares GL-System zur Berechnung der Beschleunigungen, die
% man für Zp braucht !

M=[J1+m2*a^2                      m2*a*0.5*L2*cos(phi1-phi2)
   m2*a*0.5*L2*cos(phi1-phi2)     J2+0.25*m2*L2^2            ];

Mzf1=-m2*a*0.5*L2*sin(phi1-phi2)*phi2p^2;
MG1=-m2*gr*a*cos(phi1);
MR1=-beta*(phi1p-phi2p);

Mzf2=-m2*a*0.5*L2*sin(phi1-phi2)*phi1p^2;
MG2=-m2*gr*0.5*L2*cos(phi2);
MR2=-beta*(phi2p-phi1p);

F=[Mzf1+MG1+MR1+Man
    Mzf2+MG2+MR2   ];

Xpp=M\F;

phi1pp=Xpp(1);
phi2pp=Xpp(2);

Zp=[phi1p
    phi2p
    phi1pp
    phi2pp];

