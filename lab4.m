clc;
clear all;
close all;
s = tf('s');

K= 99;
G = K*(s+3)*(s+5)/((s^2)*(s+7)*(s+8));
%G= tf(conv([1 3],[1 5]),conv([1 0],[1 7],[1 8]));
fb = feedback(G,1);
t= 0:0.001:200;

in= ones(1,length(t));
%in = t;
%in = 0.5*t.^2;
out = lsim(fb,in,t);
error = out' - in;
plot(t,in,'k',t,out,'b',t,error,'r');
legend ('in', 'out', 'error');