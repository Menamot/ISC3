function  y = piecewise3(x) 

// first piece - a constant
y(find(x <= -4)) = -1; 

// second piece - a straight line
x2 = x(-4 < x & x <= -3);
y(find(-4 < x & x <= -3)) = -4*x2 - 13; 

// third piece - a parabola
x3 = x(-3 < x & x <= 0);
y(find(-3 < x & x <= 0)) = x3.^2 + 6*x3 + 8; 

// fourth piece - another constant
y(find(0 < x)) = 8; 

endfunction


// define your independent values in a column row
x = [-7 : .1 : 7]'; 

// call your previously defined function
y = piecewise3(x); 

// plot
plot(x, y, 'r')
xlabel('x'); ylabel('y');
title('Piecewise Function');
legend('4-piece Function');

 
