% this code generates an oscillating geotherm T(z)
% written by AGT 1/13/2016

clear all
figure(1)
clf %clears figure

%% initialize 
% using MKS system

Ts_bar = -10; %mean annual surface temperature degrees C
DT = 15; %annual temp swing
kappa = 1e-6; %diffusivity in meters^2/second

dz = 0.05; %increment of step change
zmax = 15; %max depth
z = 0:dz:zmax; %creates a depth array (z' would flip array from horizontal to vertical)

Tzero = zeros(size(z)); %takes something the size of the T array and fills it with zeros

dt = 5*3600*24; %daily period (seconds), plot every 5 days 
P = 365 * 24 * 3600; %annual period
tmax = 1*P; %max time (here at 1 year)
t = 0:dt:tmax; %time array
imax = length(t); %number of elements in time array

zstar_annual = sqrt(kappa*P/pi); %definition of zstar

Tenv_low = Ts_bar-DT*exp(-z/zstar_annual);
Tenv_high = Ts_bar+DT*exp(-z/zstar_annual); %creating outside envelope

%% run

for i = 1:imax
    T = Ts_bar + DT*exp(-z./zstar_annual).*sin((2*pi*t(i)/P)-(z./zstar_annual)); %. after z assures elementy by element calculation rather than as matrix
    
    figure(1)
        plot(T,z) %plot(x-axis,y-axis,color)
        hold on
        plot(Tzero,z,'g--')
        plot(Tenv_high,z,'r','linewidth',2)
        plot(Tenv_low,z,'b','linewidth',2)

        xlabel('Temperature (°C)','fontname','arial','fontsize', 21)
        ylabel('Depth (m)', 'fontname', 'arial', 'fontsize', 21)
        set(gca, 'fontsize', 18, 'fontname', 'arial') %gca get current axis, set numbers on axes
        set(gca, 'YDIR', 'reverse') %reverse changes axis direction
        axis([Ts_bar-DT-1 Ts_bar+DT+1 0 zmax]) %set axis limites
        pause(0.1) %plots one line at a time instead of all at once
     
end





