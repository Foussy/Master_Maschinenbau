% Pendelwagen als Beispiel für ein DAE
% Lösungsvariante 1: ein "langer Zustandsvektor"

% Innerhalb der Funktion Zp=G(t,Z) müssen wir 
% die Beschleunigungen und die Zwangskräfte
% aus einem linearen Gleichungssystem berechnen.
% Dieses besteht aus den 5 DGLn und den zweiten Ableitungen 6'', 7'', 8''
% der 3 Geschlossenheitsbedingungen.

% Problem: Die Geschlossenheitsbedingungen selbst und ihre ersten 
% Ableitungen gehen nicht ein (werden nicht benutzt). Deshalb
% entsteht das "Driftproblem".

% Außerdem müssen die Anfangsbedingungen "konstistent" sein!
% D.h. sie müssen die Geschlossenheitsbedingungen und die ersten
% Ableitungen am Anfang erfüllen!

clc, clear, clf 

global m1 br h b 
global m2 L2 J2 beta 
global r0 gr
global F10y F12x F12y

% Daten Wagen:
m1=30;
br=1;
h=0.3;
b=1.0;

% Daten Stange:
m2=5;
L2=1.5;
J2=(1/12)*m2*L2^2;
beta=0.1;

% Sonstige Daten:
r0=0.1;  % Radradius
gr=9.81; 

% Anfangswerte "konsistent" mit Nebendedingungen vorgeben:

x1=0;
y1=2*r0+h/2;
phi2=80*pi/180;
x2=x1+0.5*L2*cos(phi2);
y2=y1+0.5*L2*sin(phi2);

x1p=1.05;
y1p=0;
phi2p=10;

x2p=x1p-0.5*L2*sin(phi2)*phi2p;
y2p=y1p+0.5*L2*cos(phi2)*phi2p;
shg


tmax=100;
tspan=[0:tmax/1000:tmax];

Z0=[x1
    y1
    x2
    y2
    phi2
    x1p
    y1p
    x2p
    y2p
    phi2p];

options=odeset('RelTol',1e-6,'AbsTol',1e-6);

[tWerte,ZWerte]=ode45('G',tspan,Z0,options);

yTexte=char('x1','y1','x2','y2','phi2');

for n=1:5
    subplot(5,2,2*n-1)
    plot(tWerte,ZWerte(:,n),'b-')
end

for n=1:length(tWerte)
    t=tWerte(n);
    Z=ZWerte(n,:);
    x1=Z(1); y1=Z(2); x2=Z(3); y2=Z(4); phi2=Z(5);
    subplot(1,2,2)
    pWagen(t,x1,y1,x2,y2,phi2);
end