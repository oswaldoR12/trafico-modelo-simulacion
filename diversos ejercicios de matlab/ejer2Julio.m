% Datos del problema
vehiculos_totales = 2300;
vehiculos_por_estacion = 600;
num_estaciones = 4;
lambda = 0.639; % tasa de llegadas (veh/s)
mu = 0.167; % tasa de servicio (veh/s)


k = num_estaciones;

% Probabilidad de tener cero vehículos en el sistema: P(0)
P0 = 1 / (sum(1 ./ factorial(0:k-1) .* (lambda/mu).^(0:k-1)) + 1 / factorial(k) * (lambda/mu)^k * (k * mu) / (k * mu - lambda));

% Imprimir resultados
disp(['Probabilidad de tener cero vehículos en el sistema (P0): ' num2str(P0)]);
% Cálculo de la probabilidad de tener exactamente n vehículos en el sistema para n = 1, 2, 3, 4
probabilidad_1 = calcularProbabilidadN(lambda, mu, k, 1, P0);
probabilidad_2 = calcularProbabilidadN(lambda, mu, k, 2, P0);
probabilidad_3 = calcularProbabilidadN(lambda, mu, k, 3, P0);
probabilidad_4 = calcularProbabilidadN(lambda, mu, k, 4, P0);
% Mostrar resultados
disp('Probabilidad de tener exactamente n vehículos en el sistema:');
disp(['p(1) = ' num2str(probabilidad_1)]);
disp(['p(2) = ' num2str(probabilidad_2)]);
disp(['p(3) = ' num2str(probabilidad_3)]);
disp(['p(4) = ' num2str(probabilidad_4)]);

% Longitud promedio de la fila: Q
Q = (lambda * mu * (lambda/mu)^k) / ((factorial(k-1) * (k * mu - lambda)^2)) * P0;
disp(['Longitud promedio de la fila (Q): ' num2str(Q) ' veh']);

% Número promedio de vehículos en el sistema: n
n = Q + (lambda / mu);
disp(['Número promedio de vehículos en el sistema (n): ' num2str(n) ' veh']);

% Tiempo promedio de espera en la fila: tq
tq = ( mu * (lambda/mu)^k) / ((factorial(k-1)) * (k * mu - lambda)^2) * P0;

% Mostrar resultados
disp(['Tiempo promedio de espera en la fila (tq): ' num2str(tq) ' s/veh']);


ts = tq+ (1/mu);
% Mostrar resultados
disp(['Tiempo promedio gastado en el sistema(ts): ' num2str(ts) ' s/veh']);


% Calcular el factorial de k
factorial_k = factorial(k);

% Calcular la probabilidad P(n >= 4)
p_n_k = (lambda / mu)^k * ( P0 / (factorial_k * (1 - lambda / (mu * k))));
disp(['La probabilidad tener que esperar en la fina P(n >= 4) es: ', num2str(p_n_k)]);

t = 100;
% Calcular la probabilidad de gastar un tiempo t o menos en el sistema
probabilidad_t = 1 - exp(-mu * t) * (1 + (p_n_k / k) * (1 - exp(-mu * k * t)) * (1 - (lambda / (mu * k)) - 1/k)) / (1 - (lambda / (mu * k)) - 1/k);


% Mostrar resultado
disp(['La probabilidad de gastar un tiempo ' num2str(t) ' o menos en el sistema es: ' num2str(probabilidad_t)]);




probabilidades = [probabilidad_1, probabilidad_2, probabilidad_3, probabilidad_4];
n_values = {'Servicio 1', 'Servicio 2', 'Servicio 3', 'Servicio 4'};


figure;
bar(n_values, probabilidades');
xlabel('Número de vehículos en el sistema');
ylabel('Probabilidad');
title('Probabilidad de tener exactamente n vehículos en el sistema (Por servicio)');
legend(servicios);






% Definir el rango de tiempo desde 0 hasta 3600 segundos
t_values = 0:60;

% Inicializar un vector para almacenar las probabilidades
probabilidades = zeros(size(t_values));

% Calcular la probabilidad para cada valor de t
for i = 1:length(t_values)
    t = t_values(i);
    probabilidad_t = 1 - exp(-mu * t) * (1 + (p_n_k / k) * (1 - exp(-mu * k * t)) * (1 - (lambda / (mu * k)) - 1/k)) / (1 - (lambda / (mu * k)) - 1/k);
    probabilidades(i) = probabilidad_t;
end

% Crear la gráfica
plot(t_values, probabilidades);
xlabel('Tiempo (segundos)');
ylabel('Probabilidad');
title('Probabilidad de perder un tiempo 60 seg o menos en el sistema');
grid on;



probabilidades = [probabilidad_1, probabilidad_2, probabilidad_3, probabilidad_4];
n_values = {'Servicio 1', 'Servicio 2', 'Servicio 3', 'Servicio 4'};


figure;
bar(n_values, probabilidades');
xlabel('Número de vehículos en el sistema');
ylabel('Probabilidad');
title('Probabilidad de tener exactamente n vehículos en el sistema (Por servicio)');
legend(servicios);


% Probabilidad de tener exactamente n vehículos en el sistema: p(n)
function pn = calcularProbabilidadN(lambda, mu, k, n, P0)
    if n <= k
        pn = 1 / factorial(n) * (lambda / mu)^n * P0;
    else
        pn = 1 / factorial(k) * (k / (k^(n - k))) * (lambda / mu)^n * P0;
    end
end
