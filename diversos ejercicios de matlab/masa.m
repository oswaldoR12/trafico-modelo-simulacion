% Parameters of the system
m = 1; % mass (kg)
b = 0.5; % damping coefficient (Ns/m)
k = 2; % spring constant (N/m)

% Initial conditions
x0 = 1; % initial position (m)
v0 = 0; % initial velocity (m/s)

% Time span for simulation
tspan = [0 10]; % from t = 0 to t = 10 seconds

% Define the equations of motion
ode = @(t, y) [y(2); (b/m)*y(2) - (k/m)*y(1)];

% Solve the differential equations
[t, y] = ode45(ode, tspan, [x0 v0]);

% Plot position vs time
figure;
plot(t, y(:,1), 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Position (m)');
title('Position vs Time of Mass-Spring-Damper System');

% Plot velocity vs time
figure;
plot(t, y(:,2), 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time of Mass-Spring-Damper System');