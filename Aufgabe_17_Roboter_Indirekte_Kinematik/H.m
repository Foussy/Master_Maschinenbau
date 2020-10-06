function Reste=H(X)

global L1 L2 L3
global xsoll ysoll phisoll

% Winkel aus X entnehmen :
phi1=X(1);
phi2=X(2);
phi3=X(3);

% Transformationsmatrizen aufstellen :
WTK1=[cos(phi1) -sin(phi1)    0
      sin(phi1)  cos(phi1)    0
          0          0        1   ];
      
K1TK2=[cos(phi2) -sin(phi2)    L1
       sin(phi2)  cos(phi2)    0
           0          0        1   ];
       
K2TK3=[cos(phi3) -sin(phi3)    L2
       sin(phi3)  cos(phi3)    0
           0          0        1   ];
       
K3TCP=[L3
        0
        1 ];
    
WTCP=WTK1*K1TK2*K2TK3*K3TCP;

xist=WTCP(1);
yist=WTCP(2);

phiist=phi1+phi2+phi3;

% DIe Reste der Gleichungen in die Differenzen zwischen soll und ist :

Reste=[ xsoll-xist
        ysoll-yist 
      phisoll-phiist ];

  
  
  
  
  
  
  
  
  
  
  
  