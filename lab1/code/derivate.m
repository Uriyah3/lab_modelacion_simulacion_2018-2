function value = derivate(f, x)
% Funcion que obtiene el valor de derivar una funcion en un punto dado.
%
% Entradas:
% f - Polinomio en el formato [1 2 1]...
% x - Punto en donde se quiere obtener el valor de la derivada
%
% Salida
% value - Valor que tiene f'(x)

% Se utiliza un delta pequeño para simular la función de derivar.
deltaX = 0.0000001;
% Se ocupa la fórmula de la derivada para obtener la derivada de la función
% en un punto dado.
value = (polyval(f, x + deltaX) - polyval(f, x)) / deltaX;
end