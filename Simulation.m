%SCRIPT FILE FOR NEUS EXPERIMENTAL ANALYSIS
clc;
clear all;
close all;

%%Radius Range

r=1e-3:10e-3:1e-2;

%%Frequency Range

f = 0:0.000002:((0.000002)*2);

%%Ouptut matrix building

OUT = zeros(length(f), length(r));

%%Simulation Cycle

%Display a waitbar that shows what percentage of a calculation is complete,
%as the calculation proceeds
h = waitbar(0,'Loading data set, please wait...');
n = 1;

f_max_index_previous = 10;
for f_index = 1:length(f)
    
    parfor (r_index = 1:length(r))
        
        u_bf = Up(1,2.8e14,f(f_index),5e5,50,r(r_index),0.43,10^12);
        u = Cr(u_bf,5e5,50,r(r_index));
        
        U = fft(u(1,:),[],2);
        U_magnitude = abs(U);
        U_phase = angle(U);
        U_magnitude_diff = diff(U_magnitude,1,2);
        U_magnitude_diff_shift = [U_magnitude_diff(1,2:end) 0];
        f_pos_index = find((U_magnitude_diff>0) & (U_magnitude_diff_shift<0)) + 1;
        
        if isempty(f_pos_index)
            OUT(f_index, r_index) = 0;
        else
            OUT(f_index, r_index) = U_magnitude(f_pos_index(1));
        end
    end
    
    waitbar(n/ (length(f)),h);
    
    n = n+1;
end

close(h);

%figure
%surf(OUT(3:end,:)/(16e8)); figure(gcf)
xlabel('Frequency [0.000002 Hz]');
ylabel('Radius [10^-3 cm]');
zlabel('Concentration Signal Amplitude [transmitted power = 3/2*4*10^4]');
title('Olfactory Channel Model - Still Air');