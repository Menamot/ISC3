clear
function y = piecewiselinear(x,d,u)
    y = zeros(x);
    for j = 1:d
        y = y + u(j)*max( 0, 1-(d-1)*abs(x-(j-1)/(d-1)) );
    end
endfunction

N=100

xi = rand(N,1);
xi = gsort(xi)
yi = sin(2*%pi*xi)+0.2*rand(N,1, "normal");

d=20
A = zeros(N,d)
for j=1:d
    A(:,j) = max( 0, 1-(d-1)*abs(xi-(j-1)/(d-1)) );
end

coefs = (A'*A)\(A'*yi)

x=linspace(0,1,100)
//plot(xi,yi,'o')
//plot2d(xi, piecewiselinear(xi,d,coefs))

coefs2=zeros(d,10)
for k=1:10
    uk=10^(k-9)
    coefs2(:,k) = (A'*A+uk.*eye(d,d))\(A'*yi)
end
//plot2d(xi,piecewiselinear(xi,d,coefs2(:,8)),style=2)
//plot2d(xi,piecewiselinear(xi,d,coefs2(:,9)),style=16)
//plot2d(xi,piecewiselinear(xi,d,coefs2(:,10)),style=5)
//legend("points","sans regularized", "k=-1","k=0","x=1");
for k=1:10 
    aa(k)=norm(A*coefs2(:,k)-yi)
    bb(k)=norm(coefs2(:,k))
    cc(k)=10.^(k-9)
end
//plot(10)
plot2d('ll',cc,aa)
plot2d('ll',cc,bb,style=2)
legend("first term","second term");

