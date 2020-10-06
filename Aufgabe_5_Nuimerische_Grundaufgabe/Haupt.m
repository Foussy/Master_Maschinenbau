% Ubung 2 : Numerische Grundaufgaben
% Skript S.133
%Funktion plotten, Animation

clc,clear,clf,shg

global p

% a) Animation: Wie ander p das aussehen
% der Funktionskurve ? 

for p=-1:0.01:1
    fplot(@f,[-3 3])
    ylim([-1 1])
    xlabel('x')
    ylabel('y')
    
    hold on
    
    % b) Nullstelle berechnen 
    xStart=0;
    x0=fzero('f',xStart);
    plot(x0,0,'ro')
    
    % c) Lokales Minimum & Maximum berechnen
    x1=fminbnd('f',-3,3);
    x2=fminbnd('f(x)',-3,3);
    plot([x1 x2],[f(x1) f(x2)],'sm')
    
    % d) Integrale berechnen
    I1=integral(@f,-3,x0)
    I2=integral(@f,x0,3)
    
    % Flachen einfarben :
    X=[-3 -3:(x0+3)/100:x0 x0];
    Y=[0 f(-3:(x0+3)/100:x0) 0];
    fill(X,Y,'y')
    
    X=[x0 x0:(3-x0)/100:3 3];
    Y=[0 f(x0:(3-x0)/100:3) 0];
    fill(X,Y,'c')

    text(x1,0.5*f(x1), num2str(I1))
    text(x2,0.5*f(x2), num2str(I2))

    drawnow
    hold off
end