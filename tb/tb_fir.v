#! /opt/oss-cad-suite/bin/vvp
:ivl_version "13.0 (devel)" "(s20251012-105-g8c9cd25ef)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 12;
:vpi_module "/opt/oss-cad-suite/lib/ivl/system.vpi";
:vpi_module "/opt/oss-cad-suite/lib/ivl/vhdl_sys.vpi";
:vpi_module "/opt/oss-cad-suite/lib/ivl/vhdl_textio.vpi";
:vpi_module "/opt/oss-cad-suite/lib/ivl/v2005_math.vpi";
:vpi_module "/opt/oss-cad-suite/lib/ivl/va_math.vpi";
S_0x555568db0420 .scope module, "adder" "adder" 2 1;
 .timescale 0 0;
    .port_info 0 /INPUT 8 "i_x";
    .port_info 1 /INPUT 8 "i_y";
    .port_info 2 /OUTPUT 8 "o_z";
o0x739202da2018 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568dc6b20_0 .net "i_x", 7 0, o0x739202da2018;  0 drivers
o0x739202da2048 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568dc67c0_0 .net "i_y", 7 0, o0x739202da2048;  0 drivers
v0x555568dcd450_0 .net "o_z", 7 0, L_0x555568e09170;  1 drivers
L_0x555568e09170 .arith/sum 8, o0x739202da2018, o0x739202da2048;
S_0x555568de5ba0 .scope module, "fir" "fir" 3 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst_n";
    .port_info 2 /INPUT 15 "x_in";
    .port_info 3 /OUTPUT 15 "y_out";
