function [F,Ampl,Phase]=Spec(y1,tmax)
% Berechnet das Amplituden- und Phasenspektrum einer
% diskreten Zeitfunktion y(t), deren Funktionswerte 
% im Bereich 0 .. tmax liegen

n=length(y1);

% Datensatz mit Nullen auffüllen, bis 
% Datenlänge eine Potenz von 2 ist:
N1=ceil(log(n)/log(2));
N=2^N1;
y=zeros(N,1);
y(1:n)=y1;

% Zeitintervall der Daten:
dt=tmax/(n-1);

% Maximale Frequenz (Faltungsgrenze)
fmax=1/(2*dt)

% Frequenzintervall berechnen und 
% Frequenzdaten für Spektrum erstellen:
df=2*fmax/(N-1);
N2=fix(N*0.5)
F=[0:N2-1].*df;

% FFT ausführen:
fyw=fft(y,N)/n;

% Untere Hälfte der Fouriertransformierten bis Faltungsgrenze 
% als Spektrum verwenden und verdoppeln:
fyw2=2*fyw(1:N2);

% Amplitude bilden:
Ampl=abs(fyw2);

% Amplitude bei f=0 gesondert berechnen:
Ampl(1)=mean(y1);

% Phase bilden:
Phase=unwrap(angle(fyw2));

