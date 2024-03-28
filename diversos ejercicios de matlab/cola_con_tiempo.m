% Parámetros del sistema
lambda = 0.133; % tasa de llegadas (veh/s)
mu = 0.144; % tasa de servicio (veh/s)
total_time = 3600; % Tiempo total de simulación (s)

% Cálculos
n = lambda / (mu - lambda);
Q = (lambda^2) / (mu * (mu - lambda));
ts = 1 / (mu - lambda);
tq = lambda / (mu * (mu - lambda));
P = lambda / mu * 100;
I = (1 - lambda / mu) * 100;

% Imprimir resultados
disp(['Probabilidad de tener exactamente n vehículos en el sistema: p(n) = ' num2str(probabilidad_n(1, lambda, mu))]);
disp(['Número promedio de vehículos en el sistema (n) = ' num2str(n)]);
disp(['Longitud promedio de la línea de espera (Q) = ' num2str(Q)]);
disp(['Tiempo promedio gastado en el sistema (ts) = ' num2str(ts)]);
disp(['Tiempo promedio de espera en la fila (tq) = ' num2str(tq)]);
disp(['Porcentaje de utilización del servicio (P) = ' num2str(P) '%']);
disp(['Porcentaje de encontrar el sistema inactivo (I) = ' num2str(I) '%']);
disp(['Probabilidad de tener que gastar un tiempo t en el sistema: p(t) = ' num2str(probabilidad_t(1, lambda, mu))]);
disp(['Probabilidad de tener que esperar un tiempo t o menos en el sistema: P(ts<= t) = ' num2str(probabilidad_ts(1, lambda, mu))]);
disp(['Probabilidad de tener que esperar un tiempo t o menos en la fila: P(tq<= t) = ' num2str(probabilidad_tq(1, lambda, mu))]);

% Definir los intervalos de tiempo
t = linspace(0, total_time, 1000);

% Calcular las probabilidades
prob_n = (lambda / mu).^t .* (1 - lambda / mu);
prob_t = (mu - lambda) * exp((lambda - mu) * t);
prob_ts = 1 - exp(-(1 - lambda / mu) * mu * t);
prob_tq = 1 - (lambda / mu) * exp(-(1 - lambda / mu) * mu * t);


% Crear un vector para los tiempos promedio
tiempos = [ts, tq];

% Etiquetas para las barras
etiquetas = {'Tiempo promedio gastado en el sistema (ts)', 'Tiempo promedio de espera en la fila (tq)'};

% Crear gráfico de barras
figure;
bar(tiempos);
xticklabels(etiquetas);
ylabel('Tiempo (s)');
title('Comparación de tiempos promedio');

% Mostrar los valores en las barras
text(1:length(tiempos), tiempos, num2str(tiempos'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

% Ajustar los límites del eje y para una mejor visualización
ylim([0 max(tiempos) * 1.2]);
% Gráfico de probabilidades
figure;

subplot(2, 2, 1);
plot(t, prob_n);
title('Probabilidad de tener exactamente n vehículos en el sistema');
xlabel('Tiempo (s)');
ylabel('Probabilidad');

subplot(2, 2, 2);
plot(t, prob_t);
title('Probabilidad de gastar un tiempo t en el sistema');
xlabel('Tiempo (s)');
ylabel('Probabilidad');

subplot(2, 2, 3);
plot(t, prob_ts);
title('Probabilidad de esperar un tiempo t o menos en el sistema');
xlabel('Tiempo (s)');
ylabel('Probabilidad');

subplot(2, 2, 4);
plot(t, prob_tq);
title('Probabilidad de esperar un tiempo t o menos en la fila');
xlabel('Tiempo (s)');
ylabel('Probabilidad');

% Calcular la longitud de la cola en función del tiempo
cola = (lambda / mu) * (1 - exp(-(mu - lambda) * t));

% Graficar la evolución de la cola
figure;
plot(t, cola);
title('Evolución de la cola en función del tiempo');
xlabel('Tiempo (s)');
ylabel('Longitud de la cola');

% Definición de funciones
function prob = probabilidad_n(n, lambda, mu)
    prob = (lambda / mu)^12 * (1 - lambda / mu);
end

function prob_t = probabilidad_t(t, lambda, mu)
    prob_t = (mu - lambda) * exp((lambda - mu) * t);
end

function prob_ts = probabilidad_ts(t, lambda, mu)
    prob_ts = 1 - exp(-(1 - lambda / mu) * mu * t);
end

function prob_tq = probabilidad_tq(t, lambda, mu)
    prob_tq = 1 - (lambda / mu) * exp(-(1 - lambda / mu) * mu * t);
end