P_0x555568de7dd0 .param/l "ACC_EXTRA" 1 3 16, +C4<00000000000000000000000000000010>;
P_0x555568de7e10 .param/l "ACC_WIDTH" 1 3 17, +C4<000000000000000000000000000000000000000000000000000000000000100000>;
P_0x555568de7e50 .param/l "DATA_WIDTH" 1 3 12, +C4<000000000000000000000000000001111>;
P_0x555568de7e90 .param/l "ORDER" 0 3 4, +C4<00000000000000000000000000000011>;
P_0x555568de7ed0 .param/l "PROD_WIDTH" 1 3 13, +C4<00000000000000000000000000000000000000000000000000000000000011110>;
P_0x555568de7f10 .param/l "QF" 0 3 3, +C4<00000000000000000000000000001110>;
P_0x555568de7f50 .param/l "QI" 0 3 2, +C4<00000000000000000000000000000001>;
P_0x555568de7f90 .param/l "ROUND_BIAS" 1 3 85, +C4<000000000000000000000000000000010000000000000>;
L_0x555568e1a960 .functor BUFZ 15, L_0x555568e1ac80, C4<000000000000000>, C4<000000000000000>, C4<000000000000000>;
v0x555568e06120_0 .net *"_ivl_10", 44 0, L_0x555568e1ab60;  1 drivers
v0x555568e06200_0 .net *"_ivl_12", 30 0, L_0x555568e1aa70;  1 drivers
v0x555568e062e0_0 .net/s *"_ivl_4", 44 0, L_0x555568e1a7e0;  1 drivers
L_0x739202d590f0 .functor BUFT 1, C4<000000000000000000000000000000010000000000000>, C4<0>, C4<0>, C4<0>;
v0x555568e063a0_0 .net/2s *"_ivl_6", 44 0, L_0x739202d590f0;  1 drivers
v0x555568e06480_0 .net/s *"_ivl_8", 44 0, L_0x555568e1a8c0;  1 drivers
o0x739202da2318 .functor BUFZ 1, c4<z>; HiZ drive
v0x555568e065b0_0 .net "clk", 0 0, o0x739202da2318;  0 drivers
L_0x739202d59018 .functor BUFT 1, C4<000000000000000>, C4<0>, C4<0>, C4<0>;
v0x555568e066a0 .array "coeff", 2 0;
v0x555568e066a0_0 .net/s v0x555568e066a0 0, 14 0, L_0x739202d59018; 1 drivers
L_0x739202d59060 .functor BUFT 1, C4<000000000000001>, C4<0>, C4<0>, C4<0>;
v0x555568e066a0_1 .net/s v0x555568e066a0 1, 14 0, L_0x739202d59060; 1 drivers
L_0x739202d590a8 .functor BUFT 1, C4<000000000000010>, C4<0>, C4<0>, C4<0>;
v0x555568e066a0_2 .net/s v0x555568e066a0 2, 14 0, L_0x739202d590a8; 1 drivers
v0x555568e06780 .array "mult_out", 2 0;
v0x555568e06780_0 .net/s v0x555568e06780 0, 29 0, L_0x555568e19550; 1 drivers
v0x555568e06780_1 .net/s v0x555568e06780 1, 29 0, L_0x555568e19ae0; 1 drivers
v0x555568e06780_2 .net/s v0x555568e06780 2, 29 0, L_0x555568e1a190; 1 drivers
o0x739202da2348 .functor BUFZ 1, c4<z>; HiZ drive
v0x555568e068b0_0 .net "rst_n", 0 0, o0x739202da2348;  0 drivers
v0x555568e06950 .array "sum_full", 2 0;
v0x555568e06950_0 .net/s v0x555568e06950 0, 31 0, L_0x555568e19870; 1 drivers
v0x555568e06950_1 .net/s v0x555568e06950 1, 31 0, L_0x555568e19ee0; 1 drivers
v0x555568e06950_2 .net/s v0x555568e06950 2, 31 0, L_0x555568e1a5e0; 1 drivers
v0x555568e06a10 .array "x_delay", 2 0;
v0x555568e06a10_0 .net/s v0x555568e06a10 0, 14 0, v0x555568e06c70_0; 1 drivers
v0x555568e06a10_1 .net/s v0x555568e06a10 1, 14 0, v0x555568e02de0_0; 1 drivers
v0x555568e06a10_2 .net/s v0x555568e06a10 2, 14 0, v0x555568e04890_0; 1 drivers
o0x739202da2a98 .functor BUFZ 15, c4<zzzzzzzzzzzzzzz>; HiZ drive
v0x555568e06b90_0 .net/s "x_in", 14 0, o0x739202da2a98;  0 drivers
v0x555568e06c70_0 .var/s "x_secuential", 14 0;
v0x555568e06d50_0 .net/s "y_out", 14 0, L_0x555568e1a960;  1 drivers
v0x555568e06e30_0 .net/s "y_out_temp", 14 0, L_0x555568e1ac80;  1 drivers
L_0x555568e1a7e0 .extend/s 45, L_0x555568e1a5e0;
L_0x555568e1a8c0 .arith/sum 45, L_0x555568e1a7e0, L_0x739202d590f0;
L_0x555568e1aa70 .part L_0x555568e1a8c0, 14, 31;
L_0x555568e1ab60 .extend/s 45, L_0x555568e1aa70;
L_0x555568e1ac80 .part L_0x555568e1ab60, 0, 15;
S_0x555568e01720 .scope generate, "g_fir_tap[0]" "g_fir_tap[0]" 3 46, 3 46 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e018d0 .param/l "i" 1 3 46, +C4<00>;
S_0x555568e019b0 .scope generate, "genblk2" "genblk2" 3 71, 3 71 0, S_0x555568e01720;
 .timescale 0 0;
v0x555568de1850_0 .net *"_ivl_3", 0 0, L_0x555568e196e0;  1 drivers
v0x555568de1920_0 .net *"_ivl_5", 1 0, L_0x555568e19780;  1 drivers
L_0x555568e196e0 .part L_0x555568e19550, 29, 1;
L_0x555568e19780 .repeat 2, 2, L_0x555568e196e0;
L_0x555568e19870 .concat [ 30 2 0 0], L_0x555568e19550, L_0x555568e19780;
S_0x555568e01c30 .scope module, "mult" "mult_fxp" 3 64, 4 1 0, S_0x555568e01720;
 .timescale 0 0;
    .port_info 0 /INPUT 15 "a";
    .port_info 1 /INPUT 15 "b";
    .port_info 2 /OUTPUT 30 "mult";
