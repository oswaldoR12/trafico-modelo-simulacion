% Definir la función de la EDO
dydt = @(t, y) 4*t + 2*y;

% Definir el rango de tiempo
tspan = [0 10];  % Puedes ajustar este rango según tus necesidades

% Condiciones iniciales
y0 = 0;  % Valor inicial de y en t = 0

% Resolver la EDO usando ode45
[t, y] = ode45(dydt, tspan, y0);

% Graficar la solución
plot(t, y, '-o')
xlabel('t')
ylabel('y')
title('Solución de \frac{dy}{dt} = 4t + 2y | Pag 99')
grid on
