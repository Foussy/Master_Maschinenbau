    % Aufgabe 15 : Ein Mechanismus
    % Kinetostatische Aufgabe
clc, clear, clf, shg

global r2 r3 r4 L delta s
global phi2

% Daten :
r2=1.0;
r3=1.5;
r4=2.0;
L = 2.0;
s=3;
delta=130*pi/180;

phi2=0;

XStart=[80*pi/180
        140*pi/180
        1.0
        2.0];
    

    
    %Die kinetostatische Grundaufgabe :
yTexte=char('phi3','phi4','Dx','Dy');
for phi2=0:pi/100:2*pi
X=Nsolve('H',XStart);

phi3=X(1);
phi4=X(2);
Dx=X(3);
Dy=X(4);

    for n=1:4
        subplot (4,2,2*n)
        plot(phi2,X(n),'ro')
        hold on
            if phi2==0
                xlabel('phi2')
                ylabel(yTexte(n,:))
            end
    end
    pGetr(X)
    drawnow
end