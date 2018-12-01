%____________Universidad de Santiago de Chile__________________
%_______Departamento de Ingenier�a en Inform�tica______________
%_______________Modelaci�n y Simulaci�n________________________
%
% Laboratorio 1: Introducci�n a MatLab
% Integrantes: Nicol�s Mariangel| Juan Pablo Rojas
% Profesor: Gonzalo Acu�a
% Ayudante: Francisco Mu�oz
%
%____________________Primera Parte_____________________________
% A continuacion se realizan graficos para las funciones (2) y (3)
% Entregadas en el enunciado de laboratorio.
%
% x representa el vector de puntos que se utiliza para aplicar la funcion
% definido de 0 a pi con una distancia de 0.01 entre cada punto.
x = 0:0.01:15*pi;
% Funcion a(x), expresi�n (2) que se aplica sobre el vector x.
% A esta expresi�n se le aplico un cambio de base(al ser base 10) para
% reacomodar al logaritmo que aparece en el enunciado(base 5).
a = 3 * (log(3*x+1)/log(5));
% Funci�n b(x), expresi�n (3) que se aplica sobre el vector x.
% A esta expresi�n se le aplic� un cambio de base(al ser base 10) para
% reacomodar al logaritmo que aparece en el enunciado(base 2 y base 6).
b = sin(2*(log(x+11)/log(2)))+cos(5*(log(3*x+27)/log(6)));

% Figura 1/2 correspondiente a los gr�ficos de funciones a(x) y b(x)
figure(1)
% Se subdivide la figura en 3 subcuadros para acomodar cada uno de los
% graficos pedidos en el enunciado, en este caso se utiliza el primer
% subcuadro para a(x) correspondiente a la expresi�n (2).
subplot(3,1,1);
% Utilizacion de funcion graficar de script "graficar.m".
graficar('a(x)',x,a,'Gr�fico funci�n a(x)','r*',false)

% Segundo subcuadro para graficar b(x) expresion (3).
subplot(3,1,2);
graficar('b(x)',x,b,'Gr�fico funci�n b(x)','g+',false)

% Tercer subcuadro para graficar a(x) y b(x) en conjuto con la funcion
% graficar_ambos del archivo "graficar_ambos.m".
subplot(3,1,3)
graficar_ambos('a(x) y b(x)', x, a, b, 'Gr�fico de a(x) y b(x)', 'r*', 'g+')

% Figura 2/2 correspondiente a las gr�ficas de la funcion (3) del enunciado,
% donde se pide a gr�ficafuncion en escala normal y luego en escala logar�tmica
figure(2)
% x2 representa el vector de puntos que se utiliza para aplicar la funcion
% definido de -10 a 10 con una distancia de 0.05 entre cada punto.
x2 = -10:0.05:10;
c = 2*exp(x2+10);
% subcuadro 1 para funci�n c(x) en escala normal
subplot(2,1,1)
% Aplicaci�n de la funcion graficar del archivo "graficar.m" sin escala
% logar�tmica
graficar('c(x)',x2,c,'Gr�fico funci�n c(x)','r+',false)
% Aplicaci�n de cuadr�cula en el gr�fico
grid on
grid minor
% subcuadro 2 para funci�n c(x) en escala normal
subplot(2,1,2)
% Aplicaci�n de la funcion graficar del archivo "graficar.m" con escala
% logar�tmica
graficar('ln(c(x))',x2,c,'Gr�fico funci�n c(x) escala logar�tmica','b*',true)
% Aplicaci�n de cuadr�cula en el gr�fico
grid on
grid minor
