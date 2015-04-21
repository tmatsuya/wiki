###############################################################################
# This XDC is intended for use with the Xilinx KC705 Development Board with a 
# xc7k325t-ffg900-2 part
###############################################################################
##---------------------------------------------------------------------------------------
## 10GBASE-R constraints
##---------------------------------------------------------------------------------------

### Uncomment the following lines for different quad instance
###---------- Set placement for gt0_gtx_wrapper_i/GTX_DUAL ------
set_property LOC GTXE2_CHANNEL_X0Y10 [get_cells network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i]
set_property PACKAGE_PIN G4 [get_ports xphy_rxn]
set_property PACKAGE_PIN G3 [get_ports xphy_rxp]
set_property PACKAGE_PIN H1 [get_ports xphy_txn]
set_property PACKAGE_PIN H2 [get_ports xphy_txp]
#
###---------- Set placement for gt1_gtx_wrapper_i/GTX_DUAL ------
#set_property LOC GTXE2_CHANNEL_X0Y15 [get_cells network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/*/gtxe2_i]

## Enable use of VR/VP pins as normal IO 
set_property DCI_CASCADE {32 34} [get_iobanks 33]

## SFP TX Disable loc (1 is enable)
set_property PACKAGE_PIN Y20 [get_ports {sfp_tx_disable}]
set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_disable}]

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


create_clock -period 5.000 -name clk_ref_p [get_ports clk_ref_p]

set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_ref_n]

set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_ref_p]
set_property PACKAGE_PIN AD12 [get_ports clk_ref_p]
set_property PACKAGE_PIN AD11 [get_ports clk_ref_n]

# Domain Crossing Constraints
#create_clock -name userclk2 -period 4.0 [get_nets user_clk]
#create_clock -period 6.400 -name clk156 [get_pins xgbaser_gt_wrapper_inst_0/clk156_bufg_inst/O]
#create_clock -period 12.800 -name dclk [get_pins xgbaser_gt_wrapper_inst_0/dclk_bufg_inst/O]
#create_clock -period 6.400 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
#create_clock -period 3.200 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
#create_clock -period 3.103 -name rxoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
#create_clock -period 3.103 -name rxoutclk1 [get_pins network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
#create_clock -period 3.103 -name txoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]
#create_clock -period 3.103 -name txoutclk1 [get_pins network_path_inst_1/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]

create_clock -period 6.400 -name clk156 [get_pins xgbaser_gt_wrapper_inst_0/clk156_bufg_inst/O]
create_clock -period 6.400 -name refclk [get_pins xgbaser_gt_wrapper_inst_0/ibufds_inst/O]
create_clock -period 6.203 -name rxoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/RXOUTCLK]
create_clock -period 6.203 -name txoutclk0 [get_pins network_path_inst_0/ten_gig_eth_pcs_pma_inst/inst/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_10gbaser_i/gtxe2_i/TXOUTCLK]
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

# 156.25 MHz clock control LOCs
set_property IOSTANDARD LVCMOS25 [get_ports i2c_clk]
set_property SLEW SLOW [get_ports i2c_clk]
set_property DRIVE 16 [get_ports i2c_clk]
set_property PULLUP TRUE [get_ports i2c_clk]
set_property PACKAGE_PIN K21  [get_ports i2c_clk]

set_property IOSTANDARD LVCMOS25 [get_ports i2c_data]
set_property SLEW SLOW [get_ports i2c_data]
set_property DRIVE 16 [get_ports i2c_data]
set_property PULLUP TRUE [get_ports i2c_data]
set_property PACKAGE_PIN L21  [get_ports i2c_data]

set_property IOSTANDARD LVCMOS25 [get_ports i2c_mux_rst_n]
set_property SLEW SLOW [get_ports i2c_mux_rst_n]
set_property DRIVE 16 [get_ports i2c_mux_rst_n]
set_property PACKAGE_PIN P23  [get_ports i2c_mux_rst_n]

set_property IOSTANDARD LVCMOS25 [get_ports si5324_rst_n]
set_property SLEW SLOW [get_ports si5324_rst_n]
set_property DRIVE 16 [get_ports si5324_rst_n]
set_property PACKAGE_PIN AE20 [get_ports si5324_rst_n]

##GT Ref clk
set_property PACKAGE_PIN L8  [get_ports xphy_refclk_clk_p]
set_property PACKAGE_PIN L7  [get_ports xphy_refclk_clk_n]

