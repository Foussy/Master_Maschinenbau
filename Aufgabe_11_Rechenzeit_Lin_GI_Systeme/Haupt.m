% Lineare Gleichungssysteme
% A8x=b ---> x=A\b "LU-Zerlegung"= Gausss numerisch
clc, clear, clf, shg

% Wie viel Rechenzeit benotigt das Losen eines voll besetzen linearen
% Gl.-Systemes ?
pause(0.2)

for N=round(logspace(log10(1),log10(8000),50))
A=randn(N,N);
b=randn(N,1);

tic
x=A\b;
t=toc;

plot(N^3,t,'ro')
hold on
xlabel('Anzahl N der Unbekannten')
ylabel('Rechnenzeit in s')
title('Lineares Gleichungssystem')
drawnow

end