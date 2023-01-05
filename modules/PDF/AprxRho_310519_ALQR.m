%   CLASIFICADOR ESTAD�STICO EN LA IDENTIFICACI�N DE LA FUENTE DE CAPTURA
%                          DE IM�GENES DIGITALES.
%           Ana Laura Quintanar Res�ndiz, Rub�n V�zquez Medina
%                               IPN-CIATA-QRO
%                                 MAYO-2019
%--------------------------------------------------------------------------
% RESUMEN: 
% Funci�n que obtiene una aproximaci�n de la distribuci�n estad�stica de
% una matriz de ruido PRNU.
%--------------------------------------------------------------------------
% Funci�n [hi,di,Pi]= AprxRho_310519_ALQR (prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n)
% INPUT:
%   prnuGRAY      Matriz de ruido PRNU.
%   R             Representa el n�mero de partici�n, es decir, el n�mero de 
%                 barritas para histograma.
%   DM            Diferencia entre b y a.
%   a             Valor incial,donde se empezara a contabilizar la se�al de
%                 de ruido PRNU para aproximar su pdf.
%   b             Valor hasta donde se contabilizo la se�al de ruido PRNU 
%                 para la aproximaci�n de la pdf.
%   dirC_r        Directorio donde se almacenar� la representaci�n grafica
%                 de la pdf.
%   Nom_mat_prnu  Nombre de la matriz de ruido PRNU.
%   n             N�mero de gr�fica de la pdf.
% OUTPUT:
%   hi            Alturas de las barritas en el histograma.
%   di            Rangos de las bases de cada barrita en el histograma.
%   Pi            �rea de las barritas en el histograma.
%
% EXAMPLE:
% prnuGRAY=CE50_1_ (1)_r_1.xlsx; R=256; a=-10; b=10; DM=b-a; Nom_mat_prnu='CE50_1_ (1)_r_1'; n=1;
% dirC_r='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_Vec_RHO_PRNUf\';
% [hi,di,Pi]= AprxRho_310519_ALQR(prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n);
%% --------------------------------------------------------------------------
function [hi,di,Pi]= AprxRho_310519_ALQR (prnuGRAY,R,DM,a,b,dirC_r,Nom_mat_prnu,n)
    % Recorte del ruido PRNU en un intervalo de -5 a 5.
    
    %v_definido=recorreVec(prnuGRAY,a,b); Es irrelevante hacer este paso,
    %porque definimos un intervalo en la l�nea siguiente que indica el corte de
    %las esquinas, tomando solo los valores que existen entre el rando de -5a5.
    %Parametro de la funci�n histcounts.
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
    
    % �rea de cada barrita en el histograma.
    Pi=(DM/R)*hi;
    
    % Directorio para guardar rho.
    DistEst=strcat(dirC_r,Nom_mat_prnu,'_rho.jpg');
    % Guarda el histograma como imagen.jpg.
    saveas(f, DistEst)
    % Cierra la figura identificada con n.
    close(n)
end