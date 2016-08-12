# Vivado Launch Script

#### Change design settings here #######
set design top
set rtl_top top
set sim_top board
set device xc7vx690t-3-ffg1761
set bit_settings v7_xt_conn_bit_rev1_0.xdc

########################################

# Project Settings
create_project -name ${design} -force -dir "./runs" -part ${device}
set_property source_mgmt_mode DisplayOnly [current_project]

set_property top ${rtl_top} [current_fileset]


#  if {$LOOPBACK_ONLY} {
#    puts "Using DMA Loopback design with no DDR3 or Ethernet"
#    set_property verilog_define { {DMA_LOOPBACK=1} {USE_PVTMON=1} } [current_fileset]
#  } elseif {$BASE_ONLY} {
#    puts "Using PCIe, DMA, DDR3, and Virtual FIFO, but no Ethernet"
#    set_property verilog_define { {USE_DDR3_FIFO=1} {BASE_ONLY=1} {USE_PVTMON=1} } [current_fileset]
#  } elseif {$NO_DDR3} {
#    puts "Using PCIe, DMA, Ethernet, but no DDR3"
#    set_property verilog_define { {USE_XPHY=1} {USE_PVTMON=1} } [current_fileset]
#  } else {
#    puts "Using full Targeted Reference Design, with DDR3 and Ethernet"
    set_property verilog_define { {USE_DDR3_FIFO=1} {USE_XPHY=1} {USE_PVTMON=1} } [current_fileset]
#  }

# Project Constraints
#  if {$LOOPBACK_ONLY} {
#    add_files -fileset constrs_1 -norecurse ../constraints/v7_xt_conn_trd_loopback.xdc
#    add_files -fileset constrs_1 -norecurse ../constraints/${bit_settings}
#  } elseif {$BASE_ONLY} {
#    add_files -fileset constrs_1 -norecurse ../constraints/v7_xt_conn_trd_base.xdc
#    add_files -fileset constrs_1 -norecurse ../constraints/${bit_settings}
#  } elseif {$NO_DDR3} {
#    add_files -fileset constrs_1 -norecurse ../constraints/v7_xt_xgemac_xphy.xdc
#    add_files -fileset constrs_1 -norecurse ../constraints/v7_xt_conn_trd_noddr3.xdc
#    add_files -fileset constrs_1 -norecurse ../constraints/${bit_settings}
#  } else {
    # FULL case
    add_files -fileset constrs_1 -norecurse ../constraints/sume.xdc
    add_files -fileset constrs_1 -norecurse ../constraints/sume-eth.xdc
    add_files -fileset constrs_1 -norecurse ../constraints/${bit_settings}
#  }


  # Project Design Files from IP Catalog (comment out IPs using legacy Coregen cores)
#  read_ip -files {../ip_catalog/pcie3_x8_ip/pcie3_x8_ip.xci}  
  
#  if {!$LOOPBACK_ONLY} {
#    read_ip -files {../ip_catalog/axi4lite_crossbar/axi4lite_crossbar.xci}
#  }
  
#  if {!$LOOPBACK_ONLY && !$BASE_ONLY} {
#    read_ip -files {../ip_catalog/axis_async_fifo/axis_async_fifo.xci} 
#    read_ip -files {../ip_catalog/cmd_fifo_xgemac_rxif/cmd_fifo_xgemac_rxif.xci} 
#  }
  
#  if {!$LOOPBACK_ONLY && !$NO_DDR3} {
#    read_ip -files {../ip_catalog/axis_ic_4x1_wr/axis_ic_4x1_wr.xci}   
#    read_ip -files {../ip_catalog/axis_ic_1x4_rd/axis_ic_1x4_rd.xci}   
#    read_ip -files {../ip_catalog/axi_vfifo_ctrl_ip/axi_vfifo_ctrl_ip.xci}   
#    read_ip -files {../ip_catalog/mig_axi_mm_dual/mig_axi_mm_dual.xci}  
#  }
  
#  if {!$LOOPBACK_ONLY && $NO_DDR3} {
#    read_ip -files {../ip_catalog/axis_ic_wr/axis_ic_wr.xci} 
#    read_ip -files {../ip_catalog/axis_ic_rd/axis_ic_rd.xci} 
#  }
  
#  if {!$LOOPBACK_ONLY && !$BASE_ONLY} {
#    read_ip -files {../ip_catalog/ten_gig_eth_mac_axi_st_ip/ten_gig_eth_mac_axi_st_ip.xci} 
    read_ip -files {../ip_catalog/ten_gig_eth_pcs_pma_ip/ten_gig_eth_pcs_pma_ip.xci} 
    read_ip -files {../ip_catalog/ten_gig_eth_pcs_pma_ip_shared_logic_in_core/ten_gig_eth_pcs_pma_ip_shared_logic_in_core.xci} 
    read_ip -files {../ip_catalog/si5324_regs_rom/si5324_regs_rom.xcix} 
