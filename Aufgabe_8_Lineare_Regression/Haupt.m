% Aufgabe 8: Lineare Regression
% S134/S135

clc, clear, clf, shg

% Daten :
m=[0.02 0.1 0.2 0.3 0.4 0.5];
T=[0.68 0.89 1.1 1.24 1.40 1.53];

plot(m,T,'ro')
xlabel('Masse m in kg')
ylabel('Schwingungsdauer T in s') %Durée de l'oscillation

ylim([0 max(T)+0.15])

%Daten linearisieren :
x=m;
y=T.^2;

N=length(x);
Nen=N*sum(x.^2)-sum(x)^2; %Dénominateur
Z1=N*sum(x.*y)-sum(x)*sum(y);
Z2=sum(x.^2)*sum(y)-sum(x)*sum(x.*y);

s=Z1/Nen;
b=Z2/Nen;

k=4*pi^2/s;
m0=b*k/(4*pi^2);

Kurve_m=linspace(0,max(m)+0.1,1000);
Kurve_T=2*pi*sqrt((Kurve_m+m0)/k);

hold on
plot(Kurve_m, Kurve_T,'b-')

xPos=min(m)+0.1*(max(m)-min(m));
yPos=min(T)+0.9*(max(T)-min(T));
Text=char(['k = ',num2str(k),' N/m'],['m_0 = ',num2str(m0),' kg'])

text(xPos,yPos,Text)