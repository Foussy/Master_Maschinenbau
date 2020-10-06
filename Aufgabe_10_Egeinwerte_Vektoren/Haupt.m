% Eigeinwerte und Eigenvektoren :
% S 113
clc, clear

A = [1 2 3
     2 1 5
     3 5 2]
 A'-A % Aha ! A ist symmetrisch
 % hat also garantiert reelle eigeinwerte
 % und eine Eigenbasis, ist also diagonalisiert
 
d= det(A)
r= rank(A)
A_1= inv(A)
 
 A_1*A % --A E
 
 %=========================================%
  Lambda=eig(A)
 
 prod(Lambda) % ---> = det(A)
 sum(Lambda) % ---> spur(A) engl. trace
 A(1,1)+A(2,2)+A(3,3)
 trace(A)
 
 [EVektoren,DiagMat]=eig(A)
 
 v1=EVektoren(:,1)
 v2=EVektoren(:,2)
 v3=EVektoren(:,3)
 
 lam1=Lambda(1)
 lam2=Lambda(2)
 lam3=Lambda(3)
 
 % Gilt immer Matrix mal Vektor = Zahl mal Vektor ?
 
 [A*v1 lam1*v1]
 [A*v2 lam2*v2]
 [A*v3 lam3*v3]
 
 % Das diagonalisieren (Hauptachsentransformation);
 
 inv(EVektoren)*A*EVektoren  % ---> DiagMat
 
 % Das Rekonstruieren vo  A auf EVektoren und Lambda
 EVektoren*DiagMat*inv(EVektoren)
 
 % Der Befelhf diag arbeitet auf zwei Arten :
 % diag(Matrix) ---> Liste mit Diagonalelemente
 % diag(Liste) ---> baut Matrix mit Listenelemente auf Diagonale
 diag(Lambda) % ---> Diagonalmatrix
 diag(DiagMat) % ---> Liste
 
 %===========================================%
 % Eigeinwerte auch komplex
 
 A = [1   2   3
      2   1   5
      3  -50  2]
 
 eig(A)
 [EVekt,DMat]=eig(A)