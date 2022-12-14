%%   CLASIFICADOR ESTAD�STICO EN LA IDENTIFICACI�N DE LA FUENTE DE CAPTURA
%                          DE IM�GENES DIGITALES.
%           Ana Laura Quintanar Res�ndiz, Rub�n V�zquez Medina
%                               IPN-CIATA-QRO
%                                 MAYO-2019
%--------------------------------------------------------------------------
%M�dulo: DB_PRNU
%--------------------------------------------------------------------------
%RESUMEN: 
% Obtiene el ruido PRNU de los recortes de las im�genes a analizar,
% guard�ndolos en archivos de excel.
%--------------------------------------------------------------------------
% Funci�n          DBPRNUsyn_060519_ALQR(directorio,dirC_Mat_PRNU)
% INPUT:
%   directorio     Directorio donde se encuentran los recortes de las 
%                  im�genes en escala de gris.
%   dirC_Mat_PRNU  Directorio donde se almacenaran los archivos de excel
%                  que contienen el ruido PRNU de los recortes.
%
% OUTPUT:
%   Ruido PRNU en archivos .xlsx de los recortes de cada una de las
%   im�genes, organizados por marca y modelo.
%            
% EXAMPLE:
% directorio='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_1r_GRAY\'; 
% dirC_Mat_PRNU='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_1r_Mat_PRNUf\'; 
% DBPRNUsyn_060519_ALQR(directorio,dirC_Mat_PRNU)
%% ------------------------------------------------------------------------
function DBPRNUsyn_060519_ALQR(directorio,dirC_Mat_PRNU)
%obtiene el nombre las im�genes y su ubicaci�n en DB.
[nombre_imagen_g_r,Marca_g_r]=marca_R_120419_ALQR (directorio);
%Obtiene el n�mero de marcas en el directorio.
U=length(Marca_g_r);
d=3;f=1;g=1;
%Obtiene el n�mero de modelos.
T=1;%T=length(Marca_g_r(d).name);
%tic
while d<=U
    while f<=T%length(Marca(d).name)
        while g<=length(Marca_g_r(d).name(f).name)
            % Obtinen la ubicaci�n de las im�genes en escala de grises.
            ubica_imagen=Marca_g_r(d).name(f).name(g).name;
            
            % Acceso al directorio donde se gurdar�n los recortes.
            c_marca=strtok(nombre_imagen_g_r(d).name(f).name(g).name,'_');
            dirC_r=strcat(dirC_Mat_PRNU,c_marca,'\',c_marca,'_', num2str(f),'\' );
            % Obtiene el nombre de la imagen sin el formato(.jpg).
            Nom_image = strtok(nombre_imagen_g_r(d).name(f).name(g).name,'.');
            
            %Extracci�n de ruido PRNU de las im�genes en escala de gris.
            prnuGRAY=ExtractNoise_060919_ALQR(ubica_imagen);
            
            %Extracci�n de ruido PRNU de la capa verde de las im�genes en RGB.
%             prnuGRAY=ExtractNoiseGreen_051119_ALQR(ubica_imagen); 
            
            %Guarda la matriz de ruido PRNU obtenida en el directorio 
            %indicado y con el nombre de la imagen que le corresponde.
            savePRNU_Excel_010419_ALQR(dirC_r,prnuGRAY,Nom_image);
            g=g+1;
        end
        g=1;
        f=f+1;
    end
    g=1;
    f=1;
    d=d+1;
end
%toc
end