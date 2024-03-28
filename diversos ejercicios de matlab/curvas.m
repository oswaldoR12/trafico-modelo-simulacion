% Definir datos de prueba
start = [0, 0];
end_point = [10, 10];
control_point = [5, 0]; % Punto de control arbitrario

% Calcular la ruta curva
resolution = 100; % Resolución de la curva
curve = curve_points(start, end_point, control_point, resolution);

% Graficar la curva
figure;
plot(curve(:, 1), curve(:, 2), '-r'); % Graficar la curva en rojo
hold on;
plot(start(1), start(2), 'o', 'MarkerFaceColor', 'b'); % Punto de inicio
plot(end_point(1), end_point(2), 'o', 'MarkerFaceColor', 'b'); % Punto final
plot(control_point(1), control_point(2), 'o', 'MarkerFaceColor', 'g'); % Punto de control
xlabel('X');
ylabel('Y');
title('Ruta Curva');
legend('Curva', 'Inicio', 'Fin', 'Control');
hold off;
