clear
function y = piecewiselinear(x,d,u)
    y = zeros(x);
    for j = 1:d
        y = y + u(j)*max( 0, 1-(d-1)*abs(x-(j-1)/(d-1)) );
    end
endfunction

N=100
d=20

xi = rand(N,1);
xi = gsort(xi)
yi = sin(2*%pi*xi)+0.2*rand(N,1, "normal");


A = zeros(N,d)
for j=1:d
    A(:,j) = max( 0, 1-(d-1)*abs(xi-(j-1)/(d-1)) );
end

coefs = (A'*A)\(A'*yi)


function y = f_reg(x, coefs)
    y = zeros(x)
    for j = 1:d
        y = y+ coefs(j)*max( 0, 1-(d-1)*abs(x-(j-1)/(d-1)) );
    end
endfunction

x=linspace(0,1,100)
plot(xi,yi,'o')
plot(xi,piecewiselinear(xi,d,coefs),'r')

