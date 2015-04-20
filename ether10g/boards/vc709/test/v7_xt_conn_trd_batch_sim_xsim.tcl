# Vivado Launch Script in batch mode

source scripts/v7_xt_conn_trd.tcl

set_property target_simulator XSim [current_project]

launch_simulation -simset sim_1 -mode behavioral

run 200us
