%% Image crop test

% DBguarda_1Recorte500RGB_300420_ALQR('images\AddImages\Dispute\','images\Test\recortes\');

% Conexión
conn = database('conn_scih', 'uqrpef8uvj0gk5k7', 'hS0C86ybuxlTFNVYSSto');

% Obtener todas las rutas de las imágenes de disputa correspondientes al
% usuario
idUser = 2;
query = strcat("SELECT idQImage, path, file FROM DisputeImage WHERE idUser=",string(idUser));

try
    imagenes = fetch(conn, query);
%     disp(imagenes);
    
    for i=1 : height(imagenes)
%     ubica_imagen = "images\AddImages\Dispute\CE50\CE50_1\CE50_1_ (1).JPG";
        Nom_image = strtok(string(imagenes.file(i)), ".");
        disp(imagenes);
%         disp(Nom_image);
%         Nom_image = "CE50_1_ (1)";
        tamB = 500;
        
        l = strsplit(Nom_image,"(");
        r = strsplit(l(2), ")");
        num_image = r(1);
        disp(num_image);

%     dirC_r = "images\Test\recortes\";
%     g = 1;
%     
%     % Corrige la Orientación de la imagen a la vista 1.
%     IO = CorrectOrientatio_291019_ALQR(ubica_imagen);
%     
%     % Recorte del centro de la imagen y lo guarda en el directorio específicado. 
%     recorteCentroImagen_170120_ALQR(IO, tamB, Nom_image, dirC_r, num_image); 
    end
catch e
    msgbox(strcat("Error", char(e.message)), "Warning", "error");
end