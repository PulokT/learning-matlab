clc
F=100;
T=1/F;
t=0:T/100:3*T;
a=2;
x=a*sin(2*pi*F*t);
subplot (2,2,[1 2]), plot(t,x),xlabel('time in second'),ylabel('signal value'),title(['Analog signal of frequency',num2str(F),'Hz'])