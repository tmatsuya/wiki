###############################################################################
# This XDC is intended for use with the Xilinx KC705 Development Board with a 
# xc7k325t-ffg900-2 part
###############################################################################
##---------------------------------------------------------------------------------------
## 10GBASE-R constraints
##---------------------------------------------------------------------------------------
##GT Ref clk (FM-S14 312.5MHz FMC_HPC_GBTCLK0_M2C_{P,N})
set_property PACKAGE_PIN C8 [get_ports xphy0_refclk_p]
set_property PACKAGE_PIN C7 [get_ports xphy0_refclk_n]
##GT Ref clk (SI5326 SI5326_OUT_C_{P,N}, MGTREFCLK0{P,N})
#set_property PACKAGE_PIN L8 [get_ports xphy4_refclk_p]
#set_property PACKAGE_PIN L7 [get_ports xphy4_refclk_n]

### Comment the following lines for different quad instance
###---------- Set placement for gt0_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y12 [get_cells network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN E3 [get_ports xphy0_rxn]
set_property PACKAGE_PIN E4 [get_ports xphy0_rxp]
set_property PACKAGE_PIN D1 [get_ports xphy0_txn]
set_property PACKAGE_PIN D2 [get_ports xphy0_txp]

###---------- Set placement for gt1_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y13 [get_cells network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN D5 [get_ports xphy1_rxn]
set_property PACKAGE_PIN D6 [get_ports xphy1_rxp]
set_property PACKAGE_PIN C3 [get_ports xphy1_txn]
set_property PACKAGE_PIN C4 [get_ports xphy1_txp]

###---------- Set placement for gt2_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y14 [get_cells network_path_inst_2/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN B5 [get_ports xphy2_rxn]
set_property PACKAGE_PIN B6 [get_ports xphy2_rxp]
set_property PACKAGE_PIN B1 [get_ports xphy2_txn]
set_property PACKAGE_PIN B2 [get_ports xphy2_txp]

###---------- Set placement for gt3_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y15 [get_cells network_path_inst_3/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN A7 [get_ports xphy3_rxn]
set_property PACKAGE_PIN A8 [get_ports xphy3_rxp]
set_property PACKAGE_PIN A3 [get_ports xphy3_txn]
set_property PACKAGE_PIN A4 [get_ports xphy3_txp]

### Uncomment the following lines for different quad instance
###---------- Set placement for gt0_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y10 [get_cells network_path_inst_4/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN G4 [get_ports xphy4_rxp]
set_property PACKAGE_PIN G3 [get_ports xphy4_rxn]
set_property PACKAGE_PIN H1 [get_ports xphy4_txn]
set_property PACKAGE_PIN H2 [get_ports xphy4_txp]
#
###---------- Set placement for gt1_gtx_wrapper_i/GTX_DUAL ------
#set_property LOC GTXE2_CHANNEL_X0Y15 [get_cells network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/*/gtxe2_i]

## Enable use of VR/VP pins as normal IO 
set_property DCI_CASCADE {32 34} [get_iobanks 33]

