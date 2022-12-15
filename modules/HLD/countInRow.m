function [data, maxnum] = countInRow(row)
    values = unique(row);
    maxnum = zeros(1,3);
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
    
    maxnum(1,2) = max(data(:,2));
    for i=1 : width(values)
        if maxnum(1,2) == data(i,2)
            maxnum(1,1) = data(i,1);
            maxnum(1,3) = data(i,3);
        end
    end