clearvars;

x = [0.5 -0.25 0.75 0.25 -0.75];

h = designFIR(0, pi/4, 7);

y_matlab = conv(h, x, "full");

y_verilog = [0.012024 0.040649 0.110657 0.168640 0.219849 0.202515 0.063965 ...
    -0.103943 -0.132568 -0.064026 -0.018127];

close all;
stem(y_verilog, 'DisplayName', 'Verilog');
hold on; stem(y_matlab, 'DisplayName', 'Matlab', 'MarkerSize', 10);
legend;