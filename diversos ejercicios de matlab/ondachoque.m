function simular_choque
    % Define los parámetros del sistema
    m = 1500; % masa del vehículo (kg)
    c = 300; % coeficiente de amortiguación (N.s/m)
    k = 20000; % constante del resorte (N/m)

    % Define la velocidad y el comportamiento del vehículo líder
    leader_speed = 40; % velocidad inicial del vehículo líder (m/s)
    leader_acceleration = 5; % aceleración del vehículo líder (m/s^2)

    % Define los parámetros del vehículo que sigue al líder
    tipo_vehiculo = {'carro', 'camión', 'autobús', 'motocicleta'};
    probabilidad_tipo = [0.3, 0.1, 0.1, 0.5];
    vehiculo = randsample(tipo_vehiculo, 1, true, probabilidad_tipo);

    if strcmp(vehiculo, 'carro')
        l = 3;
        s0 = 3;
        v_max = 20;
        a_max = 5;
        b_max = 10;
    elseif strcmp(vehiculo, 'camión')
        l = 5;
        s0 = 5;
        v_max = 15;
        a_max = 4;
        b_max = 8;
    elseif strcmp(vehiculo, 'autobús')
        l = 5;
        s0 = 4;
        v_max = 20;
        a_max = 6;
        b_max = 12;
    elseif strcmp(vehiculo, 'motocicleta')
        l = 2;
        s0 = 2;
        v_max = 25;
        a_max = 7;
        b_max = 20;
    end

    % Define la posición inicial y la velocidad del vehículo que sigue
    x0 = 0; % posición inicial (m)
    v0 = v_max; % velocidad inicial (m/s)

    % Establece las opciones para el solucionador de EDO
    options = odeset('RelTol', 1e-6, 'AbsTol', 1e-9);

    % Define la función para la dinámica del vehículo
    function dxdt = vehicle_dynamics(t, x, m, c, k, leader_speed, leader_acceleration)
        dxdt = zeros(2,1);
        dxdt(1) = x(2);
        dxdt(2) = -(c * x(2) + k * (x(1) - leader_speed)) / m + leader_acceleration;
    end

    % Resuelve las ecuaciones diferenciales
    [t, x] = ode45(@(t, x) vehicle_dynamics(t, x, m, c, k, leader_speed, leader_acceleration), [0 60], [x0 v0], options);

    % Grafica los resultados
    figure;
    subplot(2,1,1);
    plot(t, x(:,1));
    title('Posición del Vehículo que Sigue');
    xlabel('Tiempo (s)');
    ylabel('Posición (m)');
    subplot(2,1,2);
    plot(t, x(:,2));
    title('Velocidad del Vehículo que Sigue');
    xlabel('Tiempo (s)');
    ylabel('Velocidad (m/s)');
end
