function [A, B, C, D] = vasos_comunicantes(Area)
% Función que resuelve el problema de vasos comunicantes
% usando el desarrollo que llega a la matriz expuesta en el 
% informe en la sección 4.2
% Entrada: 
%   El área de la base de los vasos.
% 
% Salida:
%   Matricez A, B, C y D del modelo de estados del sistema de vasos.
%
A = [-1/Area];  % Se define la matriz A del modelo de estados.
B = [1/Area];   % Se define la matriz B del modelo de estados.
C = [1];        % Se define la matriz C del modelo de estados.
D = [0];        % Se define la matriz D del modelo de estados.
end

