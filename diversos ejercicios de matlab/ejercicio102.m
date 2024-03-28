% Definir la ecuación diferencial simbólica
syms t a x(t)
eq = diff(x,t) == a*x^2;

% Resolver la ecuación diferencial simbólica con condición inicial
C1 = sym('C1');
sol_symbolic = dsolve(eq, x(0) == C1);

% Definir valores específicos para la constante C1 y el rango de a
C1_value = 1; % Puedes ajustar este valor según sea necesario
a_range = linspace(-2, 2, 100);

% Graficar la solución variando a
figure;
hold on;
for i = 1:length(a_range)
    sol_function = subs(sol_symbolic, C1, C1_value);
    sol_function = subs(sol_function, a, a_range(i));
    fplot(sol_function, [0 1], 'DisplayName', ['a = ' num2str(a_range(i))]);
end

xlabel('t')
ylabel('x(t)')
title(['Solución de la Ecuación Ds = a*x^2 | Pag 102. C_1 = ' num2str(C1_value)], 'Interpreter', 'latex');
legend
grid on
hold off
