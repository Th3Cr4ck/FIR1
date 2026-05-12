clearvars;

params = jsondecode(fileread('../config/params.json'));

% =========================================================
% Entrada EXACTAMENTE igual al TB
% =========================================================
x = [0.5 -0.25 0.75 0.25 -0.75 0];

% =========================================================
% Leer salida Verilog
% =========================================================
y_verilog = readmatrix('../simulation/results.txt');

% =========================================================
% FIR ideal (floating point)
% =========================================================
h = designFIR(params.W1*pi, ...
              params.W2*pi, ...
              params.TAPS);

% =========================================================
% Salida teórica ideal
% =========================================================
y_matlab = conv(x, h, "full");

% =========================================================
% LATENCIA DEL DUT
%
% y_out registrado -> 1 ciclo extra
% =========================================================
latency = 1;

y_matlab = [zeros(1, latency), y_matlab];

% =========================================================
% Igualar longitudes
% =========================================================
N = min(length(y_matlab), length(y_verilog));

y_matlab  = y_matlab(1:N);
y_verilog = y_verilog(1:N);

% =========================================================
% Forzar vectores columna
% =========================================================
y_matlab  = y_matlab(:);
y_verilog = y_verilog(:);

% =========================================================
% Error
% =========================================================
err_vec = y_matlab - y_verilog;

er = norm(err_vec);

rmse = sqrt(mean(err_vec.^2));

fprintf('\n====================================\n');
fprintf('Validación FIR Fixed-Point\n');
fprintf('====================================\n');

fprintf('Norma del error = %.10f\n', er);
fprintf('RMSE            = %.10f\n', rmse);

% =========================================================
% Tabla comparativa
% =========================================================
n_vec = (0:N-1)';

disp(table( ...
    n_vec, ...
    y_matlab, ...
    y_verilog, ...
    err_vec, ...
    abs(err_vec), ...
    'VariableNames', ...
    {'n','MATLAB','Verilog','Error','AbsError'}));
% =========================================================
% Gráfica
% =========================================================
fig = figure('Visible', 'off');

stem(y_matlab, ...
     'DisplayName', ...
     'MATLAB ideal');

hold on;

stem(y_verilog, ...
     'DisplayName', ...
     'Verilog fixed');

grid on;
legend;

title(sprintf('FIR Validation Q%d.%d', ...
      params.QI, ...
      params.QF));

xlabel('n');
ylabel('Amplitude');

saveas(fig, '../simulation/results.png');

disp('Gráfica creada.');