## SFP TX Disable loc (port0-3:0 is enable, port 4:1 is enable)
set_property PACKAGE_PIN F20 [get_ports {sfp_tx_disable[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable[0]}]

set_property PACKAGE_PIN A26 [get_ports {sfp_tx_disable[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable[1]}]

set_property PACKAGE_PIN D29 [get_ports {sfp_tx_disable[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable[2]}]

set_property PACKAGE_PIN G30 [get_ports {sfp_tx_disable[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable[3]}]

set_property PACKAGE_PIN Y20 [get_ports {sfp_tx_disable[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable[4]}]

# SI560 (156.25MHz) input
set_property PACKAGE_PIN K28 [get_ports si570_refclk_p]
set_property IOSTANDARD LVDS_25 [get_ports si570_refclk_p]
set_property PACKAGE_PIN K29 [get_ports si570_refclk_n]
set_property IOSTANDARD LVDS_25 [get_ports si570_refclk_n]

# USER_SMA_GPIO output
set_property PACKAGE_PIN Y23 [get_ports user_sma_gpio_p]
set_property IOSTANDARD LVDS_25 [get_ports user_sma_gpio_p]
set_property PACKAGE_PIN Y24 [get_ports user_sma_gpio_n]
set_property IOSTANDARD LVDS_25 [get_ports user_sma_gpio_n]

# user_sma_clock input (for 156.25MHz test)
#set_property PACKAGE_PIN L25 [get_ports user_sma_clock_p]
#set_property IOSTANDARD LVDS_25 [get_ports user_sma_clock_p]
#set_property PACKAGE_PIN K25 [get_ports user_sma_clock_n]
#set_property IOSTANDARD LVDS_25 [get_ports user_sma_clock_n]

# SMA_MGT_REFCLK (for internal SFP+ module)
set_property PACKAGE_PIN J7 [get_ports sma_mgt_refclk_n]
set_property PACKAGE_PIN J8 [get_ports sma_mgt_refclk_p]

## SFP TX Fault loc
set_property PACKAGE_PIN E20 [get_ports {sfp_tx_fault[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_fault[0]}]

set_property PACKAGE_PIN B28 [get_ports {sfp_tx_fault[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_fault[1]}]

set_property PACKAGE_PIN C30 [get_ports {sfp_tx_fault[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_fault[2]}]

set_property PACKAGE_PIN E28 [get_ports {sfp_tx_fault[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_fault[3]}]

##-------------------------------------
## LED Status Pinout   (bottom to top)
##-------------------------------------

set_property PACKAGE_PIN AB8 [get_ports {led[0]}]
set_property PACKAGE_PIN AA8 [get_ports {led[1]}]
set_property PACKAGE_PIN AC9 [get_ports {led[2]}]
set_property PACKAGE_PIN AB9 [get_ports {led[3]}]
set_property PACKAGE_PIN AE26 [get_ports {led[4]}]
set_property PACKAGE_PIN G19 [get_ports {led[5]}]
set_property PACKAGE_PIN E18 [get_ports {led[6]}]
set_property PACKAGE_PIN F16 [get_ports {led[7]}]

set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {led[7]}]

set_property SLEW SLOW [get_ports {led[7]}]
set_property SLEW SLOW [get_ports {led[6]}]
set_property SLEW SLOW [get_ports {led[5]}]
set_property SLEW SLOW [get_ports {led[4]}]
set_property SLEW SLOW [get_ports {led[3]}]
set_property SLEW SLOW [get_ports {led[2]}]
set_property SLEW SLOW [get_ports {led[1]}]
set_property SLEW SLOW [get_ports {led[0]}]

set_property DRIVE 4 [get_ports {led[7]}]
set_property DRIVE 4 [get_ports {led[6]}]
set_property DRIVE 4 [get_ports {led[5]}]
set_property DRIVE 4 [get_ports {led[4]}]
set_property DRIVE 4 [get_ports {led[3]}]
set_property DRIVE 4 [get_ports {led[2]}]
set_property DRIVE 4 [get_ports {led[1]}]
set_property DRIVE 4 [get_ports {led[0]}]

# BUTTON
set_property PACKAGE_PIN AA12 [get_ports {button_n}]
set_property PACKAGE_PIN AB12 [get_ports {button_s}]
set_property PACKAGE_PIN AC6  [get_ports {button_w}]
set_property PACKAGE_PIN AG5  [get_ports {button_e}]
set_property PACKAGE_PIN G12  [get_ports {button_c}]

set_property IOSTANDARD LVCMOS15 [get_ports {button_n}]
set_property IOSTANDARD LVCMOS15 [get_ports {button_s}]
set_property IOSTANDARD LVCMOS15 [get_ports {button_w}]
set_property IOSTANDARD LVCMOS15 [get_ports {button_e}]
set_property IOSTANDARD LVCMOS25 [get_ports {button_c}]

# DIP SW
set_property PACKAGE_PIN Y28  [get_ports {dipsw[3]}]
set_property PACKAGE_PIN AA28 [get_ports {dipsw[2]}]
set_property PACKAGE_PIN W29  [get_ports {dipsw[1]}]
set_property PACKAGE_PIN Y29  [get_ports {dipsw[0]}]

set_property IOSTANDARD LVCMOS25 [get_ports {dipsw[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {dipsw[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {dipsw[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {dipsw[0]}]


#This LED behind FMC glowing indicates FMC Connected to the right HPC
set_property PACKAGE_PIN F21 [get_ports fmc_ok_led]
set_property IOSTANDARD LVCMOS25 [get_ports fmc_ok_led]
#GBTCLK0_FSEL0
set_property PACKAGE_PIN H24 [get_ports {fmc_gbtclk0_fsel[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_gbtclk0_fsel[0]}]
#GBTCLK0_FSEL1
set_property PACKAGE_PIN H25 [get_ports {fmc_gbtclk0_fsel[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_gbtclk0_fsel[1]}]
# FMC Clock programmed to 312.5MHz
set_property PACKAGE_PIN E21 [get_ports fmc_clk_312_5]
set_property IOSTANDARD LVCMOS25 [get_ports fmc_clk_312_5]

create_clock -period 5.000 -name sysclk_p [get_ports sysclk_p]

set_property IOSTANDARD DIFF_SSTL15 [get_ports sysclk_n]

set_property IOSTANDARD DIFF_SSTL15 [get_ports sysclk_p]
set_property PACKAGE_PIN AD12 [get_ports sysclk_p]
set_property PACKAGE_PIN AD11 [get_ports sysclk_n]


# Domain Crossing Constraints
create_clock -name userclk2 -period 4.0 [get_nets user_clk]
create_clock -period 6.400 -name clk156 [get_pins xgbaser_gt_wrapper_inst_0/clk156_bufg_inst/O]
create_clock -period 12.800 -name dclk [get_pins xgbaser_gt_wrapper_inst_0/dclk_bufg_inst/O]
create_clock -period 6.400 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
#create_clock -period 3.200 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
create_clock -period 3.103 -name rxoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
create_clock -period 3.103 -name rxoutclk1 [get_pins network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
create_clock -period 3.103 -name txoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]
create_clock -period 3.103 -name txoutclk1 [get_pins network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]

create_clock -period 6.400 -name clk156 [get_pins xgbaser_gt_wrapper_inst_0/clk156_bufg_inst/O]
create_clock -period 6.400 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
create_clock -period 6.203 -name rxoutclk0 [get_pins network_path_inst_4/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
create_clock -period 6.203 -name txoutclk0 [get_pins network_path_inst_4/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]
#
#
#create_generated_clock -name clk50 -source [get_ports clk_ref_p] -divide_by 4 [get_pins {clk_divide_reg[1]/Q}]
#set_clock_sense -positive clk_divide_reg[1]_i_1/O

#set_clock_groups -name async_mig_pcie -asynchronous -group [get_clocks -include_generated_clocks clk_ref_p] -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins ext_clk.pipe_clock_i/mmcm_i/CLKOUT3]]]

#set_clock_groups -name async_mig_clk50 -asynchronous -group [get_clocks -include_generated_clocks clk_ref_p] -group [get_clocks clk50]

#set_clock_groups -name async_clk50_pcie -asynchronous -group [get_clocks clk50] -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins ext_clk.pipe_clock_i/mmcm_i/CLKOUT3]]]

#set_clock_groups -name async_mig_xgemac -asynchronous -group [get_clocks -include_generated_clocks clk_ref_p] -group [get_clocks -include_generated_clocks clk156]

#set_clock_groups -name async_userclk2_xgemac -asynchronous -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins ext_clk.pipe_clock_i/mmcm_i/CLKOUT3]]] -group [get_clocks -include_generated_clocks clk156]

set_clock_groups -name async_txusrclk_xgemac -asynchronous -group [get_clocks -include_generated_clocks txoutclk?] -group [get_clocks -include_generated_clocks clk156]

#set_clock_groups -name async_xgemac_clk50 -asynchronous -group [get_clocks -include_generated_clocks clk156] -group [get_clocks clk50]

set_clock_groups -name async_xgemac_dclk -asynchronous -group [get_clocks -include_generated_clocks clk156] -group [get_clocks -include_generated_clocks dclk]

set_clock_groups -name async_xgemac_drpclk -asynchronous -group [get_clocks -include_generated_clocks clk156] -group [get_clocks -include_generated_clocks dclk]

#set_clock_groups -name async_rxusrclk_userclk2 -asynchronous -group [get_clocks -include_generated_clocks rxoutclk?] -group [get_clocks -include_generated_clocks [get_clocks -of_objects [get_pins ext_clk.pipe_clock_i/mmcm_i/CLKOUT3]]]

set_clock_groups -name async_rxusrclk_clk156 -asynchronous -group [get_clocks -include_generated_clocks rxoutclk?] -group [get_clocks -include_generated_clocks clk156]

set_clock_groups -name async_txoutclk_refclk -asynchronous -group [get_clocks -include_generated_clocks txoutclk?] -group [get_clocks -include_generated_clocks refclk]

#----------------------------------------
# FLASH programming - BPI Sync Mode fast 
#----------------------------------------

#set_property IOSTANDARD LVCMOS25 [get_ports emcclk]
#set_property PACKAGE_PIN R24 [get_ports emcclk]

#PMBUS LOC
#set_property PACKAGE_PIN AG17 [get_ports pmbus_clk]
#set_property PACKAGE_PIN Y14 [get_ports pmbus_data]
#set_property PACKAGE_PIN AB14 [get_ports pmbus_alert]
#set_property IOSTANDARD LVCMOS15 [get_ports pmbus_clk]
#set_property IOSTANDARD LVCMOS15 [get_ports pmbus_data]
#set_property IOSTANDARD LVCMOS15 [get_ports pmbus_alert]

#set_max_delay -datapath_only -from [get_pins user_reset_i/C] -to [get_pins user_reg_slave_inst/kc705_pvt_monitor/test_controller/processor/internal_reset_flop/D] 10.000

#set_max_delay -datapath_only -from [get_pins user_reset_i/C] -to [get_pins user_reg_slave_inst/rst_int_reg/PRE] 10.000
##
#set_max_delay -datapath_only -from [get_pins user_reset_i/C] -to [get_pins user_reg_slave_inst/kc705_pvt_monitor/test_controller/processor/run_flop/D] 10.000

#set_max_delay -datapath_only -from [get_pins user_reset_i/C] -to [get_pins user_reg_slave_inst/rst_r_reg/PRE] 10.000

