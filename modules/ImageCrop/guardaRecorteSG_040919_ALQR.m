%%   CLASIFICADOR ESTAD�STICO EN LA IDENTIFICACI�N DE LA FUENTE DE CAPTURA
%                          DE IM�GENES DIGITALES.
%           Ana Laura Quintanar Res�ndiz, Rub�n V�zquez Medina
%                               IPN-CIATA-QRO
%                                ABRIL-2019
% --------------------------------------------------------------------------
% M�dulo: DB_r_gray 
%--------------------------------------------------------------------------
% RESUMEN: 
% Guarda los recortes de las im�genes en escala de gris en el directorio
% espec�ficado, agregando un nemot�cnico al nombre de la imagen para
% identificar que se trata de un recorte.
% --------------------------------------------------------------------------
% Funci�n            guardaRecorteSG_040919_ALQR(Recorte,Nom_image,n,dirC_r)
% INPUT:
%   Recorte          Matriz de tama�o 500x500 pixeles de la imagen en escala
%                    de gris.
%   Nom_image        Nombre de la imagen de la cual se obtendr�n los
%                    recortes.
%   n                N�mero de recorte.
%   dirC_r           Directorio donde se guardaran los recortes de las 
%                    im�genes en escala de gris.
% 
% OUTPUT:
%   Recortes de im�genes en escala de gris de tama�o 500x500 en formato
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