P_0x555568dafdd0 .param/l "A_QF" 0 4 3, +C4<00000000000000000000000000001110>;
P_0x555568dafe10 .param/l "A_QI" 0 4 2, +C4<00000000000000000000000000000001>;
P_0x555568dafe50 .param/l "B_QF" 0 4 5, +C4<00000000000000000000000000001110>;
P_0x555568dafe90 .param/l "B_QI" 0 4 4, +C4<00000000000000000000000000000001>;
v0x555568ddce50_0 .net/s *"_ivl_0", 29 0, L_0x555568e19410;  1 drivers
v0x555568ddcef0_0 .net/s *"_ivl_2", 29 0, L_0x555568e194b0;  1 drivers
v0x555568e02010_0 .net/s "a", 14 0, v0x555568e06c70_0;  alias, 1 drivers
v0x555568e02100_0 .net/s "b", 14 0, L_0x739202d59018;  alias, 1 drivers
v0x555568e021e0_0 .net/s "mult", 29 0, L_0x555568e19550;  alias, 1 drivers
L_0x555568e19410 .extend/s 30, v0x555568e06c70_0;
L_0x555568e194b0 .extend/s 30, L_0x739202d59018;
L_0x555568e19550 .arith/mult 30, L_0x555568e19410, L_0x555568e194b0;
S_0x555568e02390 .scope generate, "g_fir_tap[1]" "g_fir_tap[1]" 3 46, 3 46 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e02590 .param/l "i" 1 3 46, +C4<01>;
S_0x555568e02650 .scope generate, "genblk1" "genblk1" 3 49, 3 49 0, S_0x555568e02390;
 .timescale 0 0;
S_0x555568e02830 .scope module, "register" "zreg" 3 52, 5 1 0, S_0x555568e02650;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst_n";
    .port_info 2 /INPUT 15 "x";
    .port_info 3 /OUTPUT 15 "y";
P_0x555568e02a30 .param/l "DATA_WIDTH" 0 5 2, +C4<000000000000000000000000000001111>;
v0x555568e02b40_0 .net "clk", 0 0, o0x739202da2318;  alias, 0 drivers
v0x555568e02c20_0 .net "rst_n", 0 0, o0x739202da2348;  alias, 0 drivers
v0x555568e02ce0_0 .net "x", 14 0, v0x555568e06c70_0;  alias, 1 drivers
v0x555568e02de0_0 .var "y", 14 0;
E_0x555568d7e330/0 .event negedge, v0x555568e02c20_0;
E_0x555568d7e330/1 .event posedge, v0x555568e02b40_0;
E_0x555568d7e330 .event/or E_0x555568d7e330/0, E_0x555568d7e330/1;
S_0x555568e02f50 .scope generate, "genblk2" "genblk2" 3 71, 3 71 0, S_0x555568e02390;
 .timescale 0 0;
v0x555568e03150_0 .net *"_ivl_4", 0 0, L_0x555568e19c20;  1 drivers
v0x555568e03230_0 .net *"_ivl_6", 1 0, L_0x555568e19cc0;  1 drivers
v0x555568e03310_0 .net *"_ivl_8", 31 0, L_0x555568e19db0;  1 drivers
L_0x555568e19c20 .part L_0x555568e19ae0, 29, 1;
L_0x555568e19cc0 .repeat 2, 2, L_0x555568e19c20;
L_0x555568e19db0 .concat [ 30 2 0 0], L_0x555568e19ae0, L_0x555568e19cc0;
L_0x555568e19ee0 .arith/sum 32, L_0x555568e19870, L_0x555568e19db0;
S_0x555568e033d0 .scope module, "mult" "mult_fxp" 3 64, 4 1 0, S_0x555568e02390;
 .timescale 0 0;
    .port_info 0 /INPUT 15 "a";
    .port_info 1 /INPUT 15 "b";
    .port_info 2 /OUTPUT 30 "mult";
