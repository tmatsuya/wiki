# Vivado Launch Script in batch mode

source app_gui.tcl

launch_run -to_step write_bitstream [get_runs impl_1]

wait_on_run impl_1
