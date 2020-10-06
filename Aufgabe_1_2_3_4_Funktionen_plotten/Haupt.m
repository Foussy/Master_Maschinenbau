%Aufgab 1 : Funktionen plotten
%Skript S.132

clc, clear, clf, shg
%clear command window, clear all Variables
%clear figure, show graphic,
global a % Parameter global

figure (1)
x=-3:0.001:3; %6001 -Wert erzeugen
y1=cosh(x); %y-Werte in Listenverarbeit
y2=tanh(x);
y3=sin(x+x.^2);
   
    %Merke : fur Listernverarbaitung setzte man
%einen Punkt for *,/ und ^, also
%.*, ./ und .^

subplot(2,2,1)
plot (x,y1,'r-')
xlabel('x')
ylabel('y')
title('cosh')

subplot(2,2,2)
plot (x,y2,'g:','LineWidth',3)
xlabel('x')
ylabel('y')
title('tanh')

subplot(2,2,3)
plot (x,y3,'m-.')
xlabel('x')
ylabel('y')
title('sin(x+x.^2)')

% In das vier Diagramm drei Kurven einzeichnen :

for a=[0.5 1 3]
y4=f(x);
subplot (2,2,4)
plot(x,y4)
hold on
end 
hold off
xlabel('x')
ylabel('y')
title('Mehrfachplot')
legend('a=0.5','a=1','a= 3','location','best')


% ==========================================================

figure(2)

% Daten:
R=4700;
C=2.2E-6;
f=logspace(log10(1),log10(1000),100);
omega=2*pi*f;

eta=1./(1+j*omega*R*C);
a=abs(eta);
phi=angle(eta)*180/pi;

subplot(2,1,1)
loglog(f,a,'r-') %doppellogarithmisch
xlabel('f in Hz')
ylabel('a(f)')
title('Frequency Amplitude')

subplot(2,1,2)
semilogx(f,phi,'g-') %halblogarithmisch
xlabel('f in Hz')
ylabel('phi(f)')
title('Phase')