clc;
clear all; 
close all; 
f=0.2; %period will be 1/0.05 =20 samples, after each 20 samples the signal repeats

n=0:79 ; %lets show two full periods... 40 samples... 

x=sin(2*pi*f*n); 

subplot(211), stem(n,x), xlabel('index'), title('signal before up sampling'), grid on; 
L=10; %up sampling rate
k=n(1); 
id =1; 
for i=1:L*length(n)
    if(~mod(k,L))
        y(i) = x(id);
        id=id+1;
    else
        y(i)=0;
    end
    k=k+1; 
end
subplot(212), stem(y), xlabel('index'), title('up sampled by factor 3'), grid on 
