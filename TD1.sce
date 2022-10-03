function y = myf(x)
    y = (exp(x)) ./ ((cos(x)).^3 + (sin (x)).^3)
endfunction

//x = linspace(-%pi./4+0.1,%pi./2,200)
//plot(x,myf(x))

function y = fp_cs(x,h)
    y = imag(myf(x+h.*%i))./h
endfunction

function y=fp_d(x,h)
    y = (myf(x+h) - myf(x-h))./(2*h)
endfunction

x = %pi./4
h = 10.^(-(1:17))

y1 = fp_cs(x,h)
y2 = fp_d(x,h)

//plot("ll",h,y1)

f=sqrt(2).*exp(x)

e1=abs(f - fp_cs(x,h))
e2=abs(f - fp_d(x,h))

plot2d("ll",h,e1)
plot2d("ll",h,e2)