P_0x555568da6e50 .param/l "A_QF" 0 4 3, +C4<00000000000000000000000000001110>;
P_0x555568da6e90 .param/l "A_QI" 0 4 2, +C4<00000000000000000000000000000001>;
P_0x555568da6ed0 .param/l "B_QF" 0 4 5, +C4<00000000000000000000000000001110>;
P_0x555568da6f10 .param/l "B_QI" 0 4 4, +C4<00000000000000000000000000000001>;
v0x555568e038e0_0 .net/s *"_ivl_0", 29 0, L_0x555568e19910;  1 drivers
v0x555568e039e0_0 .net/s *"_ivl_2", 29 0, L_0x555568e19a40;  1 drivers
v0x555568e03ac0_0 .net/s "a", 14 0, v0x555568e02de0_0;  alias, 1 drivers
v0x555568e03bc0_0 .net/s "b", 14 0, L_0x739202d59060;  alias, 1 drivers
v0x555568e03c80_0 .net/s "mult", 29 0, L_0x555568e19ae0;  alias, 1 drivers
L_0x555568e19910 .extend/s 30, v0x555568e02de0_0;
L_0x555568e19a40 .extend/s 30, L_0x739202d59060;
L_0x555568e19ae0 .arith/mult 30, L_0x555568e19910, L_0x555568e19a40;
S_0x555568e03e30 .scope generate, "g_fir_tap[2]" "g_fir_tap[2]" 3 46, 3 46 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e04010 .param/l "i" 1 3 46, +C4<010>;
S_0x555568e040d0 .scope generate, "genblk1" "genblk1" 3 49, 3 49 0, S_0x555568e03e30;
 .timescale 0 0;
S_0x555568e042b0 .scope module, "register" "zreg" 3 52, 5 1 0, S_0x555568e040d0;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst_n";
    .port_info 2 /INPUT 15 "x";
    .port_info 3 /OUTPUT 15 "y";
P_0x555568e044b0 .param/l "DATA_WIDTH" 0 5 2, +C4<000000000000000000000000000001111>;
v0x555568e045b0_0 .net "clk", 0 0, o0x739202da2318;  alias, 0 drivers
v0x555568e046a0_0 .net "rst_n", 0 0, o0x739202da2348;  alias, 0 drivers
v0x555568e04770_0 .net "x", 14 0, v0x555568e02de0_0;  alias, 1 drivers
v0x555568e04890_0 .var "y", 14 0;
S_0x555568e049b0 .scope generate, "genblk2" "genblk2" 3 71, 3 71 0, S_0x555568e03e30;
 .timescale 0 0;
v0x555568e04bb0_0 .net *"_ivl_4", 0 0, L_0x555568e1a320;  1 drivers
v0x555568e04c90_0 .net *"_ivl_6", 1 0, L_0x555568e1a3c0;  1 drivers
v0x555568e04d70_0 .net *"_ivl_8", 31 0, L_0x555568e1a4b0;  1 drivers
L_0x555568e1a320 .part L_0x555568e1a190, 29, 1;
L_0x555568e1a3c0 .repeat 2, 2, L_0x555568e1a320;
L_0x555568e1a4b0 .concat [ 30 2 0 0], L_0x555568e1a190, L_0x555568e1a3c0;
L_0x555568e1a5e0 .arith/sum 32, L_0x555568e19ee0, L_0x555568e1a4b0;
S_0x555568e04e30 .scope module, "mult" "mult_fxp" 3 64, 4 1 0, S_0x555568e03e30;
 .timescale 0 0;
    .port_info 0 /INPUT 15 "a";
    .port_info 1 /INPUT 15 "b";
    .port_info 2 /OUTPUT 30 "mult";
P_0x555568da6640 .param/l "A_QF" 0 4 3, +C4<00000000000000000000000000001110>;
P_0x555568da6680 .param/l "A_QI" 0 4 2, +C4<00000000000000000000000000000001>;
P_0x555568da66c0 .param/l "B_QF" 0 4 5, +C4<00000000000000000000000000001110>;
P_0x555568da6700 .param/l "B_QI" 0 4 4, +C4<00000000000000000000000000000001>;
v0x555568e05340_0 .net/s *"_ivl_0", 29 0, L_0x555568e1a050;  1 drivers
v0x555568e05440_0 .net/s *"_ivl_2", 29 0, L_0x555568e1a0f0;  1 drivers
v0x555568e05520_0 .net/s "a", 14 0, v0x555568e04890_0;  alias, 1 drivers
v0x555568e05620_0 .net/s "b", 14 0, L_0x739202d590a8;  alias, 1 drivers
v0x555568e056e0_0 .net/s "mult", 29 0, L_0x555568e1a190;  alias, 1 drivers
L_0x555568e1a050 .extend/s 30, v0x555568e04890_0;
L_0x555568e1a0f0 .extend/s 30, L_0x739202d590a8;
L_0x555568e1a190 .arith/mult 30, L_0x555568e1a050, L_0x555568e1a0f0;
S_0x555568e05890 .scope generate, "gen_coeff[0]" "gen_coeff[0]" 3 24, 3 24 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e05a70 .param/l "i" 1 3 24, +C4<00>;
S_0x555568e05b50 .scope generate, "gen_coeff[1]" "gen_coeff[1]" 3 24, 3 24 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e05d80 .param/l "i" 1 3 24, +C4<01>;
S_0x555568e05e60 .scope generate, "gen_coeff[2]" "gen_coeff[2]" 3 24, 3 24 0, S_0x555568de5ba0;
 .timescale 0 0;
