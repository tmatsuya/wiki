set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

# FPGA_SYSCLK (200MHz)
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVDS     } [get_ports { clk200_n }];
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVDS     } [get_ports { clk200_p }];
create_clock -add -name sys_clk_pin -period 5.00 -waveform {0 2.5} [get_ports {clk200_p}]; 

# eth led
set_property -dict { PACKAGE_PIN G13  IOSTANDARD LVCMOS15 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN L15  IOSTANDARD LVCMOS15 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN AL22 IOSTANDARD LVCMOS15 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN BA20 IOSTANDARD LVCMOS15 } [get_ports { led[3] }];
set_property -dict { PACKAGE_PIN AY18 IOSTANDARD LVCMOS15 } [get_ports { led[4] }];
set_property -dict { PACKAGE_PIN AY17 IOSTANDARD LVCMOS15 } [get_ports { led[5] }];
set_property -dict { PACKAGE_PIN P31  IOSTANDARD LVCMOS15 } [get_ports { led[6] }];
set_property -dict { PACKAGE_PIN K32  IOSTANDARD LVCMOS15 } [get_ports { led[7] }];

set_false_path -to [get_ports -filter {NAME=~led*}]
