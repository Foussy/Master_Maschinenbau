% Aufgabe 9: Interpolation methoden
% S135

clc, clear, clf, shg

% Zuerst die Funktion diff = Differenzen

% Daten fur einen Sinus :
xDat=-pi:0.01:pi;
yDat=sin(xDat);
dx=xDat(2)-xDat(1)

plot(xDat,yDat)
hold on

size(xDat)
sindiff=diff(yDat)/dx;
size(sindiff)

x1=(xDat(2:end)+xDat(1:end-1))/2
size(x1)
plot(x1,sindiff)

%==================================================%

Methode=char('nearest','linear','pchip','spline');
xDat=-pi:0.5:pi;
yDat=sin(xDat);
hold off
x0=xDat;
y0=yDat;


for m=1:4
    % Auf Daten interpolieren :
        xi=-pi:0.01:pi;
        yi=interp1(x0,y0,xi,Methode(m,:));
        x1=xi;
        y1=yi;
    for n=1:5
        subplot(5,4,4*(n-1)+m)   
        plot(x1,y1,'b-')
        xlim([-pi pi])
        if n==1,title(Methode(m,:)), end
    % Die interpolieren Daten ableiten:
    dx=xDat(2)-xDat(1);
    y1=diff(y1)/dx;
    x1=(x1(2:end)+x1(1:end-1))/2;
    end
end