P_0x555568e06040 .param/l "i" 1 3 24, +C4<010>;
S_0x555568de6780 .scope module, "mem" "mem" 6 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "rst_n";
    .port_info 2 /INPUT 8 "x";
    .port_info 3 /OUTPUT 40 "mem_out";
v0x555568e07620_2 .array/port v0x555568e07620, 2;
v0x555568e06fd0_0 .net *"_ivl_14", 7 0, v0x555568e07620_2;  1 drivers
v0x555568e07620_3 .array/port v0x555568e07620, 3;
v0x555568e070d0_0 .net *"_ivl_19", 7 0, v0x555568e07620_3;  1 drivers
v0x555568e07620_4 .array/port v0x555568e07620, 4;
v0x555568e071b0_0 .net *"_ivl_25", 7 0, v0x555568e07620_4;  1 drivers
v0x555568e07620_0 .array/port v0x555568e07620, 0;
v0x555568e07270_0 .net *"_ivl_4", 7 0, v0x555568e07620_0;  1 drivers
v0x555568e07620_1 .array/port v0x555568e07620, 1;
v0x555568e07350_0 .net *"_ivl_9", 7 0, v0x555568e07620_1;  1 drivers
v0x555568e07480_0 .var "addr", 2 0;
o0x739202da2d38 .functor BUFZ 1, c4<z>; HiZ drive
v0x555568e07560_0 .net "clk", 0 0, o0x739202da2d38;  0 drivers
v0x555568e07620 .array "mem", 4 0, 7 0;
v0x555568e07780_0 .net "mem_out", 39 0, L_0x555568e1b0a0;  1 drivers
o0x739202da2e88 .functor BUFZ 1, c4<z>; HiZ drive
v0x555568e078f0_0 .net "rst_n", 0 0, o0x739202da2e88;  0 drivers
o0x739202da2eb8 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568e079b0_0 .net "x", 7 0, o0x739202da2eb8;  0 drivers
E_0x555568d7e7e0/0 .event negedge, v0x555568e078f0_0;
E_0x555568d7e7e0/1 .event posedge, v0x555568e07560_0;
E_0x555568d7e7e0 .event/or E_0x555568d7e7e0/0, E_0x555568d7e7e0/1;
LS_0x555568e1b0a0_0_0 .concat8 [ 8 8 8 8], v0x555568e07620_0, v0x555568e07620_1, v0x555568e07620_2, v0x555568e07620_3;
LS_0x555568e1b0a0_0_4 .concat8 [ 8 0 0 0], v0x555568e07620_4;
L_0x555568e1b0a0 .concat8 [ 32 8 0 0], LS_0x555568e1b0a0_0_0, LS_0x555568e1b0a0_0_4;
S_0x555568de1280 .scope module, "mult" "mult" 7 1;
 .timescale -9 -12;
    .port_info 0 /INPUT 8 "i_x";
    .port_info 1 /INPUT 8 "i_y";
    .port_info 2 /OUTPUT 8 "o_z";
o0x739202da2fa8 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568e07b10_0 .net "i_x", 7 0, o0x739202da2fa8;  0 drivers
o0x739202da2fd8 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568e07c10_0 .net "i_y", 7 0, o0x739202da2fd8;  0 drivers
v0x555568e07cf0_0 .net "o_z", 7 0, L_0x555568e1b370;  1 drivers
L_0x555568e1b370 .arith/mult 8, o0x739202da2fa8, o0x739202da2fd8;
S_0x555568dde1f0 .scope module, "sum_fxp" "sum_fxp" 8 1;
 .timescale -9 -12;
    .port_info 0 /INPUT 8 "a";
    .port_info 1 /INPUT 8 "b";
    .port_info 2 /OUTPUT 9 "sum";
