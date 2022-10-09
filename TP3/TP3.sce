clc,clear
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

//xx=[0,0.71,3]
//yy=[0,3.93,3]
//plot2d(xx,yy,rect=[0,0,3.2,4.2])
//plot(xx,yy,'o')

function E3_1=F3_1(xvec)
    E3_1(1) = xvec(1)^2 + xvec(2)^2 - 16
    E3_1(2) = (xvec(1) - 3)^2 + (xvec(2) - 3)^2 - 9
endfunction

xE3_1 = fsolve(zeros(2,1),F3_1)

function E3_2 = F3_2(theta)
    E3_2(1) = sin(theta(1)) - xE3_1(2)/4
    E3_2(2) = sin(theta(2)) - (xE3_1(2)-3)/3
endfunction
xE3_2 = fsolve(zeros(2,1),F3_2)
xE3_2 = xE3_2/%pi .* 180

x=0;y=1
function E4=F4(xvec)
    p=sqrt(y^2+x^2)
    if x>0 then
        theta=atan(y/x)
    end
    if x<0&&y>=0 then
        theta=atan(y/x)+%pi
    end
    if x<0&&y<0 then
        theta=atan(y/x)-%pi
    end
    if x==0&&y>0 then
        theta=%pi/2
    end
    if x==0&&y<0 then
        theta=-%pi/2
    end
    E4(2) = xvec(2) - theta-72/180*%pi
    E4(1) = xvec(1) - p
endfunction

E4(:,1)=[1;atan(y/x)]
for i=1:5
    E4(:,i+1)=fsolve([0;0],F4)
    x=E4(1,i+1)*cos(E4(2,i+1))
    y=E4(1,i+1)*sin(E4(2,i+1))
end
//plot( (E4(1,:).*cos(E4(2,:))) ,(E4(1,:).*sin(E4(2,:))))
//plot( (E4(1,:).*cos(E4(2,:))) ,(E4(1,:).*sin(E4(2,:))),'o')



//E5
function E5=F5(xvec)
    E5(1) = xvec(1)^2 + xvec(2)^2 + xvec(3)^2 -1
    E5(2) = (xvec(1)-1)^2 + xvec(2)^2 + xvec(3)^2 - 1
    E5(3) =  xvec(1) +  xvec(2) + xvec(3)
endfunction
function J=FJ(xvec)
    J(1,1) = 2*xvec(1)
    J(1,2) = 2*xvec(2)
    J(1,3) = 2*xvec(3)
    J(2,1) = 2*(xvec(1)-1)
    J(2,2) = 2*xvec(2)
    J(2,3) = 2*xvec(3)
    J(3,1) = 1
    J(3,2) = 1
    J(3,3) = 1
endfunction

xE5=fsolve([5;-5;0],F5,FJ)
xE5_2=fsolve([5;5;0],F5,FJ)


