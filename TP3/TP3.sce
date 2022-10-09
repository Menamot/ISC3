function Fout = F(xvec)
    Fout = zeros(1,3)
    Fout(1) = (xvec(1)-2)^2 - 1
    Fout(2) = (xvec(2) - xvec(3) - 3)^2
    Fout(3) = (xvec(3)+1)^2 - 1
endfunction

function Jout = FJac(xvec)
    Jout = zeros(3,3)
    Jout(1,1) = 2*(xvec(1) - 2)
    Jout(2,2) = 2*(xvec(2) - xvec(3) - 3)
    Jout(2,3) = -2*(xvec(2) - xvec(3) - 3)
    Jout(3,3) = 2*(xvec(3)+1)
endfunction

function [x,k]=Newton(x0,Fout,Jout,err)
    k=1;x=x0;
    while abs(norm(F(x))) >err
        x = x+(-Jout(x)\Fout(x)')
        k=k+1
    end
endfunction

[x,k] = Newton(zeros(3,1),F,FJac,10^(-5))

xx=[0,0.71,3]
yy=[0,3.93,3]
plot2d(xx,yy,rect=[0,0,3.2,4.2])
plot(xx,yy,'o')

function E3_1()
endfunction

