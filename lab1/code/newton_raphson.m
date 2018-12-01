function solX = newton_raphson(pol, maxIter, minErr, initialValue)
% Funci�n para encontrar la aproximaci�n de la ra�z de un polinomio
% por medio del m�todo Newton-Raphson
%
% Entradas:
% pol - Polinomio inicial en el siguiente formato:
%       x^2 + 2*x + 1 -> [1 2 1]
% maxIter - Numero maximo de iteraciones que debe ejecutar este algoritmo
% para llegar a una aproximaci�n.
% minErr - Error minimo al que se debe llegar para detener el algoritmo y
% encontrar un ra�z antes de cumplir con la maximas iteraciones definidas.
% initialValue - Valor inicial que se utiliza para comenzar la aproximaci�n
% de la ra�z del polinomio
%
% Salida:
% solX - Aproximaci�n de la ra�z de la soluci�n al polinomio.
%
% Ejemplo de uso:
% solucion = newton_raphson([1 2 1], 100, 0.0000001, 2)

% Caso base del algoritmo, si se acaban las iteraciones se detiene.
if(maxIter == 0)
    % Si ya no hay mas iteraciones, la solucion es el valor inicial que se
    % encontr� hasta esta iteraci�n
    solX = initialValue;
else
    % Calcular la derivada del polinomio en el punto initialValue
    df = derivate(pol, initialValue);
    % Obtener la siguiente aproximaci�n de x por el m�todo Newton
    x = initialValue - polyval(pol, initialValue)/df;
    % Calcular el error, es decir, que tan diferente es la nueva
    % aproximaci�n comparada con la anterior, mientras m�s grande la
    % diferencia, mayor el error y viceversa.
    e = abs(x - initialValue) / abs(x);
    % Si el error calculado es menor al m�nimo error definido entonces
    % retornar la aproximaci�n de la ra�z del polinomio.
    if (e < minErr)
        solX = x;
    else
        % Si no entonces seguir calculando Newton Raphson hasta que el
        % error sea menor o se cumplan todas las iteraciones (por lo que se
        % resta una iteracion de maxIter en la recursividad).
        solX = newton_raphson(pol, maxIter-1, minErr, x);
    end
end
