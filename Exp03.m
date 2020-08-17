clc;
clear all;
close all;

x1=[2 5 4 -3 4 2]; %the first signal
n1=[-3:2];         %index of first signal
x2=[1 2 4 -5 3];    %the second signal
n2=[0:4];           %index of second signal

id_low=min(min(n1),min(n2));
id_max=max(max(n1),max(n2));
id_sum=id_low:id_max;

x11=zeros(1,length(id_sum));
x22=x11;

i=find(min(n1)==id_sum);
j=find(max(n1)==id_sum);
x11(i:j)=x1;

i=find(min(n2)==id_sum);
j=find(max(n2)==id_sum);
x22(i:j)=x2;

% x11=[zeros(1,n1(1)-id_sum(1)) x1 zeros(1,id_sum(end)-n1(end))];
% x22=[zeros(1,n2(1)-id_sum(1)) x2 zeros(1,id_sum(end)-n2(end))];

x_sum=x11+x22;

subplot(311),stem(id_sum,x11),xlabel('signal index of x1'),ylabel('signal value of x1'),grid on,axis([id_low id_max -10 10])
subplot(312),stem(id_sum,x22),xlabel('signal index of x2'),ylabel('signal value of x2'),grid on,axis([id_low id_max -10 10])
subplot(313),stem(id_sum,x_sum),xlabel('signal index of x_sum'),ylabel('signal value of x_sum'),grid on,axis([id_low id_max -10 10])
