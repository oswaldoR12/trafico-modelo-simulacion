t = 0:0.1:10; 

v_A = 3 * t;
v_B = 2 * t + 4;

s_A = cumtrapz(t, v_A);
s_B = cumtrapz(t, v_B);

figure;
subplot (2,1,1);
plot (t, v_A, 'b-', t, v_B, 'r--');
legend ('Vehiculo A', 'Vehículo B');
title('Velocidad vs. Tiempo');
xlabel('Tiempo (s)');
ylabel('Velocidad (m/s)');

subplot (2,1,2);
plot (t, s_A, 'b-', t, s_B, 'r--');
legend('Vehículo A', 'Vehiculo B');
title('Desplazamiento vs. Tiempo');
xlabel('Tiempo (s)');
ylabel('Desplazamiento (m)');