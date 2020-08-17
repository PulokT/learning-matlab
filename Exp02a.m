clc;
clear;
close all;


n = 0:1:5;
x = exp(2+j*3).*n;
stem(n,abs(x))
