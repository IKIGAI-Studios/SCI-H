%%   CLASIFICADOR ESTADÍSTICO EN LA IDENTIFICACIÓN DE LA FUENTE DE CAPTURA
%                          DE IMÁGENES DIGITALES.
%           Ana Laura Quintanar Reséndiz, Rubén Vázquez Medina
%                               IPN-CIATA-QRO
%                                ABRIL-2019
% --------------------------------------------------------------------------
% Módulo: DB_r_gray 
%--------------------------------------------------------------------------
% RESUMEN: 
% Guarda los recortes de las imágenes en escala de gris en el directorio
% específicado, agregando un nemotécnico al nombre de la imagen para
% identificar que se trata de un recorte.
% --------------------------------------------------------------------------
% Función            guardaRecorteSG_040919_ALQR(Recorte,Nom_image,n,dirC_r)
% INPUT:
%   Recorte          Matriz de tamaño 500x500 pixeles de la imagen en escala
%                    de gris.
%   Nom_image        Nombre de la imagen de la cual se obtendrán los
%                    recortes.
%   n                Número de recorte.
%   dirC_r           Directorio donde se guardaran los recortes de las 
%                    imágenes en escala de gris.
% 
% OUTPUT:
%   Recortes de imágenes en escala de gris de tamaño 500x500 en formato
%   .jpg
%            
% EXAMPLE:
% Recorte=ImagenRecorte1.mat;
% Nom_image='SG18_1_1';
% n=1;
% dirC_r='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_r_GRAY\';
% guardaRecorteSG_040919_ALQR(Recorte,Nom_image,n,dirC_r);
%% ------------------------------------------------------------------------
function guardaRecorteSG_040919_ALQR(Recorte,Nom_image,n,dirC_r)
% Guarda el recorte de la imagen de referencia en escala de grises
%  imwrite(Recorte,strcat(dirC_r,Nom_image,'_r_',num2str(n),'.jpg'), 'Mode','lossless');
save(strcat(dirC_r,Nom_image,'_r_',num2str(n),'.mat'),'Recorte');
end