#  }
  
  
  #- NWL Packet DMA source
#  read_verilog "../ip_cores/dma/netlist/eval/dma_back_end_axi.vp"
  
#  if {!$LOOPBACK_ONLY} {
#    read_verilog "../rtl/common/axilite_system.v"
#  }
  
  #- AXI4LITE IPIF
#  read_verilog "../ip_cores/axi_lite_ipif/address_decoder.v"
#  read_verilog "../ip_cores/axi_lite_ipif/axi_lite_ipif.v"
#  read_verilog "../ip_cores/axi_lite_ipif/pselect_f.v"
#  read_verilog "../ip_cores/axi_lite_ipif/counter_f.v"
#  read_verilog "../ip_cores/axi_lite_ipif/slave_attachment.v"
  
  # Other Custom logic source files
#  read_verilog "../rtl/common/synchronizer_simple.v"
#  read_verilog "../rtl/common/synchronizer_vector.v"
#  read_verilog "../rtl/common/registers.v"
#  read_verilog "../rtl/common/user_registers_slave.v"
#  read_verilog "../rtl/common/pcie_monitor_gen3.v"
#  read_verilog "../rtl/packet_dma_axi.v"
  
#  if {!$LOOPBACK_ONLY && !$NO_DDR3} {
#    read_verilog "../rtl/axis_vfifo_ctrl_ip.v"
#  }
  
#  if {!$LOOPBACK_ONLY && $NO_DDR3} {
#    read_verilog "../rtl/axis_ic_bram.v"
#  }
  
#  if {!$LOOPBACK_ONLY && !$BASE_ONLY} {
#    read_verilog "../rtl/network_path/rx_interface.v"
    read_verilog "../rtl/network_path/network_path_shared.v"
    read_verilog "../rtl/network_path/network_path.v"
#  }
  
  
#  read_vhdl "../rtl/pvtmon/kcpsm6.vhd"
#  read_vhdl "../rtl/pvtmon/power_test_control.vhd"
#  read_vhdl "../rtl/pvtmon/vc709_power_test.vhd"
#  read_vhdl "../rtl/pvtmon/power_test_control_program.vhd"
  
#  if {!$LOOPBACK_ONLY || !$BASE_ONLY} {
#    read_vhdl "../rtl/clock_control/clock_control.vhd"
#    read_vhdl "../rtl/clock_control/clock_control_program.vhd"
#    read_vhdl "../rtl/clock_control/kcpsm6.vhd"
#  }
  
#  if {!$LOOPBACK_ONLY} {
#    read_verilog "../rtl/gen_chk/crc32_D32_wrapper.v"
#    read_verilog "../rtl/gen_chk/hdr_crc_checker.v"
#    read_verilog "../rtl/gen_chk/hdr_crc_insert.v"
#    read_verilog "../rtl/gen_chk/axi_stream_gen.v"
#    read_verilog "../rtl/gen_chk/axi_stream_crc_gen_check.v"
#  }
  
#  read_verilog "../rtl/pipe_clock.v"
  read_verilog "../rtl/top.v"
  read_verilog "../rtl/app.v"
  read_verilog "../../../cores/xgmiisync/rtl/xgmiisync.v"
  read_verilog "../../../cores/crc32/rtl/CRC32_D64.v"
    
  read_vhdl "../rtl/SFP_CLK_INIT_rtl/clk_init_engine.vhd"
  read_vhdl "../rtl/SFP_CLK_INIT_rtl/sfp_refclk_init.vhd"
  read_vhdl "../rtl/SFP_CLK_INIT_rtl/pkg_clk_init_engine.vhd"
  read_verilog "../rtl/SFP_CLK_INIT_rtl/i2c/trunk/rtl/verilog/i2c_master_bit_ctrl.v" 
  read_verilog "../rtl/SFP_CLK_INIT_rtl/i2c/trunk/rtl/verilog/i2c_master_byte_ctrl.v"
  read_verilog "../rtl/SFP_CLK_INIT_rtl/i2c/trunk/rtl/verilog/i2c_master_top.v" 


#Setting Synthesis options
set_property strategy Flow_PerfOptimized_High [get_runs synth_1]
#Setting Implementation options
set_property steps.phys_opt_design.is_enabled true [get_runs impl_1]

# Pick best strategy for different runs
set_property strategy Performance_Explore [get_runs impl_1]


# Set OOC for DMA for best timing results
#  create_fileset -blockset -define_from dma_back_end_axi dma_back_end_axi

  # Constrain DMA during OOC synthesis
