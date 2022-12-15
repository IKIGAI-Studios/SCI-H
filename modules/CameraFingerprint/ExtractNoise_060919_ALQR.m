%%   CLASIFICADOR ESTAD�STICO EN LA IDENTIFICACI�N DE LA FUENTE DE CAPTURA
%                          DE IM�GENES DIGITALES.
%           Ana Laura Quintanar Res�ndiz, Rub�n V�zquez Medina
%                               IPN-CIATA-QRO
%                                 MAYO-2019
%--------------------------------------------------------------------------
%M�dulo: DB_PRNU
%--------------------------------------------------------------------------
%RESUMEN: 
% Obtiene el ruido PRNU de los recortes de im�genes en escala de gris.
%--------------------------------------------------------------------------
% Funci�n                ExtractNoise_060919_ALQR(ubica_imagen_IGRAY) 
% INPUT:
%   ubica_imagen_IGRAY   Directorio que incluye el nombre del recorte del
%                        cual se quiere obtener su ruido PRNU.
%
% OUTPUT:
%   prnuGRAY             Matriz de tama�o tamB(500)xtamB(500)que contiene
%                        el Ruido PRNU del recorte proporcionado.
%            
% EXAMPLE:
% ubica_imagen_IGRAY='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\Experimento 1 Paper_Paco\DB_1r_GRAY_P_articulo\CSX5\CSX5_1\CSX5_1_ (1)_g_r_1.jpg'; 
% prnuGRAY=ExtractNoise_060919_ALQR(ubica_imagen_IGRAY) 
%% ------------------------------------------------------------------------
function prnuGRAY=ExtractNoise_060919_ALQR(ubica_imagen_IGRAY) 
    %% Extracci�n del Ruido PRNU de la imagen IGRAY(escala de gris)

    load(ubica_imagen_IGRAY, "RecorteRGB");
    prnuGRAY = NoiseExtractFromImage(RecorteRGB,2);
    
    %Filtrado para eliminar posibles rasgos de compresi�n del formato JPEG.
    prnuGRAY = WienerInDFT(prnuGRAY,std2(prnuGRAY));
end