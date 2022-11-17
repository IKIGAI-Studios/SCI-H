meta = imfinfo("C:\Users\gatit\Downloads\IMG_3009.JPG");
disp(meta);


% Descripcion
% disp(meta.ImageDescription);
% Origen
disp(strcat(meta.Make," ",meta.Model," ",meta.Software));
% Camara
% disp(strcat(meta.DigitalCamera))
%GPS
disp(strcat(string(meta.GPSInfo.GPSLatitude(1)),"°",string(meta.GPSInfo.GPSLatitude(2)),"'",string(meta.GPSInfo.GPSLatitude(3)),"''", meta.GPSInfo.GPSLatitudeRef, " , ", string(meta.GPSInfo.GPSLongitude(1)),"°",string(meta.GPSInfo.GPSLongitude(2)),"'",string(meta.GPSInfo.GPSLongitude(3)),"''", meta.GPSInfo.GPSLongitudeRef));
%Archivo
disp(strcat(meta.Filename, " Imagen ", meta.Format))