function IO = CorrectOrientatio_291019_ALQR(ubica_imagen)
            IM = imread(ubica_imagen);
            nom = ubica_imagen;
            % Obtiene los metadatos de las imágenes.
            info = imfinfo(nom);
            if isfield(info, 'Orientation')% Verifica que la etiqueta de orientación se encuentre presente.
                % Otiene el valor de orientación.
                orient = info(1).Orientation;
                switch orient
                    case 0
                        IO = IM;
                    case 1
                        IO = IM;
            %             disp('or1')
                        %La imagen tiene una orientación "normal".
                    case 2
                        IO = IM(:, end:-1:1, :);         %right to left
            %             disp('or2')
                    case 3
                        IO = IM(end:-1:1, end:-1:1, :);  %180 degree rotation
            %             disp('or3')
                    case 4
                        IO = IM(end:-1:1, :, :);         %bottom to top
            %             disp('or4')
                    case 5
                        IO = permute(IM, [2 1 3]);     %counterclockwise and upside down
            %             disp('or5')
                    case 6
                        IO = rot90(IM, 3);              %undo 90 degree by rotating 270
            %             disp('or6')
                    case 7
                        IO = rot90(IM(end:-1:1, :, :));  %undo counterclockwise and left/right
            %             disp('or7')
                    case 8
                        IO = rot90(IM);                %undo 270 rotation by rotating 90
            %             disp('or8')
                    otherwise
                        warning(sprintf('Orientación Desconocida %g ignored\n', orient));
                end
            else
            IO = IM;
            disp('No existen metadatos');
            end
        end