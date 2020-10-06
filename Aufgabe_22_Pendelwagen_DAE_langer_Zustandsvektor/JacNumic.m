function J=JacNumic(Phi,Q)
% Berechnet numerisch die Jacobi-Matrix einer 
% Funktion Phi, die in folgendem Schema 
% programmiert sein muss: F=Phi(Q)

eps=1.0E-5;			% Dies ist unser h 

mQ=length(Q);
X1=zeros(mQ,1);  	% Spaltenvektoren für die x-2h, x-h, x+h, x+2h
X2=zeros(mQ,1);
X3=zeros(mQ,1);
X4=zeros(mQ,1);
nQ=length(feval(Phi,Q));
F1=zeros(nQ,1);	% Spaltenvektoren für die F(x-2h), F(x-h) etc.
F2=zeros(nQ,1);
F3=zeros(nQ,1);
F4=zeros(nQ,1);
J=zeros(nQ,mQ);

for n=1:mQ
   X1=Q;
   X2=Q;
   X3=Q;
   X4=Q;
   X1(n)=X1(n)-2*eps;  
   X2(n)=X2(n)-eps;   
   X3(n)=X3(n)+eps;   
   X4(n)=X4(n)+2*eps;   
   F1=feval(Phi,X1);
   F2=feval(Phi,X2);
   F3=feval(Phi,X3);
   F4=feval(Phi,X4);
   J(:,n)=(F1(:,1)-8*F2(:,1)+8*F3(:,1)-F4(:,1))/(12*eps);
end
 
