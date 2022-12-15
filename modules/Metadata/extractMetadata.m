function metadata = extractMetadata(path, file)
    meta = imfinfo(strcat(string(path),string(file)));
                
    des = '...';
    orig = '...';
    cam = '...';
    adv_photo = '...';
    gps = '...';
    arch = '...';
    
    if isfield(meta,'Description') == 1
        if ~isempty(meta.Description)
            des = string(meta.Description);
        end
    end
    if isfield(meta,'Software') == 1
        if ~isempty(meta.Software)
            orig = strcat("Software: ",string(meta.Software));
        end
    end
    if isfield(meta,'Make') == 1
        if ~isempty(meta.Make)
            cam = string(meta.Make);
        end
    end
    if isfield(meta,'Model') == 1
        if ~isempty(meta.Model)
            cam = strcat(cam, " ", string(meta.Model));
        end
    end
    if isfield(meta,'GPSInfo') == 1 && isfield(meta,'GPSInfo.GPSLatitude') == 1 
        if ~isempty(meta.GPSInfo)
            gps = strcat(string(meta.GPSInfo.GPSLatitude(1)),"°",string(meta.GPSInfo.GPSLatitude(2)),"'",string(meta.GPSInfo.GPSLatitude(3)),"''", meta.GPSInfo.GPSLatitudeRef, " , ", string(meta.GPSInfo.GPSLongitude(1)),"°",string(meta.GPSInfo.GPSLongitude(2)),"'",string(meta.GPSInfo.GPSLongitude(3)),"''", meta.GPSInfo.GPSLongitudeRef);
        end
    end
    if isfield(meta,'Format') == 1
        if ~isempty(meta.Format)
            arch = strcat(file, " Imagen ", meta.Format);
        end
    end
    
    metadata.des = des;
    metadata.orig = orig;
    metadata.cam = cam;
    metadata.adv_photo = adv_photo;
    metadata.gps = gps;
    metadata.arch = arch;