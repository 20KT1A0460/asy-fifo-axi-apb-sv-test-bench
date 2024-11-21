vlog top.sv  +acc
vsim -assertdebug  top
add wave -r *
add wave sim:/top/s/as6
run -all
