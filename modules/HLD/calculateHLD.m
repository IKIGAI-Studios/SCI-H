function devicesID = calculateHLD(conn, idQImage)
%     conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');
%     idQImage = 43;
    
    queryImgDis = strcat("SELECT path, file FROM DisputeImage WHERE idQImage = ", string(idQImage));
    queryNImgRef = "SELECT idDevice, img_count FROM Device WHERE img_count >= 1";
    
    try
        %% PASO 2
        % Obtener cubos
        imagenesRefDev = fetch(conn, queryNImgRef);
        imagenesDis = fetch(conn, queryImgDis);
    
        % Obtener número máximo de imagenes de un dispositivo
        imagenesMaxRef = max(imagenesRefDev.img_count);
        
        % Obtener número de dispositivos
        nDevices = height(imagenesRefDev);
    
        distDis = zeros(256, height(imagenesDis), nDevices);
    
        for i=1 : height(imagenesDis)
            Nom_image = strtok(imagenesDis.file(i), ".");
            Nom_mat_area = strcat(imagenesDis.path(i), "HLD\" ,Nom_image, "_a.mat");
    
            for j=1 : nDevices
                load(Nom_mat_area, "area");
                distDis(:,i,j) = area;
            end
        end
    
        distRef = zeros(256, imagenesMaxRef, nDevices);
        for i=1 : nDevices
            for j=1 : str2double(string(imagenesRefDev.img_count(i)))
                
                query = strcat("SELECT path, file FROM ReferenceImage WHERE idDevice = ", string(imagenesRefDev.idDevice(i)));
                imagenes = fetch(conn, query);
    
                for k=1 : height(imagenes)
                    Nom_image = strtok(imagenes.file(k), ".");
                    Nom_mat_area = strcat(imagenes.path(k), "HLD\" ,Nom_image, "_a.mat");
                    load(Nom_mat_area, "area");
        
                    distRef(:,k,i) = area;
                end
            end
        end
        
        %% PASO 3
        % Comparación por HLD
        h=1;i=1;j=1;k=1;
        topeCamR = size(distRef,3);
        topeCamD = size(distDis,3);
        topeRef = size(distRef,2);
        topeDis = size(distDis,2);
        
        HLD = zeros(topeRef,topeDis,topeCamR,topeCamD);
        
        while h<=topeCamD
            while i<=topeDis
                while j<=topeCamR
                    while k<=topeRef
                        HLD(k,i,j,h)=HLD_050721_ALQR(distRef(:,k,j),distDis(:,i,h));
                        k=k+1;
                    end
                    k=1;
                    j=j+1;
                end
                j=1;
                i=i+1;
            end
            i=1;
            h=h+1;
        end
        
        %% Localización de Dispositivo de Captura
        [topeRef,topeDis,topeCamR,topeCamD]=size(HLD);
        h=1;i=1;j=1;k=1;
        DispCap = zeros(topeRef,topeDis,topeCamD);
        indC = zeros(topeRef,topeDis,topeCamD);
    
        while h<=topeCamD
            while k<=topeRef
                while i<=topeDis
                    [DispCap(k,i,h),indC(k,i,h)]=min(HLD(k,i,j:topeCamR,h));
                    i=i+1;
                end
                i=1;
                k=k+1;
            end
            k=1;
            h=h+1;
        end
        
        %% Obtienen el máximo de una matriz que ya contiene los HLD promedio.
        [imgR, imgD, device] = size(indC);
        devicesID = zeros(imgD,2);
        for i=1 : imgD
            [data, maxnum] = countInRow(indC(:,i,1).');
            
            devicesID(i,1) = table2array(imagenesRefDev(maxnum(1,1),1));
            devicesID(i,2) = maxnum(1,3);
        end
    catch e
        msgbox(strcat("Error ", char(e.message)), "Warning", "error");
    end
