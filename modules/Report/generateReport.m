function generateReport(nCase, analystName, description)
    date = datetime;
    text = strcat("<!DOCTYPE html><html lang='es'><head><meta charset='UTF-8'><title>Informe imagen </title></head><body><header style='text-align: center'><img src='src\SCI-H.png' alt='logo' height='100px'><br><b>Source camera identification by Hellinger Distance</b><hr><h1>INFORME DE RESULTADOS</h1></header><p><b>Fecha:</b> ",string(date),"<br><b>No. de Caso:</b> ",string(nCase),"<br><b>Nombre del Analista:</b> ",string(analystName),"<br><b>Descripcion del caso</b><br>",string(description),"<br></p><p style='text-align: center'>____________________________<br>Firma</p></body></html>");
    writelines(text, "test.html")

    open("test.html");