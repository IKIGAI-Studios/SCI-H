function DBguarda_1Recorte500RGB_300420_ALQR(directorio, dirC_1r_RGB)
            % Obtiene el nombre las imágenes y su ubicación en DB. 
            [nombre_imagen, Marca] = marcaRGB_280219_ALQR(directorio);
            % Obtiene el número de marcas.
            U = length(Marca);
            % Declaración de variables.
            d = 3;
            f = 1;
            g = 1;
            % Obtiene el número de modelos que es 5.
            T = 1;
            % Tamaño del recorte.
            tamB = 500;
            tic
                while d <= U
                    while f <= T%length(Marca(d).name)
                        while g <= length(Marca(d).name(f).name)
                            % Obtinen la ubicación de las imágenes en RGB.
                            ubica_imagen = Marca(d).name(f).name(g).name;
                            % Acceso al directorio donde se gurdarán los recortes.
                            c_marca = strtok(nombre_imagen(d).name(f).name(g).name, '_');
                            dirC_r = strcat(dirC_1r_RGB,c_marca, '\', c_marca, '_', num2str(f), '\');
                            % Obtiene el nombre de la imagen sin el formato(.jpg).
                            Nom_image = strtok(nombre_imagen(d).name(f).name(g).name, '.');
                            
                            % Corrige la Orientación de la imagen a la vista 1.
                            IO = CorrectOrientatio_291019_ALQR(ubica_imagen);
                            % Recorte del centro de la imagen y lo guarda en el directorio específicado. 
                            recorteCentroImagen_170120_ALQR(IO, tamB, Nom_image, dirC_r, g)
                            g = g + 1;
                        end
                        g = 1;
                        f = f + 1;
                    end
                    g = 1;
                    f = 1;
                    d = d + 1;
                end
            toc
        end