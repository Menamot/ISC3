clc,clear
//E1
function ndot=f(t,n)
    ndot = 10^(-6) * n * (10^6 - n)
endfunction

n0=10;t0=0;B=10^(-6);n_infini=10^6
t=0:0.1:20

n=ode(n0,t0,t,f)
plot2d("nl",t,n,style=2)

function n_real=f_real(t)
    n_real=(n0.*n_infini.*exp(B.*n_infini.*t))./(n_infini-n0+n0.*exp(B.*n_infini.*t))
endfunction

plot2d("nl",t,f_real(t),style=5)
legend("numerical","exact")
