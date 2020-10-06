% Aufgabe 11 : Komplexes lineares Gleichungssystem : 
% Wechselstromschaltung in komplexer
% Widerstandsrechnung
% S. 136
clc, clear
% Daten :
C1 = 220e-6;
C2 = 220e-6;
L = 50e-3;
R1 = 2.0;
RL = 100;
u0 = 300;

fListe = logspace(log10(0.010),log10(1000),10000);
aListe = [];
phiListe = [];

for f=fListe
    w = 2*pi*f;
    ZC1 = -j/(w*C1);
    ZC2 = -j/(w*C2);
    ZL = j*w*L ;
    
    %    i1     i2     i3
    A=[   1     -1     -1
        ZC1    ZL+R1      0
        0    -(ZL+R1)   (ZC2+RL)];
    
    b=[0
        u0
        0];
    
    I=A\b;
    
    i3=I(3);
    
    a=abs(i3);
    phi=angle(i3);
    
    aListe=[aListe a];
    phiListe=[phiListe phi];
    
end

subplot(2,1,1)
loglog(fListe,aListe,'b-')
title('Amplitudfrequenzgang')
xlabel('f in Hz')
ylabel('Phasenwinkel arg(i3)')

subplot(2,1,2)
semilogx(fListe,phiListe,'b-')
title('Phasenfrequenzgang')
xlabel('f in Hz')
ylabel('Phasenwinkel arg(i3)')