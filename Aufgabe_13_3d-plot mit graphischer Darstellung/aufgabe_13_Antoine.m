% 3d-plot mit graphischer Darstellung
%des berechneten Volumens
clc,clear,clf,shg

% die Inline-Funktion:
G=@(x,y) 20+x.^2-2*x.*y+y.^2;

x=-3:0.05:3;
y=x;

[X,Y]=meshgrid(x,y);
Z=G(X,Y);

han=surfl(X,Y,Z);
set(han,'faceAlpha',0.7)
colormap(copper)
shading interp
rotate3d on
box on

%Integration
x1=-0.5;x2=-2.5;
y1=0.0;y2=-2.2;

I=integral2(G,x1,x2,y1,y2);

% Rechteck in xy-Ebene
hold on
X=[x1 x1 x2 x2];
Y=[y1 y2 y2 y1];
fill3(X,Y,[0 0 0 0],'r')

% Senkrechte Flächen
X=linspace(x1,x2,100);
Y=y1*ones(size(X));
Z=G(X,Y);
fill3([x1 X x2],[y1 Y y1],[0 Z 0],'g','FaceAlpha',0.5)

X=linspace(x1,x2,100);
Y=y2*ones(size(X));
Z=G(X,Y);
fill3([x1 X x2],[y2 Y y2],[0 Z 0],'g','FaceAlpha',0.5)

Y=linspace(y1,y2,100);
X=x1*ones(size(Y));
Z=G(X,Y);
fill3([x1 X x1],[y1 Y y2],[0 Z 0],'b','FaceAlpha',0.5)

Y=linspace(y1,y2,100);
X=x2*ones(size(Y));
Z=G(X,Y);
fill3([x2 X x2],[y1 Y y2],[0 Z 0],'b','FaceAlpha',0.5)

xPos=x1+0.9*(x2-x1);
yPos=0.5*(y2+y1);
text(xPos,yPos,10,['I = ',num2str(I)],'HorizontalAlignment', 'center')