% linear geotherm
% written by AGT 1/13/2016

clear all
figure(1)
clf %clears figure

%% initialize 
% using MKS system

Ts = -12; %surface temperature degrees C
k = 2.5; %thermal conductivity watts/meter*degreeK 
Qm = 0.045; % heat flux watts/meter^2

dz = 1; %increment of step change
zmax = 800; %max depth
z = 0:dz:zmax; %creates an array (z' would flip array from horizontal to vertical)

T = Ts + (Qm/k) * z; %defines temperature

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





