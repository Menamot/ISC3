clc,clear
//E2
function E2=F2(t,x)
    E2(1) = x(2)
    E2(2) = -B.*x(2) + x(1) - yg.*x(1)^3 + F.*cos(w*t)
endfunction

B=0.05;yg=1.0;w=1.0;F=6.0;
x0=[0;0]
t0=0
td=0:0.05:200

E2=ode(x0,t0,td,F2)
plot2d(td,E2(1,:),style=2,rect=[20,-8,80,8])
plot2d(td,E2(2,:),style=5,rect=[20,-8,80,8])
legend("x1","x2")
