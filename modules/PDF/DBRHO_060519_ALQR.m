function DBRHO_060519_ALQR(directorio, dirC_vec_RHO,R)
    %R=256 %Partición
    %directorio='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_1r_Mat_PRNUf\';
    %%ubicación de la DB de las matrices de PRNU.
    %dirC_vec_RHO='D:\ALQR\ALQR_Doctorado\Doctorado\BD-ImageForens\DB_Paco\4toExperimento_Revision\DB_Vec_RHO_PRNUf\';
    
    %obtiene el nombre las imágenes y su ubicación en DB
    [nombre_mat_prnu,Marca_mat_prnu]=marca_PRNU_270419_ALQR (directorio);
    
    %Obtiene el número de marcas que es 20
    U=length(Marca_mat_prnu);
    d=3;f=1;g=1;n=1;% declaración de variables
    Rho=zeros(R,3);
    % Anteriormente era de -3 a 3
    % Antes de la normalización era -10 a 10 
     a=-10; b=10;DM=b-a;
    % a=0; b=1;DM=b-a;% Nomalizado 0 a 1
    
    %Obtiene el número de modelos que es 5
    % T=length(Marca_mat_prnu(d).name);
    T=1;
    
    %cuando ya se tenga completa la base de datos de imagenes se puede cambiar
    %el numéro de marcas por 20, el de modelos por 5 y el de imagenes a 30.
    %tic
    while d<=U
        while f<=T%length(Marca(d).name)
            while g<=length(Marca_mat_prnu(d).name(f).name)
                %obtinen la ubicación de las imágenes en escala de grises.
                ubica_mat_prnu=Marca_mat_prnu(d).name(f).name(g).name;
                
                %Acceso al directorio donde se gurdaran los recortes.
                c_marca=strtok(nombre_mat_prnu(d).name(f).name(g).name,'_');
                dirC_r=strcat(dirC_vec_RHO,c_marca,'\',c_marca,'_', num2str(f),'\' );
                % Obtiene el nombre de la imagen sin el formato(.jpg).
                Nom_mat_prnu = strtok(nombre_mat_prnu(d).name(f).name(g).name,'.');
                % Leectura del ruido PRNU.
                M_rPRNU=readPRNU_Excel_010419_ALQR(ubica_mat_prnu);
                % Aproximación de distribución estadística del ruido PRNU.
                [hi,di,Pi]= AprxRho_310519_ALQR (M_rPRNU,R,DM,a,b,dirC_r,Nom_mat_prnu,n);
                Rho(:,1)=di(:,1:R)';% Rangos para las bases de cada una de las barritas del histograma.
                Rho(:,2)=hi(:,1:R)';% Altura de las barritas en el histograma. 
                Rho(:,3)=Pi(:,1:R)';% Area de las barritas en el histograma. 
                
                % Guarda las aproximaciones de las distribuciones estadísticas.
                saveRHO_Excel_010419_ALQR(dirC_r,Rho,Nom_mat_prnu);
    
                g=g+1;
                n=n+1;
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
