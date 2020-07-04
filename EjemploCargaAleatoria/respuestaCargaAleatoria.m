% Universidad de Costa Rica
% Vibraciones IM0729

clear variables
clc
close all

% Este es un ejemplo en que se muestra como utilizar la función
% 'resolverSistemaCargaAleatoria.m'. 
load('DataEntrada.mat')
% El comando load lo que hace es cargar los datos en el workspace que estan
% en el archivo DataEntrada.mat. En este caso lo que hay en este archivo 
% DataEntrada.mat son dos arreglos. Un arreglo t que es el tiempo y un
% arreglo carga que es la fuerza externa.

Sistema.m = 10;
Sistema.k = 10000;
Sistema.c = 100;

[x,tt] = resolverSistemaCargaAleatoria(Sistema,t,carga);

subplot(1,2,1)
plot(t,carga,'b','linewidth',1.2)
xlabel('Tiempo (s)')
ylabel('Carga externa (N)')
ylim([min(carga)*1.2 max(carga)*1.2])
xlim([min(t) max(t)])

subplot(1,2,2)
plot(tt,x,'b','linewidth',1.2)
xlabel('Tiempo (s)')
ylabel('Desplazamiento (x)')
ylim([min(x)*1.2 max(x)*1.2])
xlim([min(t) max(t)])