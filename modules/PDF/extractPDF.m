%% Extract and save PFD (.jpg and .mat)

function extractPDF(conn, idQImage, type)
%     conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');
%     idQImage = 23;
%     type = "dispute"; 
    if type == "reference"
        query = strcat("SELECT path, file, idRImage FROM ReferenceImage");
    else
        query = strcat("SELECT path, file FROM DisputeImage WHERE idQImage = ", string(idQImage));
    end

    % Variables
    R = 256;
    Rho = zeros(R,3);
    a = -10; 
    b = 10;
    DM = b-a;

    try
        imagenes = fetch(conn, query);

       for i=1 : height(imagenes)
            % Obtener nombre de la imagen
            Nom_image = strtok(string(imagenes.file(i)), ".");
    
            % Añadir _prnu.mat para obtener nombre de la matriz PRNU
            Nom_mat_prnu = strcat(Nom_image, "_prnu.mat");
    
            % Directorio para guardar los resultados
            dirC_r = strcat(imagenes.path(i), "PDF\");
    
            % Obtener la ubicación de las matrices PRNU
            ubica_mat_prnu = strcat(imagenes.path(i), "PRNU\", Nom_mat_prnu);
            
            % Obtener la matriz PRNU
            load(ubica_mat_prnu, "prnuGRAY");
    
            % Aproximación de distribución estadística del ruido PRNU.
            [hi,di,Pi] = AprxRho_310519_ALQR(prnuGRAY,R,DM,a,b,dirC_r,Nom_image,i);
    
            Rho(:,1)=di(:,1:R)'; % Rangos para las bases de cada una de las barritas del histograma.
            Rho(:,2)=hi(:,1:R)'; % Altura de las barritas en el histograma. 
            Rho(:,3)=Pi(:,1:R)'; % Area de las barritas en el histograma. 
            
            % Guarda las aproximaciones de las distribuciones estadísticas.
            save(strcat(dirC_r, Nom_image, '_rho.mat'),'Rho');

            if type == "reference"
                query = strcat("UPDATE ReferenceImage SET HLDanalysis = 1 WHERE idRImage = ", string(imagenes.idRImage(i)));
            else
                query = strcat("UPDATE DisputeImage SET HLDanalysis = 1 WHERE idQImage = ", string(idQImage));
            end
            % Try write in database
            fetch(conn, query);
        end 
    catch e
        msgbox(strcat("Error ", char(e.message)), "Warning", "error");
    end