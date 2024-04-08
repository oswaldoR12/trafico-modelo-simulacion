from .road import Road
from copy import deepcopy
from .vehicle_generator import VehicleGenerator
from .traffic_signal import TrafficSignal

class Simulation:
    vehiclesPassed = 0
    vehiclesPresent = 0
    vehicleRate = 0
    isPaused = False

    def __init__(self, config={}):
        # Establece la configuración predeterminada
        self.set_default_config()

        # Actualiza la configuración con los valores proporcionados
        for attr, val in config.items():
            setattr(self, attr, val)

    def set_default_config(self):
        # Configuración predeterminada de la simulación
        self.t = 1.0            # Tiempo de simulación
        self.frame_count = 0    # Contador de fotogramas
        self.dt = 1.0/60.0      # Paso de tiempo de la simulación
        self.roads = []         # Lista para almacenar las carreteras
        self.generators = []    # Lista para almacenar los generadores de vehículos
        self.traffic_signals = []  # Lista para almacenar las señales de tráfico

    def create_road(self, start, end):
        # Crea una nueva carretera y la agrega a la lista de carreteras
        road = Road(start, end)
        self.roads.append(road)
        return road

    def create_roads(self, road_list):
        # Crea múltiples carreteras a partir de una lista de pares de puntos de inicio y fin
        for road in road_list:
            self.create_road(*road)

    def create_gen(self, config={}):
        # Crea un generador de vehículos y lo agrega a la lista de generadores
        gen = VehicleGenerator(self, config)
        self.generators.append(gen)
        Simulation.vehicleRate = gen.vehicle_rate
        return gen

    def create_signal(self, roads, config={}):
        # Crea una señal de tráfico y la agrega a la lista de señales de tráfico
        roads = [[self.roads[i] for i in road_group] for road_group in roads]
        sig = TrafficSignal(roads, config)
        self.traffic_signals.append(sig)
        return sig

    def update(self):
        # Actualiza cada carretera
        for road in self.roads:
            road.update(self.dt)

        # Agrega vehículos
        for gen in self.generators:
            gen.vehicle_rate = self.vehicleRate
            gen.update()

        # Actualiza las señales de tráfico
        for signal in self.traffic_signals:
            signal.update(self)

        # Verifica si algún vehículo está fuera de la carretera
        for road in self.roads:
            if len(road.vehicles) == 0:
                continue
            vehicle = road.vehicles[0]
            if vehicle.x >= road.length:
                if vehicle.current_road_index + 1 < len(vehicle.path):
                    vehicle.current_road_index += 1
                    new_vehicle = deepcopy(vehicle)
                    new_vehicle.x = 0
                    next_road_index = vehicle.path[vehicle.current_road_index]
                    self.roads[next_road_index].vehicles.append(new_vehicle)
                else:
                    Simulation.vehiclesPassed += 1
                road.vehicles.popleft() 

        # Verifica el número de vehículos presentes en la simulación
        Simulation.vehiclesPresent = sum(len(road.vehicles) for road in self.roads)

        # Incrementa el tiempo y el contador de fotogramas
        self.t += self.dt
        self.frame_count += 1

    def run(self, steps):
        # Ejecuta la simulación durante un número dado de pasos
        for _ in range(steps):
            self.update()

    def pause(self):
        # Pausa la simulación
        self.isPaused = True

    def resume(self):
        # Reanuda la simulación
        self.isPaused = False
