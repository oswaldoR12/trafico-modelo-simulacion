from sympy import symbols, Function, dsolve
import numpy as np
import matplotlib.pyplot as plt

# Define la variable y la función desconocida
t = symbols('t')
y = Function('y')

# Define la ecuación diferencial
ecuacion_diferencial = y(t).diff(t) - 4*t - 2*y(t)

# Resuelve la ecuación diferencial
solucion = dsolve(ecuacion_diferencial, y(t))
print(solucion)


# Convierte la solución a una función que se puede evaluar
y_func = solucion.rhs

# Define un rango de valores de t para la gráfica
t_vals = np.linspace(-10, 10, 400)

# Evalúa y grafica la solución
y_vals = [y_func.subs(t, val).evalf() for val in t_vals]
plt.plot(t_vals, y_vals, label='Solución de y(t)')
plt.xlabel('t')
plt.ylabel('y')
plt.title('Solución de la ecuación diferencial')
plt.grid(True)
plt.legend()
plt.show()