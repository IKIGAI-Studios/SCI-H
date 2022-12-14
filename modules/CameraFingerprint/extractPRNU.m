%% Extract PRNU from a crop
% Database connection
function extractPRNU(conn, idUser, type)

    if type == "reference"
        query = strcat("SELECT path, file FROM ReferenceImage");
    else
        query = strcat("SELECT path, file FROM DisputeImage WHERE idUser = ",string(idUser));
    end
        
    try
        imagenes = fetch(conn, query);
    
        for i=1 : height(imagenes)
            % Acceso al directorio donde se gurdarán los recortes.
            Nom_image = strtok(string(imagenes.file(i)), ".");
            ubica_imagen = string(strcat(imagenes.path(i), "Crops\", Nom_image, "_r.mat"));
            dirC_r = strcat(imagenes.path(i),"PRNU\");

            %Extracción de ruido PRNU de las imágenes en escala de gris.
            prnuGRAY=ExtractNoise_060919_ALQR(ubica_imagen);

            %Guarda la matriz de ruido PRNU obtenida en el directorio 
            %indicado y con el nombre de la imagen que le corresponde.
            save(strcat(dirC_r, Nom_image, '_prnu.mat'),'prnuGRAY');
        end
    catch e
        msgbox(strcat("Error ", char(e.message)), "Warning", "error");
    end