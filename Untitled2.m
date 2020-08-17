clc;
clear all;
close all;

[n,x]=impseq(-10, 8, 5);
stem(n,x);
xlabel('Index')
ylabel('Signal Value')
%axis([-3 8 -1 1.5])
xlim([-3 10])
ylim([-1 1.5])
