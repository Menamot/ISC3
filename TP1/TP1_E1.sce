function y=f(x)
    y=1./(1+25*x.^2)
endfunction

function y=LagrangePol(x,xj,i)
    numer = ones(x)
    denom=1.0;
    l=length(xj)
    setindex=setdiff(1:l,i)
    for j=setindex
        numer=numer.*(x-xj(j))
        denom=denom.*(xj(i)-xj(j))
    end
    y=numer/denom
endfunction

function y=polinterpolation(x,xi,yi)
    y=0*x;
    l=length(xi)
    for i=1:l
        y=y+yi(i) *LagrangePol(x,xi,i)
    end
endfunction

x1=linspace(-1.5,1.5,200)
plot2d(x1,f(x1),rect=[-1.2,-0.3.2,1.3],style=1)
function pp(n0,col)
    xi=zeros(n0)
    for z=1:n0
        xi(z)= -1+2*z./n0
    end
    //plot(xi,f(xi),'o')
    plot2d(x1,polinterpolation(x1, xi,f(xi)),rect=[-1.2,-0.3.2,1.3],style=col)
endfunction
pp(5,2)
//pp(10,7)
//pp(15,16)
//legend("f(x)", "n=2","n=7","n=16");
//下面是splin方法
function xx(n0,col)
     xi=zeros(n0)
    for z=1:n0
        xi(z)= -1+2*z./n0
    end
    //plot(xi,f(xi),'o')
    d=splin(xi,f(xi))
    yyi=interp(x1,xi,f(xi),d)
    plot2d(x1,yyi,style=3,rect=[-1.2,-0.3,1.2,1.3],style=col)
endfunction
//xx(5,2)
//xx(10,5)
//xx(15,16)
//legend("f(x)", "n=2","n=7","n=16");
