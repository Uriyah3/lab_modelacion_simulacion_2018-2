%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingeniería en Informática______________
%_______________Modelación y Simulación________________________
%
% Laboratorio 4: Modelos de estado - parte 1
% Integrantes: Nicolás Mariangel| Juan Pablo Rojas
% Profesor: Gonzalo Acuña
% Ayudante: Francisco Muñoz

% Modo de operación: La representacion de los polinomios del numerador y denominador
%                    se debe realizar a partir de un vector con dos coeficientes
%                    correspondietes a [Coef_s  coef_libre].

% Funcion de transferencia de bloque 1(arriba):
num_b1 = [0 5];
den_b1 = [3 7];

% Funciones de transferencia de bloque 2(arriba):
num_b2 = [0 1];
den_b2 = [1 2];

% Se aplica la funcion1pt1 para obtener el modelo de estados
% es decir las matrices A B C y D (verificar estos valores por consola).

[A,B,C,D] = funcion1pt1(num_b1,den_b1,num_b2,den_b2)

% Se aplica la funcion2pt1 para obtener la funcion de transferencia del
% diagrama a partir del modelo de estado.

funcion_transferencia = funcion2pt1(A,B,C,D)