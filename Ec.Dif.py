import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# Definir la ecuación diferencial
def traffic_model(D, t, Q):
    return Q - np.gradient(Q, t)

# Parámetros del caso hipotético
time = np.linspace(0, 10, 100)  # tiempo de 0 a 10 unidades
position = np.linspace(0, 1, 100)  # posición en la carretera de 0 a 1 unidades
Q = np.sin(2 * np.pi * time) * np.exp(-position)


# Condición inicial
D0 = np.zeros(len(time))

# Resolver la ecuación diferencial
result = odeint(lambda t, D: traffic_model(D, t, Q), D0, time)

# Graficar la solución
plt.figure(figsize=(10, 6))
plt.plot(time, result, label='Densidad de Tráfico')
plt.xlabel('Tiempo')
plt.ylabel('Densidad de Tráfico')
plt.title('Modelo de Tráfico - Caso Hipotético')
plt.legend()
plt.grid(True)
plt.show()