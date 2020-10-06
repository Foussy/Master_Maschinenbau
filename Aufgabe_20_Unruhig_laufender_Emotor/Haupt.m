% Aufgabe 8: Unregelmäßig laufender E-Motor
% DGL-System

clc, clear, clf, shg

global Ra La R U km kd ke Ja Jr Fmax

% Daten:
Ra = 50;        km = 10;
La = 4.0;       kd = 2;
R = 0.3;        ke = 20;
U = 220;        Ja = 0.3;
Jr = 10;        Fmax = 670;

% Zeitspanne:
tspan = [0 20];

% Anfangswerte:
Z0 = [0     % ia
      0     % phi
      0];   % phip
  
% DGL-System lösen:
[tWerte, ZWerte]=ode45('G', tspan, Z0);

subplot(2,2,1)
plot(tWerte, ZWerte(:,1), 'b-')

subplot(2,2,2)
plot(tWerte, ZWerte(:,2), 'b-')

subplot(2,2,3)
plot(tWerte, ZWerte(:,3), 'b-')