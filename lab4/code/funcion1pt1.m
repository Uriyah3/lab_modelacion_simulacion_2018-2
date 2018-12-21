%_______________Función 1 parte 1_______________________________%

% Descripcion: Funcion que obtiene el modelo de estado a partir de un
%              diagrama de bloques.
%
% Entrada:  num1 -> polinomio numerador de la funcion de transferencia del
%           primer bloque.
%           den1 -> polinomio denominador de la funcion de transferencia
%           del primer bloque.
%           num2 -> polinomio numerador de la funcion de transferencia del
%           segundo bloque.
%           den2 -> polinomio denominador de la funcion de transferencia
%           del segundo bloque.
% SALIDAS:  matriz A del modelo de estados
%           matriz B del modelo de estados
%           matriz C del modelo de estados
%           matriz D del modelo de estados
function [A,B,C,D] = funcion1pt1(num1,den1,num2,den2)
    % Obtencion de los coeficientes del polinomio de la funcion de
    % transferencia del primer bloque:
    
    % coeficiente del numerador(en este caso libre).
    a1 = num1(2);
    % primer coeficiente del denominador que acompaña a s.
    b1 = den1(1);
    % segundo coeficiente del denominador(en este caso libre).
    c1 = den1(2);
    
    % Obtencion de los coeficientes del polinomio de la funcion de
    % transferencia del segundo bloque:
    % coeficiente del numerador(en este caso libre).
    a2 = num2(2);
    % primer coeficiente del denominador que acompaña a s.
    b2 = den2(1);
    % segundo coeficiente del denominador(en este caso libre).
    c2 = den2(2);
    
    % Se confecciona la matriz A
    A = [-c1/b1 -a1/b1; a2/b2 -c2/b2]; 
    
    % Se confecciona la matriz B
    B = [a1/b1; 0]; 
    
    % Se confecciona la matriz C
    C = [1 0]; 
    
    % Se confecciona la matriz D
    D = [0];
    
end