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

while (err>eps) & (n<=Nmax)
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

% ---------------------------------------------------------

function J=JacNum(F,Q)
% Berechnet numerisch die Jacobi-Matrix einer 
% Funktion F, die in folgendem Schema 
% programmiert sein muss: Y=F(Q)

eps=1.0E-5;			% Dies ist unser h 

mQ=length(Q);
X1=zeros(mQ,1);  	% Spaltenvektoren für die x-2h, x-h, x+h, x+2h
X2=zeros(mQ,1);
X3=zeros(mQ,1);
X4=zeros(mQ,1);
Y1=zeros(mQ,1);	% Spaltenvektoren für die F(x-2h), F(x-h) etc.
Y2=zeros(mQ,1);
Y3=zeros(mQ,1);
Y4=zeros(mQ,1);
J=zeros(mQ,mQ);

for n=1:mQ
   X1=Q;
   X2=Q;
   X3=Q;
   X4=Q;
   X1(n)=X1(n)-2*eps;  
   X2(n)=X2(n)-eps;   
   X3(n)=X3(n)+eps;   
   X4(n)=X4(n)+2*eps;   
   Y1=feval(F,X1);
   Y2=feval(F,X2);
   Y3=feval(F,X3);
   Y4=feval(F,X4);
   J(:,n)=(Y1(:,1)-8*Y2(:,1)+8*Y3(:,1)-Y4(:,1))/(12*eps);
end
 
