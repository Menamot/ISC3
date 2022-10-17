function y=myf(x)
    y = exp(x)./(cos(x).^3+sin(x)^3)
endfunction

function y=fp_cs(x,h)
    y=(imag(myf(x+h*%i)))./h
endfunction

function y = fp_d(x,h)
    y = (myf(x+h)-myf(x-h))./ (2.*h)
endfunction
h=10.^(-(1:17))
x= %pi/4
format("e",24)

y1=fp_d(x,h)
y2=fp_cs(x,h)

y_real=sqrt(2)*exp(%pi/4)
e1=abs(y_real-y1)
e2=abs(y_real-y2)
plot2d("ll",h,e1,style=2)
plot2d("ll",h,e2,style=5)
legend("不准的","准的")


