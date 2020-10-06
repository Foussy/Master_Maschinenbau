function x1=Nsolve(F,x0)
% Liefert die Lösung des Newtonverfahrens für die
% durch F(x)=0 definierte Gleichung.
% F muss im folgendem Schema 
% programmiert sein: Null=F(x)
% Null und x sind Spaltenvektoren

eps=1E-12; % 1.0E-6
Nmax=100; % 100
err=1.0;
n=0;
xalt=x0;

while (err>eps) && (n<=Nmax)
   xneu=xalt-inv(JacNum(F,xalt))*feval(F,xalt);
   err=norm(feval(F,xneu),'fro');
   n=n+1;
   xalt=xneu;
end

if (err<=eps) 
   x1=xneu;
else
   x1=x0;
   disp 'No solution!'
end

