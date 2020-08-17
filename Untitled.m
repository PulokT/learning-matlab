clc;
clear all; 
close all; 

[n,x] = impseq(-10,8,5);

stem(n,x)
xlabel('Index')
ylabel('Signal Value')
axis([-3 8 -1 1.5])

% for n = -30:30;
%     m = n+31;
%     x(m) = n;
%     
%     if n==0;
%         y1(m) = 1;
%     else 
%         y1(m) = 0;
%     end
%      
%     if n==-12;
%         y2(m) = 1;
%     else 
%         y2(m) = 0;
%      end
%      
%     if n==16;
%         y3(m) = 1;
%     else 
%         y3(m) = 0;
%     end
% end
% subplot (3,1,1), stem(x,y1);
% title ('d(n)');
% subplot (3,1,2), stem(x,y2);
% title ('d(n+12)');
% subplot (3,1,3), stem(x,y3);
% title ('d(n-16)');
% xlabel('Index')
% ylabel('Signal Value')
