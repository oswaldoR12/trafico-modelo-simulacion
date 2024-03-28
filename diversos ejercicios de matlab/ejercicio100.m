% Definir la función del sistema de EDO
dydt_system = @(t, y) [y(2); -2*y(2) - y(1)];

% Definir el rango de tiempo
tspan_system = [0 10];

% Condiciones iniciales
y0_system = [1; 0];  % Puedes ajustar las condiciones iniciales según tus necesidades

% Resolver el sistema de EDO usando ode45
[t_system, y_system] = ode45(dydt_system, tspan_system, y0_system);

% Graficar la solución
figure;
plot(t_system, y_system(:, 1), '-o')
xlabel('t')
ylabel('x')
title('Solución de D^2x + 2Dx + x = 0 |Pag 100')
grid on
