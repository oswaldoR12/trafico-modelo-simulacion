syms t
v_A = 3*t^2 +5;
v_B = 2*t + 3;
a_A = diff(v_A,t);
a_B = diff(v_B,t);

figure;
fplot(v_A,[0,10], 'b','LineWidth',2); hold on;
fplot(v_B,[0,10], 'r--','LineWidth',2); 
title('Os. | Velocidad de los vehiculos A y B vs. Tiempo');
xlabel('Tiempo (s)');
ylabel('Velociddad (m/s)');
legend('Velocidad Vehiculo A', 'Velocidad Vehiculo B');
hold off;

figure;
fplot(a_A,[0,10], 'b','LineWidth',2); hold on;
fplot(a_B,[0,10], 'r--','LineWidth',2); 
title('Os. | Aceleración de los vehiculos A y B vs. Tiempo');
xlabel('Tiempo (s)');
ylabel('Aceleración (m/s^2)');
legend('AceleraciónAceleración Vehiculo A', 'Velocidad Vehiculo B');
hold off;
