clc;
clear all;
close all;
x=[-3 2 1 2 4 5];

n=[-2:1:3];

[m,y]=sigfold(n,x)
subplot(211), stem(m,y)

title('u(-n)')
axis([-5 5 -6 6]);

