function y=f(x)
    y=1./(1+25*x.^2)
    //y=2+x.*8+8*x.^2
endfunction

n=4
i=30
xi = -1+ 2*i./n
yi = f(xi)
function y= poly_interp(x, xi, yi)
    
endfunction
x = linspace(-2,2,1000)
plot(x,f(x))

N = 50

xi = rand(N,1)*4. -2
yi = f(xi) +rand(N,1)*0.1-0.05 // 
//plot(xi,yi,'o')
function y=f_inter(x,k)
    A = zeros(N,k)
    for i=1:k
        A(:,i) = xi.^(i-1)
    end 

    coefs = (A'*A)\(A'*yi)
    y = zeros(x)
    for i = 1:k
        y = y+ coefs(i)*x.^(i-1)
    end
endfunction


plot2d(x,f_inter(x,5),rect=[-2,-0.4,2,1.1],style=2)
plot2d(x,f_inter(x,9),rect=[-2,-0.4,2,1.1],style=6)
plot2d(x,f_inter(x,14),rect=[-2,-0.4,2,1.1],style=17)
legend("points ", "n=5","n=9","n=14");
