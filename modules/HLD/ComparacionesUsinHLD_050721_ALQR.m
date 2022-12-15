%% Separación de variables
dirSeparaRhos='D:\ALQR\MATLAB\MATLAB_scripts\Ruido\Codigos Doctorado\CodigosProyecto\Actualizados 100419\Paper KLD\CalculoTiempoProcess\KLDtest500x500\rhoIma_Referencia\';

[v_RHO,v_RHO_pi]=read2DBRHO_080820_ALQR(dirC_vec_RHO,50,dirSeparaRhos);
dirSeparaRhos='D:\ALQR\MATLAB\MATLAB_scripts\Ruido\Codigos Doctorado\CodigosProyecto\Actualizados 100419\Paper KLD\CalculoTiempoProcess\KLDtest500x500\rhoIma_Disputa\';
[v_RHO_d,v_RHO_pi_d]=read2DBRHO_080820_ALQR(dirC_vec_RHO_Disputa,21,dirSeparaRhos);

%% Lectura de PDF's por dispositivo de captura, PDF's tanto de Referencia como de Disputa
% NOTA: La lectura de las pdfs para ambos casos se realizo utilizando los
% directorios "dirDistRef" y "dirDistDis". Las matrices resultantes tienen
% un tamaño de 256 x número de imagenes de Referencia o Disputa consideradas
% en el caso de estudio( se usaron imágenes unitono, 30 de referencia y 20 
% de disputa). Después se creo un cubo de tamaño 256x30x8, 256 por ser el
% número de partición para obtener la pdf, 30 por considerarse 30 imágenes
% de referencia y 8 la cantidad de dispositivos en el caso de estudio. El
% cubo se creo tanto para las imágenes de referencia como las de disputa,
% cambiando en este último caso su tamaño a 256x20x8, 20 por ser 20
% imágenes en disputa.
%----------------------------------------------------------------------------
dirDistRef='D:\ALQR\MATLAB\MATLAB_scripts\Ruido\Codigos Doctorado\CodigosProyecto\Actualizados 100419\Paper KLD\CalculoTiempoProcess\KLD500x500\rhoIma_Referencia\Areas\';
dirDistDis='D:\ALQR\MATLAB\MATLAB_scripts\Ruido\Codigos Doctorado\CodigosProyecto\Actualizados 100419\Paper KLD\CalculoTiempoProcess\KLD500x500\rhoIma_Disputa\Areas\';
i=1;
while i<=8
    load(strcat(dirDistRef,'Telefono_pi_',num2str(i),'.mat'))
    distRef(:,:,i)=v_RHO_pi;
    clear v_RHO_pi

    load(strcat(dirDistDis,'Telefono_pi_',num2str(i),'.mat'))
    distDis(:,:,i)=v_RHO_pi;
    clear v_RHO_pi
    i=i+1;
end
%% Comparaciones usando HLD
% NOTA: En las comparaciones se consideraron 20 pdf's de las imágenes en
% disputa por cada dispositivo de captura (8 dispositivos) y 30 pdf's de las 
% imágenes de referencia por cada dispositivo de captura.Se hicieron
% comparaciones uno a uno, es decir, se comparó la pdf de referencia 1,2,3,...,30 
% contra la pdf de la primer imagen en disputa, esto se realizo para cada
% una de las pdf's de las imágenes de disputa.
% Como resultado se obtuvo el hipercubo HLD de 4D (k,i,j,h), donde k=30(imágenes de
% referencia),i=20(imágenes en disputa), j=8(dispositivos de captura de las
% imágenes de referencia) y h=8(dispositivos de captura de las imágenes de
% disputa).
%-----------------------------------------------------------------------------------
h=1;i=1;j=1;k=1;
topeCamR=size(distRef,3);
topeCamD=size(distDis,3);
topeRef=30;
topeDis=20;
%Solo se usan 30 pdf's de referencia y 20pdf's de disputa, el resto esta en cero 

% topeCamR = cantidad de dispositivos?

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
% NOTA: Para identificar que dispositivo capturó las imágenes de referencia
% se obtuvo el mínimo de cada uno de los planos, por ejemplo, se ubicó la
% posición (1,1) y se perforo en esa posición en cada uno de los planos que
% incluyen los resultados de comparación para cada uno de los dispositivos 
% considerados en el análisis. Como resultado se obtuvieron 2 cubos:
% DispCap y indC. En el primero se encuentran los valos minimos de cada
% caso y en el segundo el indice que identifica al dispositivo de captura.
%--------------------------------------------------------------------------
[topeRef,topeDis,topeCamR,topeCamD]=size(HLD);
h=1;i=1;j=1;k=1;
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
%%
Cam1=indC(:,:,1);
Cam2=indC(:,:,2);
Cam3=indC(:,:,3);
Cam4=indC(:,:,4);
Cam5=indC(:,:,5);
Cam6=indC(:,:,6);
Cam7=indC(:,:,7);
Cam8=indC(:,:,8);


%% Obtienen el máximo de una matriz que ya contiene los HLD promedio. Función se llama maxSIM
[Filas, Columnas]=size(Matriz);
maxC = zeros(2,Columnas);
i = 1; j = 1;

while j <= Columnas
    [maxC(1,j),maxC(2,j)] = max(Matriz(i:Filas,j));
    j = j + 1;
end

