%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingeniería en Informática______________
%_______________Modelación y Simulación________________________
%
% Laboratorio 4: Modelos de estado - parte 2
% Integrantes: Nicolás Mariangel| Juan Pablo Rojas
% Profesor: Gonzalo Acuña
% Ayudante: Francisco Muñoz

% Se definen los casos que se utilizan en el informe.
Area1 = 100;
Area2 = 0.15;
Area3 = 15;

% Se obtienen los modelos de estado para los 3 casos definidos. También
% se muestran los resultados de cada valor en el terminal de MATLAB.
[A1, B1, C1, D1] = vasos_comunicantes(Area1)
[A2, B2, C2, D2] = vasos_comunicantes(Area2)
[A3, B3, C3, D3] = vasos_comunicantes(Area3)

% Se convierte el modelo de estado de manera de poder ver la respuesta que
% tiene el sistema ante un escalon.
Sistema1 = ss(A1, B1, C1, D1);
Sistema2 = ss(A2, B2, C2, D2);
Sistema3 = ss(A3, B3, C3, D3);

% Se muestra la respuesta que tienen estos sistemas ante un escalon
% (primeros 10 segundos de la respuesta).
figure(1);
step(Sistema1, 10);
figure(2);
step(Sistema2, 10);
figure(3);
step(Sistema3, 10);
