%%Aufgabe 6b: Numerische Integration Spez Waerme
% am Beispiel des Debye-Modells des
% Temperaturverlaufes der spezifischen
%Warme

clc, clear, clf, shg

% Daten :
R = 8.314; % Gaskonstante
Theta = 345 % Debye-Temp- von Cu
cV293 = 23.63 % J/(K*mol)

% Fur jede Temp. das Integral numerisch losen :
T=1:1:400;
cV=zeros(size(T));

% Den Integranden als inline-function definieren
Integ = @(x) x.^4.*exp(x)./(exp(x)-1).^2;

for n=1:length(T)
    cV(n)=9*R*(T(n)/Theta)^3*integral(Integ,0,Theta/T(n));
end

plot(T,cV,'b-')
title('Spez. Warme von Cu nach Debye')
xlabel('T in K')
ylabel('c_V in J/(K*mol)')
hold on
plot(293,cV293,'ro')
text(293,cV293,'  Lit.-Wert')