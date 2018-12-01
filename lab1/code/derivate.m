function value = derivate(f, x)
% Funcion que obtiene el valor de derivar una funcion en un punto dado.
%
% Entradas:
% f - Polinomio en el formato [1 2 1]...
% x - Punto en donde se quiere obtener el valor de la derivada
%
% Salida
% value - Valor que tiene f'(x)

% Se utiliza un delta peque�o para simular la funci�n de derivar.
deltaX = 0.0000001;
% Se ocupa la f�rmula de la derivada para obtener la derivada de la funci�n
% en un punto dado.
value = (polyval(f, x + deltaX) - polyval(f, x)) / deltaX;
end