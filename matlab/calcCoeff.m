% Este programa obtiene los parametros de configuracion y genera y
% escribe los coeficientes en 'coeffs.hex'. 
% Cualquier cambio de parametros debe de realizarse en el archivo json.

params = jsondecode(fileread('../config/params.json'));

% Generacion de coeficientes
W1 = params.W1*pi;
W2 = params.W2*pi;

h = designFIR(W1, W2, params.TAPS);

% Cuantizacion
QF = params.QF;
QI = params.QI;
scale = 2^QF;
h_fixed = round(h * scale);

DATA_WIDTH = QI + QF;

% Escribir los coeficientes cuantizados en un archivo hexadecimal
fid = fopen('../config/coeffs.hex', 'w');
for i=1:length(h_fixed)
    val = h_fixed(i);

    if val < 0
        val = val + 2^DATA_WIDTH; % Convertir en comlpemento a dos
    end

    fprintf(fid, '%0*X\n', ceil(DATA_WIDTH/4), val);
end

fclose(fid);

% Confirm successful writing of coefficients
disp('Coeficientes cuantizados escritos en coeffs.hex');