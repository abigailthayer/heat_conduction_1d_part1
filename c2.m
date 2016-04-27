%temperature evolution T(t) of 10 depths over one year
%written by AGT 1/14/2016

clear all
figure(1)
clf

%% initialize

Ts_bar = -10; %mean annual surface temperature degrees C
DT = 15; %annual temp swing
kappa = 1e-6; %diffusivity in meters^2/second

dz = 0.05; %increment of step change
zmax = 15; %max depth
z = 0:dz:zmax; %creates a depth array 

dk = zmax/9; %interval between 10 depths
kmax = zmax; %max depth
k = 0:dk:kmax; %creates an array of 10 depths

Tzero = zeros(size(z)); %takes something the size of the T array and fills it with zeros

dt = 5*3600*24; %daily period (seconds), plot every 5 days 
P = 365 * 24 * 3600; %annual period
tmax = 1*P; %max time (here at 1 year)
t = 0:dt:tmax; %time array
imax = length(k); %number of elements in depth array

zstar_annual = sqrt(kappa*P/pi); %definition of zstar

%% run

for i = 1:imax
    T = Ts_bar + DT*exp(-k(i)/zstar_annual).*sin((2*pi*t./P)-(k(i)/zstar_annual)); 
   
    figure(1)
        plot(t/P, T) %plot(x-axis,y-axis,color)
        hold on
        
        xlabel('Time (yr)','fontname','arial','fontsize', 21)
        ylabel('Temperature (°C)', 'fontname', 'arial', 'fontsize', 21)
        set(gca, 'fontsize', 18, 'fontname', 'arial') %gca get current axis, set numbers on axes
        axis([0 1 -26 6]) %set axis limits
    
end
