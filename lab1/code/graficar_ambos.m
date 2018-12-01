function[] = graficar_ambos(funciones, ejex, ejey1, ejey2, nombre_grafico, color_figura1, color_figura2)
% Función encargada de realizar un gráfico en conjunto para dos funciones,
% en este caso se utiliza para la función (2) y (3) del enunciado.
%
% Entradas:
% funciones - nombre de las funciones utilizadas para nombrar el eje y
% ejex - vector correspondiente al  eje x del plano definido en un
% intervalo con cierta distancia entre sus valores.
% ejey1 - primer vector obtenido de la aplicación de una expresion sobre
% el vector "ejex" que corresponde al eje y del plano.
% ejey2 - segundo vector obtenido de la aplicación de una expresion sobre
% el vector "ejex" que corresponde al eje y del plano.
% nombre_gráfico - título para el gráfico.
% colo_figura1 - color con la respectiva figura para los puntos(+,*,etc)
% del primer gráfico.
% colo_figura2 - color con la respectiva figura para los puntos(+,*,etc)
% del segundo gráfico.
%
% hold on para juntar los gráficos en un mismo plano
hold on
% se grafica la función a(x) correspondiente a la expresion (2) del
% enunciado.
plot(ejex,ejey1,color_figura1, 'markers', 3)
% se grafica la función b(x) correspondiente a la expresion (3) del
% enunciado.
plot(ejex,ejey2,color_figura2, 'markers', 3)
% Titulo y nombre de los ejes del gráfico.
title (nombre_grafico);
ylabel (funciones);
xlabel ('x');
% se cierra el plano que abarcó todas las curvas anteriores.
hold off
% Se añade leyenda para cada una de las curvas del plano.
legend('a(x)','b(x)')
end