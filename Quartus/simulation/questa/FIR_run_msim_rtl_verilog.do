transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+/home/isaac/Documents/Cinvestav/Digital/FIR1/rtl {/home/isaac/Documents/Cinvestav/Digital/FIR1/rtl/fir.v}

vlog -sv -work work +incdir+/home/isaac/Documents/Cinvestav/Digital/FIR1/Quartus/../tb {/home/isaac/Documents/Cinvestav/Digital/FIR1/Quartus/../tb/tb_fir.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_fir

add wave *
view structure
view signals
run -all
