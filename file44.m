clc;
x= [200 250 300 350 400 450]
y= [1.708 1.367 1.139 0.967 0.854 0.759]
xx= [220 279 370]
interp1(x,y,xx, 'spline')
interp1(x,y,xx, 'linear')
interp1(x,y,xx, 'nearest')