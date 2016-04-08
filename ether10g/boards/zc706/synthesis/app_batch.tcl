# Vivado Launch Script in batch mode

source app_gui.tcl

generate_target all [get_ips]

reset_run synth_1 
launch_run [get_runs synth_1]

wait_on_run synth_1

reset_run impl_1
launch_run -to_step write_bitstream [get_runs impl_1]

wait_on_run impl_1
