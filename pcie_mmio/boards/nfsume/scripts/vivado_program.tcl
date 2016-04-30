set bitfile build/pemu.bit
set device xc7vx690t_0

open_hw
connect_hw_server -url localhost:3121

current_hw_target [get_hw_targets */xilinx_tcf/Xilinx/*]
open_hw_target

current_hw_device [lindex [get_hw_devices ${device}] 0]
refresh_hw_device [lindex [get_hw_devices ${device}] 0]
set_property PROGRAM.FILE $bitfile [lindex [get_hw_devices ${device}] 0]

program_hw_devices [lindex [get_hw_devices ${device}] 0]
