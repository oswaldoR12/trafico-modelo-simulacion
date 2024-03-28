lambda = 2300; % tasa de llegadas (veh/h)
mu = 600; % tasa de servicio (veh/h)
k = 4; % número de vehículos en el sistema (la ocupación de la cola)
P0 = 0.0042; % probabilidad de que no haya vehículos en el sistema (el estado estable)

tq = (mu * (lambda/mu)^k) / ((factorial(k-1)) * (k * mu - lambda)^2) * P0;
disp(['Tiempo promedio de espera en la fila (tq): ' num2str(tq)]);
