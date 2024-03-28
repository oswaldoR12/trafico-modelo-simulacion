import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

# Define the differential equation
def dy_dt(y, t):
    dy = y[1]  # Primera derivada de y
    d2y = -3 * y[1] - 5 * y[0] + np.sin(t)  # Segunda derivada de y
    return [dy, d2y]

# Set the initial conditions and time points
y0 = [0, 0]  # Initial values of y and its derivative
t = np.linspace(0, 10, 1000)

# Solve the differential equation
y = odeint(dy_dt, y0, t)

# Plot the solution
plt.plot(t, y[:, 0])
plt.xlabel('t')
plt.ylabel('y')
plt.title('Solución de: D2y + 3 * Dy + 5 * y = sin(t) | Página 98')
plt.show()
