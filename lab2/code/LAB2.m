%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingeniería en Informática______________
%_______________Modelación y Simulación________________________
%
% Laboratorio 2: Sistemas de primer y segundo orden
% Integrantes: Nicolás Mariángel | Juan Pablo Rojas
% Profesor: Gonzalo Acuña
% Ayudante: Francisco Muñoz
%
%______________________Primera Parte_____________________________
% 

% Funciones de transferencia obtenidas al desarrollar las funciones
% originales
% Primer orden
numPrimer = [3 0];
denPrimer = [2 1];

% Segundo orden
numSegundo = [0 0 1];
denSegundo = [1 4 3];

% Tercer orden
numTercer = [0 0 0 3];
denTercer = [3 0 2 5];

% Obtener ceros, polos y ganancia estatica de cada función (lazo abierto)
% Función de primer orden
[ceros1,polos1,gan1] = tf2zp(numPrimer, denPrimer)
% Función de segundo orden
[ceros2,polos2,gan2] = tf2zp(numSegundo, denSegundo)
% Función de tercer orden
[ceros3,polos3,gan3] = tf2zp(numTercer, denTercer)

% Transformar numeradores y denominadores a función de lazo cerrado
[numPrimerCL, denPrimerCL] = cloop(numPrimer, denPrimer);
[numSegundoCL, denSegundoCL] = cloop(numSegundo, denSegundo);
[numTercerCL, denTercerCL] = cloop(numTercer, denTercer);

% Obtener ceros, polos y ganancia estatica de cada función (lazo cerrado)
% Función de primer orden
[cerosCL1,polosCL1,ganCL1] = tf2zp(numPrimerCL, denPrimerCL)
% Función de segundo orden
[cerosCL2,polosCL2,ganCL2] = tf2zp(numSegundoCL, denSegundoCL)
% Función de tercer orden
[cerosCL3,polosCL3,ganCL3] = tf2zp(numTercerCL, denTercerCL)

% Obtener la información de cada sistema (tiempo de estabilización)
% Se utiliza la función tf para crear la función de transferencia
% utilizando numeradores y denominadores, para luego obtener información
% sobre la respuesta que tiene cada sistema a un escalón.
primerStepInfo = stepinfo(tf(numPrimer, denPrimer));
primerCLStepInfo = stepinfo(tf(numPrimerCL, denPrimerCL));
segundoStepInfo = stepinfo(tf(numSegundo, denSegundo));
segundoCLStepInfo = stepinfo(tf(numSegundoCL, denSegundoCL));
tercerStepInfo = stepinfo(tf(numTercer, denTercer));
tercerCLStepInfo = stepinfo(tf(numTercerCL, denTercerCL));

% Luego se muestra el SettlingTime (tiempo de estabilización)
fprintf("Funcion de primer orden - lazo abierto [Tiempo estabilización]: %f (s)\n", primerStepInfo.SettlingTime);
fprintf("Funcion de primer orden - lazo cerrado [Tiempo estabilización]: %f (s)\n", primerCLStepInfo.SettlingTime);
fprintf("Funcion de segundo orden - lazo abierto [Tiempo estabilización]: %f (s)\n", segundoStepInfo.SettlingTime);
fprintf("Funcion de segundo orden - lazo cerrado [Tiempo estabilización]: %f (s)\n", segundoCLStepInfo.SettlingTime);
fprintf("Funcion de tercer orden - lazo abierto [Tiempo estabilización]: %f (s)\n", tercerStepInfo.SettlingTime);
fprintf("Funcion de tercer orden - lazo cerrado [Tiempo estabilización]: %f (s)\n", tercerCLStepInfo.SettlingTime);

% Realizar gráficos de lazo cerrado y lazo abierto de cada función
% Función de primer orden
figure(1)
step(numPrimer, denPrimer)
figure(2)
step(numPrimerCL, denPrimerCL)

% Función de segundo orden
figure(3)
step(numSegundo, denSegundo)
figure(4)
step(numSegundoCL, denSegundoCL)

% Función de tercer orden
figure(5)
step(numTercer, denTercer)
figure(6)
step(numTercerCL, denTercerCL)

figure(7)
%
%______________________Segunda Parte_____________________________
%  
% Valores equivalentes obtenidos simplificando a mano
numerador = [+2520 +21264 +40392 +35984 +47522 +40911 +25082 +21318 +12496 +1608 -712 +80];
denominador = [+525 +7055 +27975 +30692 +28851 +51823 +15193 +24320 +11058 -1380 +728 -1840 -960];

% Escribir las funciones de transferencia (enunciado) en función de sus 
% numeradores y denominadores para poder procesarlas con MATLAB.
num1 = [0 0 4 0];
den1 = [0 5 0 2];

num2 = [0 0 0 4];
den2 = [0 0 1 6];

num3 = [0 0 1 1];
den3 = [3 5 0 0];

num4 = [0 0 0 1];
den4 = [0 0 7 4];

num5 = [0 0 5 4];
den5 = [5 1 0 4];

num6 = [0 0 2 3];
den6 = [1 6 0 5];

% Crearemos funciones auxiliares para simplificar el diagrama.
% Denominaremos función 7 a las funciones 4 y 5 en paralelo
[num7, den7] = parallel(num4, den4, num5, den5);

% Luego la función 8 será las funciones 7 y 6 en serie
[num8, den8] = series(num7, den7, num6, den6);

% Se realiza el feedback positivo que tiene la función 3
[num3, den3] = feedback(num3,den3,1,1,+1);

% Luego las funciones 3 y 8 se conectan en serie
[num9, den9] = series(num3, den3, num8, den8);

% Finalmente tenemos tres funciones en paralelo (1, 2 y 9)
% Las tres tienen la misma entrada y se suman al final
% Primero se unen las funciones 1 y 2, luego se le agrega la 9
[num10, den10] = parallel(num1, den1, num2, den2);
[num10, den10] = parallel(num10, den10, num9, den9);

% Se grafica la respuesta que tiene este sistema a un escalón.
step(num10, den10, 10)