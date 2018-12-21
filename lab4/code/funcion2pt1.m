%_______________________Función 1 parte 1_______________________________%

% Descripcion: Funcion que obtiene la funcion de transferencia a partir
%              de un modelo de estados.
% Entradas: matriz A del modelo de estados
%           matriz B del modelo de estados
%           matriz C del modelo de estados
%           matriz D del modelo de estados
% salida:  función de transferencia que representa la salida del diagrama
%          de bloques en el dominio de Laplace.
function salida = funcion2pt1(A,B,C,D)
    
    syms s; %defino variable s
    
    % Proceso de multiplicacion de matriz identidad s con la matriz A
    % Para esto se consideran solo los valores de 1,1 y 2,2 de la matriz
    % A para operar con la identidad y confeccionar la matriz resultante
    s_A1 = s - A(1); %s - A(1,1)
    s_A4 = s - A(4); %s - A(2,2)  
    sI_A = [s_A1 -A(2); -A(3) s_A4]; %Matriz resultante
    %_______________________________________________________________
    sI_A_Inversa = inv(sI_A); %(sI - A)^-1 (inv resultado anterior)
    c_sI_A_inversa = C * sI_A_Inversa; %C¨* (sI - A)^-1
    c_sI_A_inversa_B = c_sI_A_inversa*B; %C * (sI - A)^-1*B
    c_sI_A_inversa_B_D = c_sI_A_inversa_B+D; %C * (sI - A)^-1*B + D
    salida = c_sI_A_inversa_B_D;
end