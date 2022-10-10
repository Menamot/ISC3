clc,clear
function E3=F3(t,N)
    S=N(1);E=N(2);I=N(3);R=N(4)
    NN=S+E+I+R
    E3(1)=-(Beta.*S.*I)./(NN) + varepsilon.*R.*(1-R./NN)
    E3(2)= (Beta.*S.*I)./(NN) - sigma.*E
    E3(3)= sigma.*E - Gamma.*I
    E3(4)= Gamma.*I - varepsilon.*R.*(1-R./NN)
endfunction

S0=70*10^6;E0=2000;I0=100;R0=0
Beta=1/2;varepsilon=1/90;sigma=1/5;Gamma=1/6
t0=0
t=1:1:700
N0=[S0;E0;I0;R0]

E3=ode(N0,t0,t,F3)

plot2d(t,E3(1,:))
plot2d(t,E3(2,:),style=2)
plot2d(t,E3(3,:),style=5)
plot2d(t,E3(4,:),style=16)
legend("S","E","I","R")
