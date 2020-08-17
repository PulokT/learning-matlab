clc;
clear all;
close all;

[mu0,yu0]=unitseq(-10,10,0);
[m1,y1]=sigshift(mu0,yu0,-5);
[mf1,yf1]=sigfold(mu0,yu0);
[m2,y2]=sigshift(mf1,yf1,5); %u(-n+5), rightshifting
[m3,y3]=sigshift(mf1,yf1,-5);%u(-n-5), leftshifting


subplot(511),stem(mu0,yu0),title('u(n)'),axis([-20 20 -1 1]);
subplot(512),stem(m1,y1),title('u(n+5)'),axis([-20 20 -1 1]);
subplot(513),stem(mf1,yf1),title('u(-n)'),axis([-20 20 -1 1]);
subplot(514),stem(m2,y2),title('u(-n+5)'),axis([-20 20 -1 1]);
subplot(515),stem(m3,y3),title('u(-n-5)'),axis([-20 20 -1 1]);

