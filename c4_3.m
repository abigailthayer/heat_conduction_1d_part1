% this code generates a daily oscillating geotherm T(z) as a movie
% written by AGT 1/13/2016

clear all
figure(1)
clf %clears figure

%% initialize 
% using MKS system

Ts = -10; %mean surface temperature degrees C
DT = 15; %annual temp swing
DT_daily = 10; %daily temp swing
kappa = 1e-6; %diffusivity in meters^2/second

dz = 0.05; %increment of step change
zmax = 1; %max depth
z = 0:dz:zmax; %creates a depth array 

dt = 3600*6; %plot every six hours
P = 365*24*3600; %annual period in s
P_day = 24*3600; %daily period in s
tmax = P; %max time (here at 1 year)
tplot = dt;

t = 0:dt:tmax; %time array
imax = length(t); %number of elements in time array

Tzero = zeros(size(z)); %takes something the size of the T array and fills it with zeros
zstar = sqrt(kappa*P/pi); %definition of zstar
zstar_daily = sqrt(kappa*P_day/pi); 

Tenv_low = Ts-DT*exp(-z/zstar)-DT_daily*exp(-z/zstar_daily);
Tenv_high = Ts+DT*exp(-z/zstar)+DT_daily*exp(-z/zstar_daily); %creating outside envelope

nframe=0; 

%% run

for i = 1:imax
    Tannual = Ts + DT*exp(-z./zstar).*sin((2*pi*t(i)/P)-(z./zstar)); 
    Tdaily = Tannual + (DT_daily*exp(-z./zstar_daily).*sin((2*pi*t(i)/P_day)-(z./zstar_daily))); %sum of annual and daily oscillations
    
     if(rem(t(i),tplot)==0)
        nframe = nframe+1;
    figure(1)
        plot(Tdaily,z,'k','linewidth',2) %plot(x-axis,y-axis,color)
        xlabel('Temperature (°C)','fontname','arial','fontsize', 21)
        ylabel('Depth (m)', 'fontname', 'arial', 'fontsize', 21)
        set(gca, 'fontsize', 18, 'fontname', 'arial') %gca get current axis, set numbers on axes
        set(gca, 'YDIR', 'reverse') %reverse changes axis direction
        axis([Ts-DT-DT_daily-1 Ts+DT+DT_daily+1 0 zmax]) %set axis limites
        hold on
        
        plot(Tzero,z,'g--','linewidth',2)
        plot(Tenv_high,z,'r','linewidth',2)
        plot(Tenv_low,z,'b','linewidth',2)
        
        M(:,nframe) = getframe(gcf);
        pause(0.05)
        hold off
     end
        
end






