C = 40000;
Q0 = 100;
tolerancia = 1e-6;
maxIter = 100;
iter = 0;
Q = Q0;
iterValues = Q;

while true
    Qnext = Q - (Q^2 - C) / (2*Q);
    iter = iter + 1;
    
    if abs(Qnext - Q) < tolerancia
        iterValues = [iterValues, Qnext]; % Almacena el valor actual de Q
        break;
    end
    
    Q = Qnext;
    iterValues = [iterValues, Qnext]; % Almacena el valor actual de Q
    
    if iter > maxIter
        disp('Se excedió el número máximo de iteraciones');
        break;
    end
end

disp(['La raíz encontrada es: ', num2str(Q)]);
disp(['Número de iteraciones: ', num2str(iter)]);

f = @(Q) Q.^2 - C;
Q_vals = linspace(0, 300, 400);
plot(Q_vals, f(Q_vals));
hold on;
plot (Q, f(Q), 'ro');
xlabel('Flujo de tráfico (Q)');
ylabel('f(Q)');
title('Método de NewTon-Raphson para el cálculo del tráfico vehicular');
grid on;
