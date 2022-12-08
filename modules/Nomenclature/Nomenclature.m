function nom = Nomenclature(brand, model)
    brand = upper(brand);
    model = upper(model);
    
    numbers = ["0","1","2","3","4","5","6","7","8","9"];
    uppercases = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","X","Y","Z"];
    frstNum = 0;
    
    modelN = split(string(model), "");
    brandN = split(string(brand), "");
    
    nom = strcat(string(brandN(2)), string(modelN(2)));
    
    if contains(model, numbers)
        for i = length(modelN) : -1 : 2 
            if (contains(modelN(i), numbers))
                frstNum = i;
            end
        end
        scndChrac = frstNum + 1;
        while ~contains(modelN(scndChrac), uppercases) && ~contains(modelN(scndChrac), numbers)
                scndChrac = scndChrac + 1;
        end
        nom = strcat(nom, string(modelN(frstNum)), string(modelN(scndChrac)));
    else
        nom = strcat(nom, string(modelN(length(modelN) - 2)), string(modelN(length(modelN) - 1)));
    end