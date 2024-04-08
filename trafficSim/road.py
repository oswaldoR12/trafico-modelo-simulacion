from scipy.spatial import distance
from collections import deque

class Road:
    def __init__(self, start, end):
        self.start = start
        self.end = end

        self.vehicles = deque()  # Una cola (deque) para almacenar los vehículos

        self.init_properties()  # Inicializa las propiedades de la carretera

    def init_properties(self):
        # Calcula la longitud de la carretera y los ángulos seno y coseno de la misma
        self.length = distance.euclidean(self.start, self.end)
        self.angle_sin = (self.end[1]-self.start[1]) / self.length
        self.angle_cos = (self.end[0]-self.start[0]) / self.length
        # Inicializa el estado de la señal de tráfico
        self.has_traffic_signal = False

    def set_traffic_signal(self, signal, group):
        # Establece la señal de tráfico y el grupo al que pertenece la señal en la carretera
        self.traffic_signal = signal
        self.traffic_signal_group = group
        self.has_traffic_signal = True

    @property
    def traffic_signal_state(self):
        # Retorna el estado actual de la señal de tráfico
        if self.has_traffic_signal:
            i = self.traffic_signal_group
            return self.traffic_signal.current_cycle[i]
        return True

    def update(self, dt):
        n = len(self.vehicles)

        if n > 0:
            # Actualiza el primer vehículo
            self.vehicles[0].update(None, dt)
            # Actualiza los demás vehículos
            for i in range(1, n):
                lead = self.vehicles[i-1]
                self.vehicles[i].update(lead, dt)

            # Comprueba el estado de la señal de tráfico
            if self.traffic_signal_state:
                # Si la señal de tráfico está verde o no existe, deja pasar a los vehículos
                self.vehicles[0].unstop()
                for vehicle in self.vehicles:
                    vehicle.unslow()
            else:
                # Si la señal de tráfico está en rojo
                if self.vehicles[0].x >= self.length - self.traffic_signal.slow_distance:
                    # Reduce la velocidad de los vehículos en la zona de reducción de velocidad
                    self.vehicles[0].slow(self.traffic_signal.slow_factor*self.vehicles[0]._v_max)
                if self.vehicles[0].x >= self.length - self.traffic_signal.stop_distance and\
                   self.vehicles[0].x <= self.length - self.traffic_signal.stop_distance / 2:
                    # Detiene los vehículos en la zona de detención
                    self.vehicles[0].stop()
