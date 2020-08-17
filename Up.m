function U = Up(Q_num,Q_Ampl,f,tend,step,r,D,Cth)

    %U : [molec/cm^3] : Spatial Density of message molecules (m.m.)
    
    %Q_num : Q function
    %Q_Ampl : Q function Amplitude,i.e.,maximum Q.
    %Q : [molec/s] : Rate of Molecules released, each one carrying I
    %bits/molec.
    %f : frequency
    %tend : [s] : Source Emitting time (simulation time)
    %step : Time division [1 second step = 1]
    %r : [cm] : distance between TN and RN
    %D : [cm^2/s] : Brownian Translational Diffusion Coeff. for m.m.
    %Cth : Minimum threshold concentration of m.m. that can be detected a
    %chemical sensor in some minimum waiting time teq.
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Time vector Creation
t=[0.00001:step:tend];
jend=length(t);     %Number of _____seconds

Q(1:jend) = 0;

switch Q_num
    case (0)
        for j=1:jend
            Q(j) = Q_Ampl;
        end
    case(1)
        for j=1:jend
            offset = Q_Ampl;
            Q(j) = offset + Q_Ampl*sin(2*pi*f*t(j));
        end
end

set(0,'defaultaxesfontname','Arial Narrow');
figure;
plot(Q);
grid on;
xlabel('Time [s]');
ylabel('Concentration Rate [molec/s]');
title('HUMAN BODY - Concentration Rate');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iend = length(r);
for i=1:iend
    for j=1:jend
        func(j) = (1/(4*pi*D*t(j))^(3/2)).*exp(-(r(i)^2)/(4*D*t(j)));
    end
u = step*conv(Q,func);
U(i,:) = u(1:jend);
end

i = i+1;
U(i,1:jend) = Cth;

%Figure Settings
set(0,'defaultaxesfontname','Arial Narrow');
figure;

%Plot Graphs
for i=1:iend
    
    switch i
    case({1,6})
        c = '-*';
        case ({2,7})
            c = '-.s';
            case ({3,8})
                c = '--o';
                case({4,9})
                    c = '-d';
                    otherwise
                        c = ':>';
    end
   

h(i) = plot(t,U(i,:),c,'LineWidth',1,'MarkerSize',1);
hold all;
end

i = i + 1;
h(i) = plot(t,U(1,:),'k-','LineWidth',2,'MarkerSize',2);
hold all;
grid on;

%Introduce D values
legend(h, 'R=10^{-2} (cm)','R=3*10^{-2} (cm)','R=6*10{-2} (cm)','R=9*10^{-2} (cm)','Cth=10^{12} (molec/cm^3)',4);
%axis([t(1),t(1),U(1),U(1)]);
xlabel('Time [s]');
ylabel('Concentration [molec/cm^3]');
title('HUMAN BODY - CONTINUOUS - Convolution');
hold off;





