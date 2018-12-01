%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingeniería en Informática______________
%_______________Modelación y Simulación________________________
%
% Laboratorio 1: Introducción a MatLab
% Integrantes: Nicolás Mariangel| Juan Pablo Rojas
% Profesor: Gonzalo Acuña
% Ayudante: Francisco Muñoz
%
%____________________Primera Parte_____________________________
% A continuacion se realizan graficos para las funciones (2) y (3)
% Entregadas en el enunciado de laboratorio.
%
% x representa el vector de puntos que se utiliza para aplicar la funcion
% definido de 0 a pi con una distancia de 0.01 entre cada punto.
x = 0:0.01:15*pi;
% Funcion a(x), expresión (2) que se aplica sobre el vector x.
% A esta expresión se le aplico un cambio de base(al ser base 10) para
% reacomodar al logaritmo que aparece en el enunciado(base 5).
a = 3 * (log(3*x+1)/log(5));
% Función b(x), expresión (3) que se aplica sobre el vector x.
% A esta expresión se le aplicó un cambio de base(al ser base 10) para
% reacomodar al logaritmo que aparece en el enunciado(base 2 y base 6).
b = sin(2*(log(x+11)/log(2)))+cos(5*(log(3*x+27)/log(6)));

% Figura 1/2 correspondiente a los gráficos de funciones a(x) y b(x)
figure(1)
% Se subdivide la figura en 3 subcuadros para acomodar cada uno de los
% graficos pedidos en el enunciado, en este caso se utiliza el primer
% subcuadro para a(x) correspondiente a la expresión (2).
subplot(3,1,1);
% Utilizacion de funcion graficar de script "graficar.m".
graficar('a(x)',x,a,'Gráfico función a(x)','r*',false)

% Segundo subcuadro para graficar b(x) expresion (3).
subplot(3,1,2);
graficar('b(x)',x,b,'Gráfico función b(x)','g+',false)

% Tercer subcuadro para graficar a(x) y b(x) en conjuto con la funcion
% graficar_ambos del archivo "graficar_ambos.m".
subplot(3,1,3)
graficar_ambos('a(x) y b(x)', x, a, b, 'Gráfico de a(x) y b(x)', 'r*', 'g+')

% Figura 2/2 correspondiente a las gráficas de la funcion (3) del enunciado,
% donde se pide a gráficafuncion en escala normal y luego en escala logarítmica
figure(2)
% x2 representa el vector de puntos que se utiliza para aplicar la funcion
% definido de -10 a 10 con una distancia de 0.05 entre cada punto.
x2 = -10:0.05:10;
c = 2*exp(x2+10);
% subcuadro 1 para función c(x) en escala normal
subplot(2,1,1)
% Aplicación de la funcion graficar del archivo "graficar.m" sin escala
% logarítmica
graficar('c(x)',x2,c,'Gráfico función c(x)','r+',false)
% Aplicación de cuadrícula en el gráfico
grid on
grid minor
% subcuadro 2 para función c(x) en escala normal
subplot(2,1,2)
% Aplicación de la funcion graficar del archivo "graficar.m" con escala
% logarítmica
graficar('ln(c(x))',x2,c,'Gráfico función c(x) escala logarítmica','b*',true)
% Aplicación de cuadrícula en el gráfico
grid on
grid minor
