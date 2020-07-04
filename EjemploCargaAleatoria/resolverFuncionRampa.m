function x = resolverFuncionRampa(Sistema, arregloTiempo, t0, pendiente)

m = Sistema.m;
k = Sistema.k;
c = Sistema.c;
wn = sqrt(k/m);
zeta = c/(2*m*wn);
wd = wn*sqrt(1-zeta^2);
t = arregloTiempo;
nTiempo = length(t);
x = zeros(1,nTiempo);
for i=1:nTiempo
   
    if t(i)>t0
        tt = t(i)-t0;
        num = 2*cos(tt*wd)*zeta^3-2*cos(wd*tt)*zeta-2*sqrt(1-zeta^2)*sin(wd*tt)*zeta^2 + sqrt(1-zeta^2)*sin(wd*tt)+exp(tt*wn*zeta)*tt*wn*zeta^2-exp(tt*wn*zeta)*tt*wn-2*exp(tt*wn*zeta)*zeta^3+2*exp(tt*wn*zeta)*zeta;
        den = exp(tt*wn*zeta)*m*wn^3*(zeta^2-1);
        f = pendiente;
        x(i) = f*num/den;
    else 
        x(i) = 0;
    end
end


end