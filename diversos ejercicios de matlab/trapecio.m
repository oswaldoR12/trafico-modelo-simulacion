
t = 0:0.01:3;
v = 4*t - 2;
desplazamiento = trapz(t, v);
v_abs = abs(4*t - 2);
distancia_total = trapz(t, v_abs);
disp(['Desplazamiento: ' num2str(desplazamiento) ' metros']);
disp(['Distancia total recorrida: ' num2str(distancia_total) ' metros']);