function extractAndSaveAreas(conn, idUser, type)
    conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');
    type = "dispute";
    idUser = 2;
    
    if type == "reference"
        query = strcat("SELECT path, file FROM ReferenceImage");
    else
        query = strcat("SELECT path, file FROM DisputeImage WHERE idUser = ", string(idUser));
    end
    
    try
        imagenes = fetch(conn, query);
    
        for i=1 : height(imagenes)
            % Obtener nombre de la imagen
            Nom_image = strtok(string(imagenes.file(i)), ".");
            disp(Nom_image);
    
            % Añadir _rho.mat para obtener nombre de la matriz RHO
            Nom_mat_rho = strcat(Nom_image, "_rho.mat");
    
            % Obtener la ubicación de las matrices RHO
            ubica_mat_rho = strcat(imagenes.path(i), "PDF\", Nom_mat_rho);
    
            dirC_r_Area = strcat(imagenes.path(i), "HLD\");
            
            load(ubica_mat_rho, "Rho");
    
            area = Rho(:,3);
            
            % Guardar area de cada imagen en un .m dentro de HLD
            save(strcat(dirC_r_Area, Nom_image, "_a.mat"), "area");
        end
    catch e
        msgbox(strcat("Error ", char(e.message)), "Warning", "error");
    end