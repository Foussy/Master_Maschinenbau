% Ubung : 2fach-Integral und 3D-Plot
clc, clear, clf, shg

% Eine Inline-Funktion, die ine Gauss-Glocke liefert :

G =@(x,y) exp(-x.^2-y.^2);

G(1,2)

% 3D-Plot:
x=-3:0.25:3;
y=x;

[X,Y]=meshgrid(x,y);
X
Y
Z=G(X,Y)

surf(X,Y,Z)
colormap(jet) % jet
shading interp % flat

rotate3d on
box on

integral2(G,0,1,-1,2) 