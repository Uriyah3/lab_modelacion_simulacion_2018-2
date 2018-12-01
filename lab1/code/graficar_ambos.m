function[] = graficar_ambos(funciones, ejex, ejey1, ejey2, nombre_grafico, color_figura1, color_figura2)
% Funci�n encargada de realizar un gr�fico en conjunto para dos funciones,
% en este caso se utiliza para la funci�n (2) y (3) del enunciado.
%
% Entradas:
% funciones - nombre de las funciones utilizadas para nombrar el eje y
% ejex - vector correspondiente al  eje x del plano definido en un
% intervalo con cierta distancia entre sus valores.
% ejey1 - primer vector obtenido de la aplicaci�n de una expresion sobre
% el vector "ejex" que corresponde al eje y del plano.
% ejey2 - segundo vector obtenido de la aplicaci�n de una expresion sobre
% el vector "ejex" que corresponde al eje y del plano.
% nombre_gr�fico - t�tulo para el gr�fico.
% colo_figura1 - color con la respectiva figura para los puntos(+,*,etc)
% del primer gr�fico.
% colo_figura2 - color con la respectiva figura para los puntos(+,*,etc)
% del segundo gr�fico.
%
% hold on para juntar los gr�ficos en un mismo plano
hold on
% se grafica la funci�n a(x) correspondiente a la expresion (2) del
% enunciado.
plot(ejex,ejey1,color_figura1, 'markers', 3)
% se grafica la funci�n b(x) correspondiente a la expresion (3) del
% enunciado.
plot(ejex,ejey2,color_figura2, 'markers', 3)
% Titulo y nombre de los ejes del gr�fico.
title (nombre_grafico);
ylabel (funciones);
xlabel ('x');
% se cierra el plano que abarc� todas las curvas anteriores.
hold off
% Se a�ade leyenda para cada una de las curvas del plano.
legend('a(x)','b(x)')
end