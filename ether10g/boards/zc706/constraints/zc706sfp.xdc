set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

set_property PACKAGE_PIN W23 [get_ports SI5324_RST_N]
set_property IOSTANDARD LVCMOS25 [get_ports SI5324_RST_N]

### LEDs
set_property PACKAGE_PIN A17 [get_ports LED[0]]
set_property IOSTANDARD LVCMOS15 [get_ports LED[0]]
set_property PACKAGE_PIN W21 [get_ports LED[1]]
set_property IOSTANDARD LVCMOS25 [get_ports LED[1]]
set_property PACKAGE_PIN Y21 [get_ports LED[2]]
set_property IOSTANDARD LVCMOS25 [get_ports LED[2]]
set_property PACKAGE_PIN G2 [get_ports LED[3]]
set_property IOSTANDARD LVCMOS15 [get_ports LED[3]]


### Clock
create_clock -period 5.000 -name sys_clk_pin -waveform {0.000 2.500} -add [get_ports SYSCLK_P]

set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]

### Si5324 Programmagble Oscillator
set_property PACKAGE_PIN AC7 [get_ports SI5324_OUT_C_N]
set_property PACKAGE_PIN AC8 [get_ports SI5324_OUT_C_P]
create_clock -period 6.400 -name SI5324_OUT_C_P -add [get_ports SI5324_OUT_C_P]

### SFP Module
set_property PACKAGE_PIN W4 [get_ports SFP_TX_P]
set_property PACKAGE_PIN W3 [get_ports SFP_TX_N]
set_property PACKAGE_PIN Y6 [get_ports SFP_RX_P]
set_property PACKAGE_PIN Y5 [get_ports SFP_RX_N]

set_property PACKAGE_PIN AA18 [get_ports SFP_TX_DISABLE]
set_property IOSTANDARD LVCMOS25 [get_ports SFP_TX_DISABLE]
