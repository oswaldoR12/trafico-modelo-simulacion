matlab
%% 
% Datos de entrada
Tasa_de_llegadas = 0.639; % veh/s
Tasa_de_servicios = 0.167; % veh/s
Num_estaciones = 8;

% Calculo de la tasa efectiva
Tasa_efectiva = Tasa_de_llegadas / Num_estaciones;

% Calculo de la intensidad de tráfico
Rho = Tasa_efectiva / Tasa_de_servicios;

% Calcular las probabilidades y parámetros adicionales:
% Calcular la probabilidad de tener cero vehículos en el sistema
probabilidad_cero_vehiculos = 1 - Rho;

% Calcular la probabilidad de gastar un tiempo t o menos en el sistema
t = 0.5; % Definir el tiempo t deseado (en segundos)
probabilidad_t_o_menos = 1 - exp(-Tasa_efectiva * t);

% Calcular la probabilidad de tener exactamente n vehículos en el sistema (para n=1)
n = 1;
probabilidad_n_vehiculos = (1 - Rho) * Rho^n;

% Calcular la longitud promedio de la fila
L = Rho / (1 - Rho);

% Calcular el número promedio de vehículos en el sistema
Ls = Rho;

% Calcular el tiempo promedio de espera en la fila
W = L / Tasa_de_llegadas;

% Calcular el tiempo promedio gastado en el sistema
Ws = 1 / Tasa_de_servicios;

% Calcular la probabilidad de tener que esperar en la fila
probabilidad_espera_en_fila = Rho;

% Imprimir resultados
fprintf('Probabilidad de tener cero vehículos en el sistema: %.4f \n', probabilidad_cero_vehiculos);
fprintf('Probabilidad de gastar un tiempo %.2f o menos en el sistema: %.4f \n', t, probabilidad_t_o_menos);
fprintf('Probabilidad de tener exactamente %d vehículos en el sistema: %.4f \n', n, probabilidad_n_vehiculos);
fprintf('Longitud promedio de la fila: %.4f \n', L);
fprintf('Número promedio de vehículos en el sistema: %.4f \n', Ls);
fprintf('Tiempo promedio de espera en la fila: %.4f s\n', W);
fprintf('Tiempo promedio gastado en el sistema: %.4f s\n', Ws);
fprintf('Probabilidad de tener que esperar en la fila: %.4f \n', probabilidad_espera_en_fila);

% Graficar la relación de espera versus intensidad de tráfico
x = 0:0.03:0.90;
y = x.^4 ./ (2 - x);
plot(x, y);
xlabel('Intensidad de tráfico (\rho)');
ylabel('Número promedio de vehículos esperando en la caseta (L_q)');
title('Relación de espera versus intensidad de tráfico');