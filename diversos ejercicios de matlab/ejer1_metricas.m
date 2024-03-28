% Parámetros del sistema
lambda = 0.133; % tasa de llegadas (veh/s)
mu = 0.144; % tasa de servicio (veh/s)
total_time = 3600; % Tiempo total de simulación (s)

% Crear nuevo modelo de SimEvents
model = 'MM1_SimEvents_Model';
open_system(new_system(model));

% Añadir bloques de SimEvents
add_block('simevents/Entity Generator', [model '/Vehicle Generator']);
add_block('simevents/Entity Server', [model '/Service Station']);
add_block('simevents/Queue', [model '/Queue']);

% Establecer parámetros de los bloques
set_param([model '/Vehicle Generator'], 'InterarrivalTime', '1/lambda');
set_param([model '/Service Station'], 'ServiceTime', '1/mu');

% Conectar bloques
add_line(model, 'Vehicle Generator/1', 'Queue/1');
add_line(model, 'Queue/1', 'Service Station/1');

% Configurar el tiempo de simulación
set_param(model, 'StopTime', num2str(total_time));

% Ejecutar la simulación
sim(model);

% Visualización de resultados
% La visualización de resultados se puede hacer a través de la interfaz gráfica de SimEvents
% o utilizando funciones de MATLAB para extraer y analizar datos de la simulación.
