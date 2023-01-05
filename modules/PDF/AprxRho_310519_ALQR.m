%   CLASIFICADOR ESTADÍSTICO EN LA IDENTIFICACIÓN DE LA FUENTE DE CAPTURA
%                          DE IMÁGENES DIGITALES.
%           Ana Laura Quintanar Reséndiz, Rubén Vázquez Medina
%                               IPN-CIATA-QRO
%                                 MAYO-2019
%--------------------------------------------------------------------------
% RESUMEN: 
% Función que obtiene una aproximación de la distribución estadística de
% una matriz de ruido PRNU.
%--------------------------------------------------------------------------
% Función [hi,di,Pi]= AprxRho_310519_ALQR (prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n)
% INPUT:
%   prnuGRAY      Matriz de ruido PRNU.
%   R             Representa el número de partición, es decir, el número de 
%                 barritas para histograma.
%   DM            Diferencia entre b y a.
%   a             Valor incial,donde se empezara a contabilizar la señal de
%                 de ruido PRNU para aproximar su pdf.
%   b             Valor hasta donde se contabilizo la señal de ruido PRNU 
%                 para la aproximación de la pdf.
%   dirC_r        Directorio donde se almacenará la representación grafica
%                 de la pdf.
%   Nom_mat_prnu  Nombre de la matriz de ruido PRNU.
%   n             Número de gráfica de la pdf.
% OUTPUT:
%   hi            Alturas de las barritas en el histograma.
%   di            Rangos de las bases de cada barrita en el histograma.
%   Pi            Área de las barritas en el histograma.
%
% EXAMPLE:
% prnuGRAY=CE50_1_ (1)_r_1.xlsx; R=256; a=-10; b=10; DM=b-a; Nom_mat_prnu='CE50_1_ (1)_r_1'; n=1;
% dirC_r='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_Vec_RHO_PRNUf\';
% [hi,di,Pi]= AprxRho_310519_ALQR(prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n);
%% --------------------------------------------------------------------------
function [hi,di,Pi]= AprxRho_310519_ALQR (prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n)
    % Recorte del ruido PRNU en un intervalo de -5 a 5.
    
    %v_definido=recorreVec(prnuGRAY,a,b); Es irrelevante hacer este paso,
    %porque definimos un intervalo en la línea siguiente que indica el corte de
    %las esquinas, tomando solo los valores que existen entre el rando de -5a5.
    %Parametro de la función histcounts.
    %******************************************************************
    % NormPRNU = NormalizarPRNU_171019_ALQR(prnuGRAY); %++++++++ Normalizado
    %******************************************************************
    % Intervalo de -5 a 5 para histograma.
    % a=-10; b=10;DM=b-a;
    v_DM=a:DM/R:b; %v_DM=-4:R/312.5:4;
    %[hi,di] = histcounts(v_definido,v_DM,'Normalization','pdf');%Histograma
    %******************************************************************
    [hi,di] = histcounts(prnuGRAY,v_DM,'Normalization','pdf');%Histograma
    %******************************************************************
    % [hi,di] = histcounts(NormPRNU,v_DM,'Normalization','pdf');%++++++++ Normalizado
    %******************************************************************
    f = figure(n);
    f.Visible = "off";
    histogram('BinEdges',di,'BinCounts',hi);
    hold on, plot((di(1:R)-(di(1,1)/R)),hi);
    
    % Área de cada barrita en el histograma.
    Pi=(DM/R)*hi;
    
    % Directorio para guardar rho.
    DistEst=strcat(dirC_r,Nom_mat_prnu,'_rho.jpg');
    % Guarda el histograma como imagen.jpg.
    saveas(f, DistEst)
    % Cierra la figura identificada con n.
    close(n)
end