function vector_sum_minus(vector)
% Funci�n que recibe un vector y calcula la raiz cuadrada de la suma de los
% 4 elementos de mayor valor menos el resultado de la suma de la ra�z 
% cuadrada de los 4 elementos de menor valor.
% Luego esta funci�n despliega por pantalla el resultado de este calculo.
% 
% Entrada:
% vector - Vector con valores que deben ser verificados antes de realizar
% el calculo descrito.
%
% Ejemplo de uso:
% vector_sum_minus([8 7 6 4 2 1 5 123])

% Verificar que todos los datos del vector sean num�ricos
if (~isnumeric(vector))
    fprintf("ERROR: Hay uno o m�s elementos del vector que no son datos n�mericos.\n");
    return;
end

% Verificar que el vector tenga al menos 8 elementos para que los 4 menores
% y los 4 mayores elementos sean distintos.
if length(vector) < 8
    fprintf("ERROR: El vector debe tener al menos 8 elementos num�ricos.\n")
    return;
end

sortedVector = sort(vector);
% Obtener la ra�z cuadrada de la suma de los 4 menores elementos del vector
lesserFour = sqrt(sortedVector(1) + sortedVector(2) + sortedVector(3) + sortedVector(4));

% Calcular el �ltimo indice del vector para poder obtener los 4 mayores
% elementos en el vector
n = length(sortedVector);
% Obtener la ra�z cuadrada de la suma de los 4 mayores elementos del vector
greaterFour = sqrt(sortedVector(n) + sortedVector(n-1) + sortedVector(n-2) + sortedVector(n-3));

% Obtener el resultado de restar la suma de los 4 mayores elementos del
% vector con la ra�z cuadrada de la suma de los 4 menores elementos del 
% vector
result = greaterFour - lesserFour;

% Imprimir en pantalla el resultado obtenido.
fprintf("El resultado obtenido al restarle la ra�z cuadrada de la suma de los 4 elementos\nde menor valor, al resultado de la suma de la ra�z cuadrada de los 4 elementos\nde mayor valor es: %.6f\n", result);
end

