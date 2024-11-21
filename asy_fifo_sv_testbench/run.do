vlog top.sv  +acc
vsim  -assertdebug top
add wave  -r  *
add wave /top/s/as1 /top/s/as2 /top/s/as3 /top/s/as4
run -all
