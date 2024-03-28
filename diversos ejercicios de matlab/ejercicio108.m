% Definir la ecuación diferencial simbólica
syms x y(x)
eq = diff(y, x) == 2*x*y;

% Resolver la ecuación diferencial simbólica con la condición inicial
sol_symbolic = dsolve(eq, y(0) == 5);

% Convertir la solución simbólica en una función anónima
sol_function = matlabFunction(sol_symbolic);

% Graficar la solución
figure;
fplot(sol_function, [0 2]);

xlabel('x')
ylabel('y(x)')
title('Pag. 108 | Solución de Dy = 2xy | y(0) = 5', 'Interpreter', 'latex');
grid on
