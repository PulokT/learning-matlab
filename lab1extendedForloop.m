clc;
F=100; 
T=1/F;
t=0:T/100:3*T;
a=2;
for i=1:length(t)
x(i)= a*sin(2*pi*F*t(i));
end
subplot(2,2,[1 2]), 
plot(t,x),
xlabel('time in seconds'), ylabel('signal value'), 
title(['Analog signal of frequency', num2str(F), 'Hz'])
Fs=300; 
f= F/Fs; 
t= 1/f;
n1=0:1:2*t;
y1= a*sin(2*pi*f*n1);
subplot(2,2,3), stem(n1,y1),xlabel('index'), ylabel('signal values - D/C??'), title(['Signal Sampled at', num2str(Fs), 'Hz'])
Fs= 1000;
f=F/Fs; 
t= 1/f; 
n2= 0:1:2*t; 
y2= a*sin(2*pi*f*n2); 
subplot(2,2,4), stem(n2,y2),xlabel('index'), ylabel('signal values'), title(['Signal Sampled at', num2str(Fs), 'Hz']) 