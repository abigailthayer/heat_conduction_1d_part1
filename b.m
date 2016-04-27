% linear geotherm with two vertical sections of thermal conductivity
% written by AGT 1/13/2016
% problem with temperature at 30m

clear all
figure(1)
clf %clears figure

%% initialize 
% using MKS system

Ts = -12; %surface temperature degrees C
Qm = 0.045; % heat flux watts/meter^2

dz = 1; %increment of step change
zmax = 800; %max depth
z = 0:dz:zmax; %creates an array 
k1 = 1.2; %top thermal conductivity watts/meter*degreeK 
k2 = 2.5; %thermal conductivity below 30m

zj = 30; %depth of junction of materials with different thermal conductivities
Tj = Ts + (Qm/k1)* zj; %temperature at junction
Tj1 = Tj - ((Qm/k2) * 30); %adjust to find intercept at surface

T = Ts + (Qm/k1)* z; %defines all temperature
bottom = find(z>30); %below 30m
T(bottom) = Tj1 + (Qm/k2)* z(bottom); %temperature below 30m

Tzero = zeros(size(z)); %takes something the size of the T array and fills it with zeros

%% run

figure(1)
plot(T,z,'r') %plot(x-axis,y-axis,color)
hold on
plot(Tzero,z,'g--')

xlabel('Temperature (°C)','fontname','arial','fontsize', 21)
ylabel('Depth (m)', 'fontname', 'arial', 'fontsize', 21)
set(gca, 'fontsize', 18, 'fontname', 'arial') %gca get current axis
set(gca, 'YDIR', 'reverse') %reverse changes axis direction


