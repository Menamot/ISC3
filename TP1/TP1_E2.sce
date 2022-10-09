xi=1

A=[1,1,1,1,0,0,0,0;
1,2,4,8,0,0,0,0;
0,0,0,0,1,2,4,8;
0,0,0,0,1,3,9,27;
0,1,4,12,0,-1,-4,-12;
0,0,2,12,0,0,-2,-12;
0,0,2,6,0,0,0,0;
0,0,0,0,0,0,2,18;]

b=[1;2;2;0;0;0;xi;xi]
coef=A\b

function f=functionA(coef,x)
    xA=x(x>=0.5&x<=2)
    f(find(x>=0.5&x<=2))= coef(1)+coef(2)*xA+coef(3)*xA^2+coef(4)*xA^3
    xB=x(x>2&x<=3.5)
    f(find(x>2&x<=3.5))= coef(5)+coef(6)*xB+coef(7)*xB^2+coef(8)*xB^3
endfunction
x=linspace(0.5,3.5,100)
x0=[1,2,3]
y0=[1,2,0]
plot(x0,y0,'o')

plot(x,functionA(coef,x),'r')
xi=2
b=[1;2;2;0;0;0;xi;xi]
coef=A\b
plot(x,functionA(coef,x),'g')
xi=0
b=[1;2;2;0;0;0;xi;xi]
coef=A\b
plot(x,functionA(coef,x),'b')
legend("points","x=1", "x=2","x=0");
