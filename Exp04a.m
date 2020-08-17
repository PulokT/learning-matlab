% Program: Unit step function and shifting property

clc;
clear;
close all;
 
for n = -30:30;
    m = n+31;
    x(m) = n;
    
    if n>=3;
        y1(m) = 5;
    else 
        y1(m) = 0;
    end
     
    if n>=16;
        y2(m) = 1;
    else 
        y2(m) = 0;
    end
end
 
subplot (2,1,1), stem(x,y1);
title ('5u(n-3)'); 
subplot (2,1,2), stem(x,y2);
title ('u(n-16)');
