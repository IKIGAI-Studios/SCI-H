% Esta función cuenta cuántas veces se repiten los elementos de un arreglo fila,
% regresa una tabla donde te indica el elemento, las veces que se repite y
% el porcentaje respecto a todos los elementos.
function [data] = countInRow(row)
    values = unique(row);
    data = zeros(width(values),3);

    for i=1 : width(values)
        rep = 0;
        for j=1 : width(row)
             if row(j) == values(i)
                 rep = rep+1;
             end
         end
         data(i,1) = values(i);
         data(i,2) = rep;
         data(i,3) = round(rep * 100 / width(row),2);
    end