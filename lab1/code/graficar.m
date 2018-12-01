function[] = graficar(funcion,ejex, ejey, nombre_grafico,color_figura,log)
% Funci�n encargada de realizar la grafica para un vector de entrada y una
% expresi�n aplicada sobre dicho vector.
% Esta funcion permite graficar en escala logaritmica o normal seg�n
% se requiera.
%
% Entradas:
% funcion - nombre de la funcion para representar eje y del plano.
% ejex - vector correspondiente al  eje x del plano definido en un
% intervalo con cierta distancia entre sus valores.
% ejey - vector obtenido de la aplicaci�n de una expresion sobre el vector
% "ejex" que corresponde al eje y del plano.
% nombre_gr�fico - t�tulo para el gr�fico.
% colo_figura - color con la respectiva figura para los puntos(+,*,etc).
% log - booleano para indicar si el grafico va en escala normal o
% logaritmica.
if log == false
    plot(ejex, ejey, color_figura, 'markers', 3)
else
    % forma de gr�fico con escala logar�tmica
    semilogy(ejex , ejey ,color_figura,'markers', 3)
end
% T�tulos y nombres de los ejes del gr�fico
title (nombre_grafico);
ylabel (funcion);
xlabel ('x');
end