%Aufgabe 7: Normalverteilung
%Befehle aus Statistik und fur Listen
%Skript S.134

clc, clear, clf, shg
%clear command window, clear all Variables
%clear figure, show graphic,

% a) 10 000 normalverteile Zufallszahlen
% erzeugen und plotten:
s=2; %sigma
m=-3; %mean-Wert

N=1e5;
Z=s*randn(N,1)+m;

subplot(2,1,1)
plot(1:N,Z,'r.')
xlabel('Nummer n')
ylabel('Zufallszahl')

% Aus dem Datensatz Z die empirische
% Standardabweichnung s un den Mittelwert m
% schatzen :
s=std(Z)
m=mean(Z)

% Als Linien markieren :
hold on 
plot ([1 N],[m m],'b-') % Mittelwert Linie

Farben=char('g','y','m','c','k','b');
NSigmaP=[];

for k=1:6
    y=m+k*s;
    plot([1 N],[y y],[Farben(k) '-'])
    
    y=m-k*s;
    plot([1 N],[y y],[Farben(k) '-'])
    
    p=sum((m-k*s<Z).*(Z<m+k*s))/N;
    
    NSigmaP=[NSigmaP
            k p*100];
end

NSigmaP

% EIn Histogramm :

subplot(2,2,3)
hist(Z,50)
xlabel('z')
ylabel('abs. Haufigkeit')

subplot(2,2,4)
[ni,zi]=hist(Z,50);  % Intervallzentren und Haufigkeiten

plot(zi,ni/N,'ro')
dzi=zi(2)-zi(1);

z=min(zi):0.01:max(zi);
G=0.5*(dzi/sqrt(2*pi))*exp(-(z-m).^2/(2*s^2));
hold on
plot(z,G,'g')