#  create_fileset -constrset dma_constraints
#  add_files -fileset dma_constraints -norecurse ../constraints/dma_back_end_axi_ooc.xdc
#  add_files -fileset dma_back_end_axi [get_files dma_back_end_axi_ooc.xdc]
#  set_property USED_IN {out_of_context synthesis implementation} [get_files dma_back_end_axi_ooc.xdc]
#  set_property strategy Flow_PerfOptimized_High [get_runs dma_back_end_axi_synth_1]

####################
# Set up Simulations
#set_property top ${sim_top} [get_filesets sim_1]
#set_property include_dirs { ../testbench ../testbench/dsport ../testbench/include ../rtl/gen_chk ./} [get_filesets sim_1]

#  if {$LOOPBACK_ONLY} {
#    set_property verilog_define { {USE_PIPE_SIM=1} {SIMULATION=1} {DMA_LOOPBACK=1} } [get_filesets sim_1]
#  } elseif {$BASE_ONLY} {
#    set_property verilog_define { {USE_PIPE_SIM=1} {SIMULATION=1} {USE_DDR3_FIFO=1} {BASE_ONLY=1} {x4Gb=1} {sg107E=1} {x8=1}} [get_filesets sim_1]
#  } elseif {$NO_DDR3} {
#    set_property verilog_define { {USE_PIPE_SIM=1} {SIMULATION=1} {USE_XPHY=1} {NW_PATH_ENABLE=1} } [get_filesets sim_1]
#  } else {
#    set_property verilog_define { {USE_PIPE_SIM=1} {SIMULATION=1} {USE_DDR3_FIFO=1} {USE_XPHY=1} {NW_PATH_ENABLE=1} {x4Gb=1} {sg107E=1} {x8=1}} [get_filesets sim_1]
#  }
#
# Vivado Simulator settings
#set_property -name xsim.simulate.xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
#set_property xsim.simulate.runtime {200us} [get_filesets sim_1]
#if {$LOOPBACK_ONLY || $NO_DDR3} {
#    set_property XSIM.TCLBATCH "../../../../scripts/xsim_wave_loopback.tcl" [get_filesets sim_1]
## FULL or BASE
#} else {
#    set_property XSIM.TCLBATCH "../../../../scripts/xsim_wave.tcl" [get_filesets sim_1]
#}

# Default to MTI
#set_property target_simulator ModelSim [current_project]

# MTI settings
#set_property modelsim.simulate.runtime {200us} [get_filesets sim_1]
#set_property -name modelsim.compile.vlog.more_options -value +acc -objects [get_filesets sim_1]
#set_property -name modelsim.simulate.vsim.more_options -value {+notimingchecks +TESTNAME=basic_test } -objects [get_filesets sim_1]
#set_property compxlib.compiled_library_dir {} [current_project]

#if {$LOOPBACK_ONLY || $NO_DDR3} {
#     set_property modelsim.simulate.custom_udo "../../../../scripts/wave_loopback.do" [get_filesets sim_1]
# FULL or BASE
#} else {
#     set_property modelsim.simulate.custom_udo "../../../../scripts/wave.do" [get_filesets sim_1]
#}

# PCIe TB files (simulation only)
#add_files -fileset sim_1 "../testbench/pipe_clock.v"
#add_files -fileset sim_1 "../testbench/dsport/pci_exp_usrapp_com.v"
#add_files -fileset sim_1 "../testbench/dsport/pci_exp_usrapp_tx.v"
#add_files -fileset sim_1 "../testbench/dsport/pci_exp_usrapp_cfg.v"
#add_files -fileset sim_1 "../testbench/dsport/pci_exp_usrapp_rx.v"
#add_files -fileset sim_1 "../testbench/dsport/xilinx_pcie_3_0_7vx_rp.v"
#add_files -fileset sim_1 "../testbench/board.v"

#add_files -fileset sim_1 "../testbench/pcie3_x8_ip_gt_top_pipe.v"

#if {$LOOPBACK_ONLY || $NO_DDR3} {
#    set_property include_dirs { ../testbench ../testbench/dsport ../testbench/include ../rtl/gen_chk} [get_filesets sim_1]
#
#} else {
#    set_property include_dirs { ../testbench ../testbench/dsport ../testbench/include ../rtl/gen_chk ../ip_catalog/mig_axi_mm_dual/mig_axi_mm_dual/example_design/sim} [get_filesets sim_1]
#  
#}


#if {!$LOOPBACK_ONLY && !$NO_DDR3} {
#    add_files -fileset sim_1 -norecurse ../ip_catalog/mig_axi_mm_dual/mig_axi_mm_dual/example_design/sim/c0_ddr3_model.v
#    add_files -fileset sim_1 -norecurse ../ip_catalog/mig_axi_mm_dual/mig_axi_mm_dual/example_design/sim/c1_ddr3_model.v
#}



