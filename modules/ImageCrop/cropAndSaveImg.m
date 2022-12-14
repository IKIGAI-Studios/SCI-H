%% Crop and save dispute images in folder

function cropAndSaveImg(conn, idUser, type)
    if type == "reference"
        query = strcat("SELECT path, file FROM ReferenceImage");
    else
        query = strcat("SELECT path, file FROM DisputeImage WHERE idUser = ",string(idUser));
    end

    try
        imagenes = fetch(conn, query);
    
        for i=1 : height(imagenes)
            ubica_imagen = string(strcat(imagenes.path(i), imagenes.file(i)));
            dirC_r = strcat(imagenes.path(i), "Crops\");
            Nom_image = strtok(string(imagenes.file(i)), ".");
            tamB = 500;
    
            % Corrige la Orientación de la imagen a la vista 1.
            IO = CorrectOrientatio_291019_ALQR(ubica_imagen);
        
            % Recorte del centro de la imagen y lo guarda en el directorio específicado. 
            recorteCentroImagen_170120_ALQR(IO, tamB, Nom_image, dirC_r);
        end
    catch e
        msgbox(strcat("Error ", char(e.message)), "Warning", "error");
    end
