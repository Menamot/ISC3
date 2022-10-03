function Fout = F(xvec)
    Fout = zeros(1,3)
    Fout(1) = xvec(1).^2-1
    Fout(2) = (xvec(2)-xvec(3)-3).^2
    Fout(3) = (xvec(3)+1).^2 - 1
endfunction

function Jout = FJac(xvec)
    Jout = zeros(3,3)
    Jout(1,1) = 2.*(xvec(1)-2)
    Jout(2,2) = 2.*xvec(2)+2.*(xvec(3)-3)
    Jout(2,3) = 2.*xvec(3)+2.*(xvec(2)-3)
    Jout(3,3) = 2.*(xvec(3)+1)
endfunction

xvec = zeros(3,1)

function [x,k] = newton2(x0,Fout,Jout,err)
    x=x0
    y=F(x)
    k=1
    while abs(norm(y)) >= err
        x=x+(-Jout(x)\Fout(x)')
        y=F(x)
        k=k+1
    end
endfunction

[x,k]=newton2(xvec,F,FJac,0.1)


function F3=E3(x)
    F3(1) = x(1)^2+x(2)^2 -16
    F3(2) = (x(1)-3)^2 + (x(2)-2)^2 - 9
endfunction


x0 = [0;0]
[xe3] = fsolve(x0,E3)

function F31=E31(x)
    F31(1) = sin(x(1)) - (xe3(2)/4)
    F31(2) = sin(x(2)) - (xe3(2)-3)/3
endfunction
[xe31] = fsolve(x0,E31)
xe31=xe31/%pi.*180

y=[3,3]
function F4=E4(x)
    n = norm(y)
    bian= sqrt(2*n*cos(72/180*%pi)-2*n^2)
    F4(1) = (x(1)-y(1))^2+(x(2)-y(2))^2 -bian^2
    F4(2) = x(1)^2+x(2)^2-n^2
endfunction
[xe4] = fsolve(x0,E4)
