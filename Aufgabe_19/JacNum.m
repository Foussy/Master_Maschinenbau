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