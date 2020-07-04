function x = resolverSistemaCargaRampaTruncada(Sistema,t0,t1,arregloTiempo,F)

pendiente = F/(t1-t0);
t = arregloTiempo;

x = resolverFuncionRampa(Sistema, t, t0, pendiente);
x = x + resolverFuncionRampa(Sistema, t, t1, -pendiente);



end
