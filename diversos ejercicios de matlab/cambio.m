
tiempo_final = 10; 
dt = 0.1;

posicion1 = 0; 
velocidad1 = 0; 
aceleracion1 = 2; 


posicion2 = 0; 
velocidad2 = 0; 
aceleracion2 = 1.5; 

figure;
grid on;
xlabel('Tiempo (s)');
ylabel('Posición (m)');
hold on;


for t = 0:dt:tiempo_final
    velocidad1 = velocidad1 + aceleracion1 * dt;
    velocidad2 = velocidad2 + aceleracion2 * dt;
    
    % Calculate positions
    posicion1 = posicion1 + velocidad1 * dt;
    posicion2 = posicion2 + velocidad2 * dt;
    
    % Plot positions
    plot(t, posicion1, 'ro');
    plot(t, posicion2, 'bo');
end

legend('Vehiculo 1', 'Vehiculo 2');

% Add title
title('Trayectyortia');