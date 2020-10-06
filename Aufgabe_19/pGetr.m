function pGetr(X)

global r2 r3 r4 L delta s
global phi2 Kurve
phi3=X(1);
phi4=X(2);
Dx=X(3);
Dy=X(4);
Kurve=[Kurve [Dx;Dy]];
b=0.1;h=0.1;  
Dr1=[0 -b b
     0 -h -h];
Dr2=[s+0 s-b s+b
     0 -h -h];
 
subplot(1,3,1)
fill(Dr1(1,:),Dr1(2,:),'y')
hold on
fill(Dr2(1,:),Dr2(2,:),'y')

plot(Kurve(1,:),Kurve(2,:))
A=[0;0];
B=A+r2*[cos(phi2);sin(phi2)];
C=B+r3*[cos(phi3);sin(phi3)];
D=[Dx;Dy];
E=[s;0];

Dr3=[B C D];
fill(Dr3(1,:),Dr3(2,:),'g');

St=[A B C E];
plot(St(1,:),St(2,:),'b-')
St=[A B C D E];
plot(St(1,:),St(2,:),'bo')

axis equal 
axis([-2 3.5 -1 5])
hold off

