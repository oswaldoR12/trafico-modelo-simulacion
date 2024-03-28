% Datos de ejemplo
horas_dia = [7 8 9 10 11 12 13];
trafico = [120 180 230 280 320 370 420];

% Verifica que ambos vectores tengan la misma longitud
if length(horas_dia) ~= length(trafico)
    error('Los vectores horas_dia y trafico deben tener la misma longitud.');
end

% Ajuste lineal
coeficientes = polyfit(horas_dia, trafico, 1);

% Puntos de predicción
horas_prediccion = linspace(7, 13, 100);
trafico_predicho = polyval(coeficientes, horas_prediccion);

% Gráfico
figure; 
plot(horas_dia, trafico, 'o', 'MarkerSize', 10);
hold on;
plot(horas_prediccion, trafico_predicho, 'r-', 'LineWidth', 2);
xlabel('Hora del día');
ylabel('Tráfico vehicular');
title('Os. | Regresión lineal de Tráfico vehicular');
legend('Datos', 'Linea de regresión', 'Location', 'northwest');
grid on;

% Muestra de coeficientes
disp('Coeficientes del modelo de regresión lineal:');
disp(['Pendiente (coeficiente 1): ', num2str(coeficientes(1))]);
disp(['Término independiente (coeficiente 2): ', num2str(coeficientes(2))]);
