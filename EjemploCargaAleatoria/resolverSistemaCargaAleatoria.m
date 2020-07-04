function [x,tt] = resolverSistemaCargaAleatoria(Sistema, t, carga)

% Esta funci�n permite determinar la respuesta de un sistema mec�nico LINEAL de   
% un grado de libertad asumiendo condiciones iniciales iguales a cero.

% Es v�lido �nicamente cuando el factor de amorgiguamiento es menor a uno.
% es decir, zeta < 1.

% Esta funci�n debe recibir tres par�metros los cuales son
% -Sistema: Es una estructura en donde se especifica la masa equivalente,
% la constante de resorte equivalente y la constante de fricci�n
% equivalente.
% -t: El cual es un arreglo de tiempo.
% -carga: El arreglo que describe la carga que act�a sobre el sistema.
% Este arreglo debe tener el mismo largo que el arreglo t.

% La salida de la funci�n son dos par�metros:
% -x: Este es un arreglo del desplazamiento del sistema.
% -tt : Este es un arreglo de tiempo, para que la respuesta del sistema     
% se vea m�s nitida el vector de tiempo se refina aumentando los puntos de
% c�lculo.

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