P_0x555568db7230 .param/l "A_BITS" 1 8 13, +C4<000000000000000000000000000001000>;
P_0x555568db7270 .param/l "A_QF" 0 8 3, +C4<00000000000000000000000000000111>;
P_0x555568db72b0 .param/l "A_QI" 0 8 2, +C4<00000000000000000000000000000001>;
P_0x555568db72f0 .param/l "B_BITS" 1 8 14, +C4<000000000000000000000000000001000>;
P_0x555568db7330 .param/l "B_QF" 0 8 5, +C4<00000000000000000000000000000111>;
P_0x555568db7370 .param/l "B_QI" 0 8 4, +C4<00000000000000000000000000000001>;
P_0x555568db73b0 .param/l "SHIFT_A_QF" 1 8 21, +C4<000000000000000000000000000000000>;
P_0x555568db73f0 .param/l "SHIFT_A_QI" 1 8 20, +C4<0000000000000000000000000000000001>;
P_0x555568db7430 .param/l "SHIFT_B_QF" 1 8 23, +C4<000000000000000000000000000000000>;
P_0x555568db7470 .param/l "SHIFT_B_QI" 1 8 22, +C4<0000000000000000000000000000000001>;
P_0x555568db74b0 .param/l "SUM_BITS" 1 8 17, +C4<0000000000000000000000000000001001>;
P_0x555568db74f0 .param/l "SUM_QF" 1 8 16, +C4<00000000000000000000000000000111>;
P_0x555568db7530 .param/l "SUM_QI" 1 8 15, +C4<000000000000000000000000000000010>;
v0x555568e07e30_0 .net *"_ivl_1", 0 0, L_0x555568e1b410;  1 drivers
v0x555568e07f10_0 .net *"_ivl_5", 0 0, L_0x555568e1b680;  1 drivers
o0x739202da3128 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568e07ff0_0 .net/s "a", 7 0, o0x739202da3128;  0 drivers
v0x555568e080b0_0 .net/s "a_aligned", 8 0, L_0x555568e1b510;  1 drivers
o0x739202da3188 .functor BUFZ 8, c4<zzzzzzzz>; HiZ drive
v0x555568e08190_0 .net/s "b", 7 0, o0x739202da3188;  0 drivers
v0x555568e08270_0 .net/s "b_aligned", 8 0, L_0x555568e1b720;  1 drivers
v0x555568e08350_0 .net/s "sum", 8 0, L_0x555568e1b8c0;  1 drivers
L_0x555568e1b410 .part o0x739202da3128, 7, 1;
L_0x555568e1b510 .concat [ 8 1 0 0], o0x739202da3128, L_0x555568e1b410;
L_0x555568e1b680 .part o0x739202da3188, 7, 1;
L_0x555568e1b720 .concat [ 8 1 0 0], o0x739202da3188, L_0x555568e1b680;
L_0x555568e1b8c0 .arith/sum 9, L_0x555568e1b510, L_0x555568e1b720;
S_0x555568ddef70 .scope module, "tb_mult_fxp" "tb_mult_fxp" 4 18;
 .timescale -9 -12;
P_0x555568da6530 .param/l "A_QF" 1 4 21, +C4<00000000000000000000000000000111>;
P_0x555568da6570 .param/l "A_QI" 1 4 20, +C4<00000000000000000000000000000001>;
P_0x555568da65b0 .param/l "B_QF" 1 4 23, +C4<00000000000000000000000000000110>;
P_0x555568da65f0 .param/l "B_QI" 1 4 22, +C4<00000000000000000000000000000010>;
v0x555568e08ee0_0 .var/s "a", 0 -7;
v0x555568e08fa0_0 .var/s "b", 1 -6;
v0x555568e09070_0 .net/s "mult", 2 -13, L_0x555568e1bc50;  1 drivers
S_0x555568e084b0 .scope module, "DUT" "mult_fxp" 4 34, 4 1 0, S_0x555568ddef70;
 .timescale 0 0;
    .port_info 0 /INPUT 8 "a";
    .port_info 1 /INPUT 8 "b";
    .port_info 2 /OUTPUT 16 "mult";
