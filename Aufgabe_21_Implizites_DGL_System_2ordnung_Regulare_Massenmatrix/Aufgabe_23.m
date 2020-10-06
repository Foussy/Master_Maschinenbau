% Aufgabe_23
clc,clear,clf,shg

global Ra ke km kd U
global m2 beta a L2 J1 J2 gr

% Daten
Ra=10; ke=0.1; km=2.0; kd=0.1; U=32;
m2=0.4; beta=0.1; a=0.6; L2=1.0;
J1=0.2; J2=0.03; gr=9.81;



%zeitspanne
tmax=10;
tspan=0:tmax/1000:tmax;


phi1=0; phi2=0;
phi1p=0; phi2p=0;

Z0=[phi1
    phi2
    phi1p
    phi2p];

% GSL-System als System 1. Ordnung lösen :

[tWerte,ZWerte]=ode45('G',tspan,Z0);
yTexte=char('phi1','phi2','phi1p','phi2p');
Platz=[1 2 4 5];
for n=1:4
    subplot(2,3,Platz(n))
    plot(tWerte,ZWerte(:,n),'b-')
    xlabel('t')
    ylabel(yTexte(n,:))
end
subplot(2,3,[3 6])
for n=1:length(tWerte)
    phi1=ZWerte(n,1);
    phi2=ZWerte(n,2);
    pMot(phi1,phi2)
end