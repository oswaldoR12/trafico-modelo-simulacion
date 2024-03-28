% Definir la ecuación diferencial simbólica
syms t y(t)
eq = diff(y,t) + 4*y == 60;

% Resolver la ecuación diferencial simbólica con condición inicial
sol_symbolic = dsolve(eq, y(0) == 5);

% Convertir la solución simbólica en una función anónima
sol_function = matlabFunction(sol_symbolic);

% Graficar la solución
figure;
fplot(sol_function, [0 5]);

xlabel('t')
ylabel('y(t)')
title('Pag 104 Solución de la Ecuación Ds = Dy + 4y = 60 | y(0) = 5', 'Interpreter', 'latex');
grid on
