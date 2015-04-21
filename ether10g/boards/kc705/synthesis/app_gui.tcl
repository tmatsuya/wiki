# PlanAhead Launch Script
set design_top top
set sim_top board
set device xc7k325t-2-ffg900
set proj_dir runs 
set impl_const ../constraints/kc705sfp.xdc

create_project -name ${design_top} -force -dir "./${proj_dir}" -part ${device}

# Project Settings

set_property top ${design_top} [current_fileset]
set_property verilog_define {{USE_VIVADO=1}} [current_fileset]

#add_files -fileset constrs_1 -norecurse ../constraints/xilinx_pcie_7x_ep_x4g2_KC705_REVC.xdc
#set_property used_in_synthesis true [get_files ../constraints/xilinx_pcie_7x_ep_x4g2_KC705_REVC.xdc]
#add_files -fileset constrs_1 -norecurse ../constraints/k7_conn_pcie.xdc
#set_property used_in_synthesis true [get_files ../constraints/k7_conn_pcie.xdc]
add_files -fileset constrs_1 -norecurse ./${impl_const}
set_property used_in_synthesis true [get_files ./${impl_const}]

# Project Design Files from IP Catalog (comment out IPs using legacy Coregen cores)
import_ip -files {../ip_catalog/ten_gig_eth_pcs_pma_ip.xci} -name ten_gig_eth_pcs_pma_ip 

# Other Custom logic sources/rtl files
read_verilog "../rtl/network_path/xgbaser_gt_same_quad_wrapper.v"
read_verilog "../rtl/network_path/network_path.v"
read_verilog "../rtl/network_path/ten_gig_eth_pcs_pma_ip_GT_Common_wrapper.v"
read_verilog "../rtl/top.v"
read_verilog "../rtl/app.v"
read_verilog "../../../cores/xgmiisync/rtl/xgmiisync.v"
read_verilog "../../../cores/crc32/rtl/CRC32_D64.v"
read_vhdl "../rtl/clock_control/clock_control.vhd"
read_vhdl "../rtl/clock_control/clock_control_program.vhd"
read_vhdl "../rtl/clock_control/kcpsm6.vhd"



# NGC files
#read_edif "../ip_cores/dma/netlist/eval/dma_back_end_axi.ngc"

#Setting Rodin Sythesis options
set_property flow {Vivado Synthesis 2014} [get_runs synth_1]
set_property steps.phys_opt_design.is_enabled true [get_runs impl_1]

set_property flow {Vivado Implementation 2014} [get_runs impl_1]

####################
# Set up Simulations
# Get the current working directory
#set CurrWrkDir [pwd]
#
#if [info exists env(MODELSIM)] {
#  puts "MODELSIM env pointing to ini exists..."
#} elseif {[file exists $CurrWrkDir/modelsim.ini] == 1} {
#  set env(MODELSIM) $CurrWrkDir/modelsim.ini
#  puts "Setting \$MODELSIM to modelsim.ini"
#} else {
#  puts "\n\nERROR! modelsim.ini not found!"
#  exit
#}

#set_property target_simulator ModelSim [current_project]
#set_property -name modelsim.vlog_more_options -value +acc -objects [get_filesets sim_1]
#set_property -name modelsim.vsim_more_options -value {+notimingchecks -do "../../../../wave.do; run -all" +TESTNAME=basic_test -GSIM_COLLISION_CHECK=NONE } -objects [get_filesets sim_1]
#set_property compxlib.compiled_library_dir {} [current_project]
#
#set_property include_dirs { ../testbench ../testbench/dsport ../include } [get_filesets sim_1]
#
