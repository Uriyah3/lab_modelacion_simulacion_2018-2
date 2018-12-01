%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingenier�a en Inform�tica______________
%_______________Modelaci�n y Simulaci�n________________________
%
% Laboratorio 2: Sistemas de primer y segundo orden
% Integrantes: Nicol�s Mari�ngel | Juan Pablo Rojas
% Profesor: Gonzalo Acu�a
% Ayudante: Francisco Mu�oz
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

% Obtener ceros, polos y ganancia estatica de cada funci�n (lazo abierto)
% Funci�n de primer orden
[ceros1,polos1,gan1] = tf2zp(numPrimer, denPrimer)
% Funci�n de segundo orden
[ceros2,polos2,gan2] = tf2zp(numSegundo, denSegundo)
% Funci�n de tercer orden
[ceros3,polos3,gan3] = tf2zp(numTercer, denTercer)

% Transformar numeradores y denominadores a funci�n de lazo cerrado
[numPrimerCL, denPrimerCL] = cloop(numPrimer, denPrimer);
[numSegundoCL, denSegundoCL] = cloop(numSegundo, denSegundo);
[numTercerCL, denTercerCL] = cloop(numTercer, denTercer);

% Obtener ceros, polos y ganancia estatica de cada funci�n (lazo cerrado)
% Funci�n de primer orden
[cerosCL1,polosCL1,ganCL1] = tf2zp(numPrimerCL, denPrimerCL)
% Funci�n de segundo orden
[cerosCL2,polosCL2,ganCL2] = tf2zp(numSegundoCL, denSegundoCL)
% Funci�n de tercer orden
[cerosCL3,polosCL3,ganCL3] = tf2zp(numTercerCL, denTercerCL)

% Obtener la informaci�n de cada sistema (tiempo de estabilizaci�n)
% Se utiliza la funci�n tf para crear la funci�n de transferencia
% utilizando numeradores y denominadores, para luego obtener informaci�n
% sobre la respuesta que tiene cada sistema a un escal�n.
primerStepInfo = stepinfo(tf(numPrimer, denPrimer));
primerCLStepInfo = stepinfo(tf(numPrimerCL, denPrimerCL));
segundoStepInfo = stepinfo(tf(numSegundo, denSegundo));
segundoCLStepInfo = stepinfo(tf(numSegundoCL, denSegundoCL));
tercerStepInfo = stepinfo(tf(numTercer, denTercer));
tercerCLStepInfo = stepinfo(tf(numTercerCL, denTercerCL));

% Luego se muestra el SettlingTime (tiempo de estabilizaci�n)
fprintf("Funcion de primer orden - lazo abierto [Tiempo estabilizaci�n]: %f (s)\n", primerStepInfo.SettlingTime);
fprintf("Funcion de primer orden - lazo cerrado [Tiempo estabilizaci�n]: %f (s)\n", primerCLStepInfo.SettlingTime);
fprintf("Funcion de segundo orden - lazo abierto [Tiempo estabilizaci�n]: %f (s)\n", segundoStepInfo.SettlingTime);
fprintf("Funcion de segundo orden - lazo cerrado [Tiempo estabilizaci�n]: %f (s)\n", segundoCLStepInfo.SettlingTime);
fprintf("Funcion de tercer orden - lazo abierto [Tiempo estabilizaci�n]: %f (s)\n", tercerStepInfo.SettlingTime);
fprintf("Funcion de tercer orden - lazo cerrado [Tiempo estabilizaci�n]: %f (s)\n", tercerCLStepInfo.SettlingTime);

% Realizar gr�ficos de lazo cerrado y lazo abierto de cada funci�n
% Funci�n de primer orden
figure(1)
step(numPrimer, denPrimer)
figure(2)
step(numPrimerCL, denPrimerCL)

% Funci�n de segundo orden
figure(3)
step(numSegundo, denSegundo)
figure(4)
step(numSegundoCL, denSegundoCL)

% Funci�n de tercer orden
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

% Escribir las funciones de transferencia (enunciado) en funci�n de sus 
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
% Denominaremos funci�n 7 a las funciones 4 y 5 en paralelo
[num7, den7] = parallel(num4, den4, num5, den5);

% Luego la funci�n 8 ser� las funciones 7 y 6 en serie
[num8, den8] = series(num7, den7, num6, den6);

% Se realiza el feedback positivo que tiene la funci�n 3
[num3, den3] = feedback(num3,den3,1,1,+1);

% Luego las funciones 3 y 8 se conectan en serie
[num9, den9] = series(num3, den3, num8, den8);

% Finalmente tenemos tres funciones en paralelo (1, 2 y 9)
% Las tres tienen la misma entrada y se suman al final
% Primero se unen las funciones 1 y 2, luego se le agrega la 9
[num10, den10] = parallel(num1, den1, num2, den2);
[num10, den10] = parallel(num10, den10, num9, den9);

% Se grafica la respuesta que tiene este sistema a un escal�n.
step(num10, den10, 10)