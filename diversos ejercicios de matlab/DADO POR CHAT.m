% Datos del problema
vehiculos_totales = 2300;
vehiculos_por_estacion = 600;
num_estaciones = 4;
lambda = vehiculos_totales / 3600; % tasa de llegadas (veh/s)
mu = vehiculos_por_estacion / 3600; % tasa de servicio (veh/s)
k = num_estaciones;

% Probabilidad de tener cero vehículos en el sistema: P(0)
P0 = 1 / (sum(1 ./ factorial(0:k-1) .* (lambda/mu).^(0:k-1)) + 1 / (factorial(k) * (lambda/mu)^k * (k * mu) / (k * mu - lambda)));

% Longitud promedio de la fila: Q
Q = (lambda * mu * (lambda/mu)^k) / ((factorial(k-1) * (k * mu - lambda)^2) * P0);

% Número promedio de vehículos en el sistema: n
n = Q + (lambda / mu);

% Tiempo promedio de espera en la fila: tq
tq = Q / lambda;

% Tiempo promedio gastado en el sistema: ts
ts = tq + 1 / mu;

% Probabilidad de tener que esperar en la fila: P(n >= k)
P_n_k = sum((lambda / mu)^k * P0 / (factorial(k) * (1 - lambda / (mu * k))));

% Probabilidad de tener que gastar un tiempo t o menos en el sistema: P(ts <= t)
t_max = ts; % Definir el tiempo máximo
P_ts_t = 1 - exp(-mu * t_max);

% Cálculo de la probabilidad de tener exactamente n vehículos en el sistema para n desde 0 hasta k+2
probabilidad_n = zeros(1, k+2);
for n = 0:k+2
    probabilidad_n(n+1) = calcularProbabilidadN(lambda, mu, k, n, P0);
end

disp('Probabilidad de tener exactamente n vehículos en el sistema:');
disp(probabilidad_n);

% Imprimir resultados
disp(['Probabilidad de tener cero vehículos en el sistema (P0): ' num2str(P0)]);
disp(['Longitud promedio de la fila (Q): ' num2str(Q)]);
disp(['Número promedio de vehículos en el sistema (n): ' num2str(n)]);
disp(['Tiempo promedio de espera en la fila (tq): ' num2str(tq)]);
disp(['Tiempo promedio gastado en el sistema (ts): ' num2str(ts)]);
disp(['Probabilidad de tener que esperar en la fila (P(n >= k)): ' num2str(P_n_k)]);
disp(['Probabilidad de tener que gastar un tiempo t o menos en el sistema (P(ts <= t)): ' num2str(P_ts_t)]);

function pn = calcularProbabilidadN(lambda, mu, k, n, P0)
    if n <= k
        pn = 1 / (n * (lambda / mu)^n * P0);
    else
        pn = 1 / k * (k / (k^(n - k))) * (lambda / mu)^n * P0);
    end
end

