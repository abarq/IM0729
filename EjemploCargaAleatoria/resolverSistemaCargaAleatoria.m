function [x,tt] = resolverSistemaCargaAleatoria(Sistema, t, carga)

% Esta función permite determinar la respuesta de un sistema mecánico LINEAL de   
% un grado de libertad asumiendo condiciones iniciales iguales a cero.

% Es válido únicamente cuando el factor de amorgiguamiento es menor a uno.
% es decir, zeta < 1.

% Esta función debe recibir tres parámetros los cuales son
% -Sistema: Es una estructura en donde se especifica la masa equivalente,
% la constante de resorte equivalente y la constante de fricción
% equivalente.
% -t: El cual es un arreglo de tiempo.
% -carga: El arreglo que describe la carga que actúa sobre el sistema.
% Este arreglo debe tener el mismo largo que el arreglo t.

% La salida de la función son dos parámetros:
% -x: Este es un arreglo del desplazamiento del sistema.
% -tt : Este es un arreglo de tiempo, para que la respuesta del sistema     
% se vea más nitida el vector de tiempo se refina aumentando los puntos de
% cálculo.

% Si se quiere graficar el desplazamiento contra el tiempo debe realizarlo
% de ls siguiente forma:
% plot(tt,x)

nTerminos = length(t);
tiempo = t(end);
tt=linspace(1,tiempo,nTerminos*10);

x = zeros(1,length(tt));
    for i=1:nTerminos-1
        t0 = t(i);
        t1 = t(i+1);
        F = carga(i+1)-carga(i);
        x = x+ resolverSistemaCargaRampaTruncada(Sistema,t0,t1,tt,F);
    end
    
end