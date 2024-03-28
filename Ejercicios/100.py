import numpy as np
import matplotlib.pyplot as plt

def solve_differential_equation():
    # Parámetros
    num_points = 1000
    x_start, x_end = 0, 10
    h = (x_end - x_start) / num_points

    # Condiciones iniciales
    x_values = np.zeros(num_points)
    x_values[0] = 1  # Valor inicial de x
    x_prime_values = np.zeros(num_points)
    x_prime_values[0] = 0  # Valor inicial de la derivada de x

    # Método de Euler para resolver la ecuación diferencial
    for i in range(1, num_points):
        x_prime = x_prime_values[i - 1]
        x = x_values[i - 1]

        x_prime_values[i] = x_prime - 2 * x * h
        x_values[i] = x + x_prime * h

    return x_values

# Graficar la solución
x_values = solve_differential_equation()
time_values = np.linspace(0, 10, len(x_values))

plt.plot(time_values, x_values, label='Solución de la Ecuación Diferencial')
plt.xlabel('Tiempo')
plt.ylabel('x(t)')
plt.title('Solución de la Ecuación Diferencial: D2x + 2 * Dx + x = 0')
plt.grid(True)
plt.show()
