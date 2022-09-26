function y=f(x)
    //y=1./(1+25*x.^2)
    y=2+x.*8+8*x.^2
endfunction

x = linspace(-2,2,100)
plot(x,f(x),'r')

N = 50
k=5
xi = rand(N,1)*4. -2
yi = f(xi) +rand(N,1)*10-5 // 
plot(xi,yi,'o')

A = zeros(N,k)
for i=1:k
    A(:,i) = xi.^(i-1)
end

coefs = (A'*A)\(A'*yi)

function y = f_reg(x, coefs)
    y = zeros(x)
    for i = 1:k
        y = y+ coefs(i)*x.^(i-1)
    end
endfunction

plot(x,f_reg(x),'g')
