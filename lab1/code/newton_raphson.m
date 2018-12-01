function solX = newton_raphson(pol, maxIter, minErr, initialValue)
% Función para encontrar la aproximación de la raíz de un polinomio
% por medio del método Newton-Raphson
%
% Entradas:
% pol - Polinomio inicial en el siguiente formato:
%       x^2 + 2*x + 1 -> [1 2 1]
% maxIter - Numero maximo de iteraciones que debe ejecutar este algoritmo
% para llegar a una aproximación.
% minErr - Error minimo al que se debe llegar para detener el algoritmo y
% encontrar un raíz antes de cumplir con la maximas iteraciones definidas.
% initialValue - Valor inicial que se utiliza para comenzar la aproximación
% de la raíz del polinomio
%
% Salida:
% solX - Aproximación de la raíz de la solución al polinomio.
%
% Ejemplo de uso:
% solucion = newton_raphson([1 2 1], 100, 0.0000001, 2)

% Caso base del algoritmo, si se acaban las iteraciones se detiene.
if(maxIter == 0)
    % Si ya no hay mas iteraciones, la solucion es el valor inicial que se
    % encontró hasta esta iteración
    solX = initialValue;
else
    % Calcular la derivada del polinomio en el punto initialValue
    df = derivate(pol, initialValue);
    % Obtener la siguiente aproximación de x por el método Newton
    x = initialValue - polyval(pol, initialValue)/df;
    % Calcular el error, es decir, que tan diferente es la nueva
    % aproximación comparada con la anterior, mientras más grande la
    % diferencia, mayor el error y viceversa.
    e = abs(x - initialValue) / abs(x);
    % Si el error calculado es menor al mínimo error definido entonces
    % retornar la aproximación de la raíz del polinomio.
    if (e < minErr)
        solX = x;
    else
        % Si no entonces seguir calculando Newton Raphson hasta que el
        % error sea menor o se cumplan todas las iteraciones (por lo que se
        % resta una iteracion de maxIter en la recursividad).
        solX = newton_raphson(pol, maxIter-1, minErr, x);
    end
end
