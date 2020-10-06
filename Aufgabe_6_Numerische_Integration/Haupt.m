%Aufgabe 6: Numerische Integration
%Skript S.133

clc, clear, clf, shg
%clear command window, clear all Variables
%clear figure, show graphic,

%Die Stammfunktion zur Gauss-schen
%Normalverteilung durch punktwieses
%numerisches Integrieren bilden und plotten;

% Inline-Funktion im Hauptprogramm verwerden :

%Integrand als inline-funktion :
g=@(t) exp(-0.5*t.^2);

g(2.3)

subplot(1,2,1)
fplot(g,[-5 5]) % Hier das @ weglassen !
title('Gauss-Funktion')
xlabel('t')
ylabel('y')

% Die Funktionswerte von F(x)
% einzeiln ausrechnen :
xListe=-5:0.01:5;
FListe=zeros(size(xListe));

for n=1:length(xListe)
    x=xListe(n)
    y=integral(g,-inf,x)/sqrt(2*pi)
    FListe(n)=y;
end

subplot (1,2,2)
plot(xListe,FListe,'r-')
title('Stammfunktion')
xlabel('x')
ylabel('y')