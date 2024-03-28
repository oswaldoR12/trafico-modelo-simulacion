% Datos
tiempo = [1.16667, 398.00000, 780.83333];
vehiculos_pasados = [0, 523, 1126];
vehiculos_presentes = [1, 127, 145];

% Calcular tasas de cambio
dP_dt = diff(vehiculos_pasados) ./ diff(tiempo);
dV_dt = diff(vehiculos_presentes) ./ diff(tiempo);

% Graficar las tasas de cambio
figure;
subplot(2,1,1);
plot(tiempo(1:end-1), dP_dt, '-o');
xlabel('Tiempo (s)');
ylabel('Tasa de cambio de vehículos pasados');
title('Tasa de cambio de vehículos pasados en función del tiempo');

subplot(2,1,2);
plot(tiempo(1:end-1), dV_dt, '-o');
xlabel('Tiempo (s)');
ylabel('Tasa de cambio de vehículos presentes');
title('Tasa de cambio de vehículos presentes en función del tiempo');
