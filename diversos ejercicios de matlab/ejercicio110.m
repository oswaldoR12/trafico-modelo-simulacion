% Definir la ecuación diferencial y las condiciones iniciales
eqn = 'Dy = 0.1*y - 0.02*y^2';
initial_condition = 'y(0) = 0.01';

% Resolver la ecuación diferencial
sol = dsolve(eqn, initial_condition, 'x');

% Mostrar la solución
disp('La solución de la ecuación diferencial es:');
disp(sol);

% Graficar la solución
x_values = 0:0.1:50; % Puedes ajustar el rango según tus necesidades
y_values = subs(sol, 'x', x_values);

figure;
plot(x_values, y_values);
xlabel('x');
ylabel('y');
title('Päg. 110 | Gráfico de la Solución de la Ecuación Diferencial');
grid on;

% Agregar leyenda
legend(['Ecuación Diferencial: ' eqn], 'Location', 'Best');
