%%   CLASIFICADOR ESTADÍSTICO EN LA IDENTIFICACIÓN DE LA FUENTE DE CAPTURA
%                          DE IMÁGENES DIGITALES.
%           Ana Laura Quintanar Reséndiz, Rubén Vázquez Medina
%                               IPN-CIATA-QRO
%                                 ENERO-2020
% --------------------------------------------------------------------------
% RESUMEN:
% Función que recorta el centro de una imagen digital (RGB) en un tamaño 
% regular B.Para evitar la aberración del lente. 
% --------------------------------------------------------------------------
% Función recorteCentroImagen_170120_ALQR(IO,tamB,Nom_image,dirC_r,n)
% INPUT:
%   IO             Imagen previamente orientada al valor 1.   
%   tamB           Es el tamaño del bloque B, (500x500). 
%   Nom_image      Nombre de la imagen a recortar.
%   dirC_r         Es la ubicación donde se almacenará el recorte de la 
%                  imagen.
%   n              Número de imagen a recortar.
% OUTPUT:
% Matriz de tamaño 500x500 que contiene los pixeles del centro de la
% imagen.
% EXAMPLE:
% tamB=500;n=1;
% Nom_image='BL85_1_ (24).jpg.jpg'; 
% dirC_r='C:\Users\anala\OneDrive\Documentos\MATLAB\Ruido\Codigos Doctorado\CodigosProyecto\Actualizados 100419\Recorte _GRAY\Test_Recortes\';
% recorteCentroImagen_170120_ALQR(IO,tamB,Nom_image,dirC_r,n);
function recorteCentroImagen_170120_ALQR(IO, tamB, Nom_image, dirC_r)
    % Obtiene las dimensiones de la imagen.
    [M, N, RGB] = size(IO); 
    
    % Localiza el centro de la imagen y busca la esquina superior izquierda del recorte en la imagen.
    pixelSM = ((M - tamB) / 2) + 1; % Tanto en filas
    pixelIN = ((N - tamB) / 2) + 1; % Como columnas
    
    % Así como la esquina inferior izquierda.
    tope = tamB - 1;
    LpixelM = pixelSM + tope;
    LpixelN = pixelIN + tope;
    
    % Genera el recorte en cada una de las capas de color.
    RecorteRGB(:, :, 1) = IO(pixelSM:LpixelM, pixelIN:LpixelN, 1);
    RecorteRGB(:, :, 2) = IO(pixelSM:LpixelM, pixelIN:LpixelN, 2);
    RecorteRGB(:, :, 3) = IO(pixelSM:LpixelM, pixelIN:LpixelN, 3);
    
    % Guarda el recorte con el nombre y en el directorio especificado
    save(strcat(dirC_r,Nom_image,'_r.mat'),'RecorteRGB');