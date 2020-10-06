% Aufgabe 26: Eigeinschaften der Fourier-Analyse
clc,clear,shg,clf

% Data :
tmax=10;
dt=0.01;
t=0:dt:tmax; % 1001 points

Aoff=0.5; A1=1.0; A2=2.0; Ar=0;
f1=10;

for f2=0:0.1:100;
    
    y=Aoff+A1*cos(2*pi*f1*t)+A2*sin(2*pi*f2*t)+Ar*randn(size(t));
    
    % SIgnal im Zeitbereich :
    subplot(3,1,1)
    plot(t,y,'b-')
    xlabel('t in s')
    ylabel('Signal')
    
    % Fourier-Analyse :
    [Freq,Amp1,Phase]=Spec(y,tmax);
    
    subplot(3,1,2)
    plot(Freq,Amp1,'r-')
    xlabel('f in Hz')
    ylabel('Signal Amplitude')
    
    % Den maximalen Peak beschriften :
    [ma,i]=max(Amp1);
    fma=Freq(i);
    text(fma+1,1.5,['f_w_a_h_r = ',num2str(f2)])
    text(fma+1,2.0,['f_a_l_i_a_s = ',num2str(fma)])
    ylim([0 2.5])
    
    
    subplot(3,1,3)
    plot(Freq,Phase,'g-')
    xlabel('f in Hz')
    ylabel('Phase in rd')
    
    drawnow
end
