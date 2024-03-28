% Definir la ecuación diferencial simbólica
syms t y(t)
eq = diff(y, t, 2) - 4*y == 5;

% Resolver la ecuación diferencial simbólica con las condiciones iniciales
sol_symbolic = dsolve(eq, [y(0) == 0, subs(diff(y,t), t, 0) == 1]);

% Convertir la solución simbólica en una función anónima
sol_function = matlabFunction(sol_symbolic);

% Graficar la solución
figure;
fplot(sol_function, [0 5]);

xlabel('t')
ylabel('y(t)')
title('Pag. 107 | Solución de D2y - 4y = 5 | y(0) = 0, Dy(0) = 1', 'Interpreter', 'latex');
grid on
