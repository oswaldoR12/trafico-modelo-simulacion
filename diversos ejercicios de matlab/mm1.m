% Parámetros del sistema
volumen_horario = 2300; % Vehículos por hora
num_estaciones = 4;
capacidad_estacion = 600; % Vehículos por hora por estación

% Distribuir el volumen horario igualmente entre las estaciones
volumen_por_estacion = volumen_horario / num_estaciones;

% Definir la llegada y el servicio como tasas
llegada = ones(1, num_estaciones) * volumen_por_estacion; % Llegada igual a cada estación
servicio = ones(1, num_estaciones) * capacidad_estacion; % Servicio igual a cada estación

% Simular el sistema de cola
[tiempo_medio_espera, longitud_cola] = mm1_queue(llegada, servicio);

% Mostrar resultados
disp('Resultados de la simulación:');
disp(['Tiempo medio de espera: ' num2str(tiempo_medio_espera) ' horas']);
disp(['Longitud media de la cola: ' num2str(longitud_cola)]);
