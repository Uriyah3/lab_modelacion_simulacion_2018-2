%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingeniería en Informática______________
%_______________Modelación y Simulación________________________
%
% Laboratorio 3: Sistemas Discretizados
% Integrantes: Nicolás Mariangel| Juan Pablo Rojas
% Profesor: Gonzalo Acuña
% Ayudante: Francisco Muñoz

%Dado el H(s) propuesto en el enunciado, este se descompone en los
%siguientes vectores, correspondientes al numerador y denominador de este.

%Numerador
numc = [5 15];
%Denominador
denc = [14 -7 21];

%Siendo que H(s) es un sistema continuo, se procede a discretizar
%A través de la función de MATLAB c2dm, que recibe como parametros
%Numerador y denominador de la funcion continua, tiempo de muestreo
%y metodo de muestreo, que en este caso es Bloqueador de orden cero(zoh)
%para dar como resultado el numerador y denominador de la función discreti-
%zada:

%Tiempos de muestreo 
T1 = 0.05;
T2 = 0.3;

%Primer tiempo de muestreo T = 0.05
[numdt1, dendt1] = c2dm(numc, denc, T1, 'zoh');

%Segundo tiempo de muestreo T = 0.3
[numdt2, dendt2] = c2dm(numc, denc, T2, 'zoh');

%Para realizar los recursos gráficos que mostraran el comportamiento del
%H(s) discretizado en ambos tiempos de muestreo que se definieron anterior-
%mentese, se realiza el siguiente procedimiento para obtener los ejes x en
%los que se plantearan los puntos obtenidos en la funcion discreta.

%Tiempo que se considerara en el eje x para graficar los puntos obtenidos 
tiempo = 10;

%Numero de puntos necesarios para graficar ambas funciones en los tiempos
%de muestreo respectivos:
puntosT1 = tiempo / T1;
puntosT2 = tiempo / T2;

%A través de la funcion dstep() de MATLAB que recibe el numerador y
%denominador de la funcion discretizada en cuestion y numero de puntos,
%entrega como resultado el vector de valores correspondiente al eje y del
%grafico.

%eje y para la funcion discretizada con T1
[yt1] = dstep(numdt1, dendt1, puntosT1+1);

%eje y para la funcion discretizada con T2
[yt2] = dstep(numdt2, dendt2, puntosT2+1);

%Vector de puntos del eje x para cada caso
xt1 = 0: T1: T1*puntosT1; 
xt2 = 0: T2: T2*puntosT2;

%Luego, uno de los objetivos del enunciado es tomar uno de los H(s)
%discretizados y volverlo a su forma continua, para esto se realiza el
%siguiente procedimiento con la funcion de MATLAB d2cm(), la cual recibe
%como parametros el numerador y denominador del H(s) discretizado y un
%tiempo de muestro que para este caso es 0.1, por ultimo se recibe como
%salida el numerador y denominador de la funcion continua.
%La transformacion se aplica a la funcion discretizada con T = 0.05:

[numctransf, denctransf] = d2cm(numdt1, dendt1, 0.1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%_____________________________Graficos____________________________________

%En la figura 1 se presenta el grafico de H(s) continuo en un intervalo de
%tiempo de 0 a 10 segundos.
figure(1)
step(numc,denc, 10);

%En la figura 2 se presentan los graficos correspondientes al H(s)
%discretizado en ambos tiempos de muestreo seleccionados.

figure(2)
%Grafico de H(s) discreto con T = 0.05
subplot(2,1,1)
stairs(xt1,yt1);
grid;
title('Gráfico continuo a discreto T = 0.05')
xlabel('Time(seconds)')
ylabel('Amplitude')

%Grafico de H(s) discreto con T = 0.3
subplot(2,1,2)
stairs(xt2,yt2);
grid;
title('Gráfico continuo a discreto T = 0.3')
xlabel('Time(seconds)')
ylabel('Amplitude')

%En la figura 3 se presenta el grafico obtenido luego de aplicar la
%transformacion de discreta a continua a la funcion discretizada con 
% T = 0.05

figure(3)
step(numctransf, denctransf, 20)