P_0x555568dddd60 .param/l "A_QF" 0 4 3, +C4<00000000000000000000000000000111>;
P_0x555568dddda0 .param/l "A_QI" 0 4 2, +C4<00000000000000000000000000000001>;
P_0x555568dddde0 .param/l "B_QF" 0 4 5, +C4<00000000000000000000000000000110>;
P_0x555568ddde20 .param/l "B_QI" 0 4 4, +C4<00000000000000000000000000000010>;
v0x555568e08980_0 .net/s *"_ivl_0", 15 0, L_0x555568e1ba70;  1 drivers
v0x555568e08a80_0 .net/s *"_ivl_2", 15 0, L_0x555568e1bb60;  1 drivers
v0x555568e08b60_0 .net/s "a", 7 0, v0x555568e08ee0_0;  1 drivers
v0x555568e08c50_0 .net/s "b", 7 0, v0x555568e08fa0_0;  1 drivers
v0x555568e08d30_0 .net/s "mult", 15 0, L_0x555568e1bc50;  alias, 1 drivers
L_0x555568e1ba70 .extend/s 16, v0x555568e08ee0_0;
L_0x555568e1bb60 .extend/s 16, v0x555568e08fa0_0;
L_0x555568e1bc50 .arith/mult 16, L_0x555568e1ba70, L_0x555568e1bb60;
    .scope S_0x555568e02830;
T_0 ;
    %wait E_0x555568d7e330;
    %load/vec4 v0x555568e02c20_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.0, 8;
    %pushi/vec4 0, 0, 15;
    %assign/vec4 v0x555568e02de0_0, 0;
    %jmp T_0.1;
T_0.0 ;
    %load/vec4 v0x555568e02ce0_0;
    %assign/vec4 v0x555568e02de0_0, 0;
T_0.1 ;
    %jmp T_0;
    .thread T_0;
    .scope S_0x555568e042b0;
T_1 ;
    %wait E_0x555568d7e330;
    %load/vec4 v0x555568e046a0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.0, 8;
    %pushi/vec4 0, 0, 15;
    %assign/vec4 v0x555568e04890_0, 0;
    %jmp T_1.1;
T_1.0 ;
    %load/vec4 v0x555568e04770_0;
    %assign/vec4 v0x555568e04890_0, 0;
T_1.1 ;
    %jmp T_1;
    .thread T_1;
    .scope S_0x555568de5ba0;
T_2 ;
    %wait E_0x555568d7e330;
    %load/vec4 v0x555568e068b0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.0, 8;
    %pushi/vec4 0, 0, 15;
    %assign/vec4 v0x555568e06c70_0, 0;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v0x555568e06b90_0;
    %assign/vec4 v0x555568e06c70_0, 0;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
    .scope S_0x555568de6780;
T_3 ;
    %wait E_0x555568d7e7e0;
    %load/vec4 v0x555568e078f0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_3.0, 8;
    %pushi/vec4 0, 0, 3;
    %assign/vec4 v0x555568e07480_0, 0;
    %jmp T_3.1;
T_3.0 ;
    %load/vec4 v0x555568e079b0_0;
    %load/vec4 v0x555568e07480_0;
    %pad/u 4;
    %ix/vec4 3;
    %ix/load 4, 0, 0; Constant delay
    %assign/vec4/a/d v0x555568e07620, 0, 4;
    %load/vec4 v0x555568e07480_0;
    %addi 1, 0, 3;
    %assign/vec4 v0x555568e07480_0, 0;
T_3.1 ;
    %jmp T_3;
    .thread T_3;
    .scope S_0x555568ddef70;
T_4 ;
    %pushi/vec4 1, 0, 8;
    %store/vec4 v0x555568e08ee0_0, 0, 8;
    %pushi/vec4 1, 0, 8;
    %store/vec4 v0x555568e08fa0_0, 0, 8;
    %delay 1000, 0;
    %vpi_call 4 45 "$display", "a = %8b, b = %8b", v0x555568e08ee0_0, v0x555568e08fa0_0 {0 0 0};
    %vpi_call 4 46 "$display", "mult = a * b = %16b", v0x555568e09070_0 {0 0 0};
    %vpi_call 4 48 "$finish" {0 0 0};
    %end;
    .thread T_4;
# The file index is used to find the file name in the following table.
:file_names 9;
    "N/A";
    "<interactive>";
    "rtl/adder.v";
    "rtl/fir.v";
    "rtl/mult_fxp.v";
    "rtl/zreg.v";
    "rtl/mem.v";
    "rtl/mult.v";
    "rtl/sum_fxp.v";
