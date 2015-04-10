#Definitional proc to organize widgets for parameters.
proc create_gui { ipview } {
	set Page0 [ ipgui::add_page $ipview  -name "Page 0" -layout vertical]
	set Component_Name [ ipgui::add_param  $ipview  -parent  $Page0  -name Component_Name ]
	set NUM_POWER_REG [ipgui::add_param $ipview -parent $Page0 -name NUM_POWER_REG]
	set C_DPHASE_TIMEOUT [ipgui::add_param $ipview -parent $Page0 -name C_DPHASE_TIMEOUT]
	set C_S_AXI_MIN_SIZE [ipgui::add_param $ipview -parent $Page0 -name C_S_AXI_MIN_SIZE]
	set C_NUM_ADDRESS_RANGES [ipgui::add_param $ipview -parent $Page0 -name C_NUM_ADDRESS_RANGES]
	set C_TOTAL_NUM_CE [ipgui::add_param $ipview -parent $Page0 -name C_TOTAL_NUM_CE]
	set C_HIGH_ADDRESS [ipgui::add_param $ipview -parent $Page0 -name C_HIGH_ADDRESS]
	set C_BASE_ADDRESS [ipgui::add_param $ipview -parent $Page0 -name C_BASE_ADDRESS]
	set C_S_AXI_DATA_WIDTH [ipgui::add_param $ipview -parent $Page0 -name C_S_AXI_DATA_WIDTH]
	set C_S_AXI_ADDR_WIDTH [ipgui::add_param $ipview -parent $Page0 -name C_S_AXI_ADDR_WIDTH]
	set CORE_REMAIN_WIDTH [ipgui::add_param $ipview -parent $Page0 -name CORE_REMAIN_WIDTH]
	set CORE_BE_WIDTH [ipgui::add_param $ipview -parent $Page0 -name CORE_BE_WIDTH]
	set CORE_DATA_WIDTH [ipgui::add_param $ipview -parent $Page0 -name CORE_DATA_WIDTH]
}

proc NUM_POWER_REG_updated {ipview} {
	# Procedure called when NUM_POWER_REG is updated
	return true
}

proc validate_NUM_POWER_REG {ipview} {
	# Procedure called to validate NUM_POWER_REG
	return true
}

proc C_DPHASE_TIMEOUT_updated {ipview} {
	# Procedure called when C_DPHASE_TIMEOUT is updated
	return true
}

proc validate_C_DPHASE_TIMEOUT {ipview} {
	# Procedure called to validate C_DPHASE_TIMEOUT
	return true
}

proc C_S_AXI_MIN_SIZE_updated {ipview} {
	# Procedure called when C_S_AXI_MIN_SIZE is updated
	return true
}

proc validate_C_S_AXI_MIN_SIZE {ipview} {
	# Procedure called to validate C_S_AXI_MIN_SIZE
	return true
}

proc C_NUM_ADDRESS_RANGES_updated {ipview} {
	# Procedure called when C_NUM_ADDRESS_RANGES is updated
	return true
}

proc validate_C_NUM_ADDRESS_RANGES {ipview} {
	# Procedure called to validate C_NUM_ADDRESS_RANGES
	return true
}

proc C_TOTAL_NUM_CE_updated {ipview} {
	# Procedure called when C_TOTAL_NUM_CE is updated
	return true
}

proc validate_C_TOTAL_NUM_CE {ipview} {
	# Procedure called to validate C_TOTAL_NUM_CE
	return true
}

proc C_HIGH_ADDRESS_updated {ipview} {
	# Procedure called when C_HIGH_ADDRESS is updated
	return true
}

proc validate_C_HIGH_ADDRESS {ipview} {
	# Procedure called to validate C_HIGH_ADDRESS
	return true
}

proc C_BASE_ADDRESS_updated {ipview} {
	# Procedure called when C_BASE_ADDRESS is updated
	return true
}

proc validate_C_BASE_ADDRESS {ipview} {
	# Procedure called to validate C_BASE_ADDRESS
	return true
}

proc C_S_AXI_DATA_WIDTH_updated {ipview} {
	# Procedure called when C_S_AXI_DATA_WIDTH is updated
	return true
}

proc validate_C_S_AXI_DATA_WIDTH {ipview} {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc C_S_AXI_ADDR_WIDTH_updated {ipview} {
	# Procedure called when C_S_AXI_ADDR_WIDTH is updated
	return true
}

proc validate_C_S_AXI_ADDR_WIDTH {ipview} {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc CORE_REMAIN_WIDTH_updated {ipview} {
	# Procedure called when CORE_REMAIN_WIDTH is updated
	return true
}

proc validate_CORE_REMAIN_WIDTH {ipview} {
	# Procedure called to validate CORE_REMAIN_WIDTH
	return true
}

proc CORE_BE_WIDTH_updated {ipview} {
	# Procedure called when CORE_BE_WIDTH is updated
	return true
}

proc validate_CORE_BE_WIDTH {ipview} {
	# Procedure called to validate CORE_BE_WIDTH
	return true
}

proc CORE_DATA_WIDTH_updated {ipview} {
	# Procedure called when CORE_DATA_WIDTH is updated
	return true
}

proc validate_CORE_DATA_WIDTH {ipview} {
	# Procedure called to validate CORE_DATA_WIDTH
	return true
}


proc updateModel_CORE_DATA_WIDTH {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec CORE_DATA_WIDTH -of $ipview ]] [ipgui::get_modelparamspec CORE_DATA_WIDTH -of $ipview ]

	return true
}

proc updateModel_CORE_BE_WIDTH {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec CORE_BE_WIDTH -of $ipview ]] [ipgui::get_modelparamspec CORE_BE_WIDTH -of $ipview ]

	return true
}

proc updateModel_CORE_REMAIN_WIDTH {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec CORE_REMAIN_WIDTH -of $ipview ]] [ipgui::get_modelparamspec CORE_REMAIN_WIDTH -of $ipview ]

	return true
}

proc updateModel_C_S_AXI_ADDR_WIDTH {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_S_AXI_ADDR_WIDTH -of $ipview ]] [ipgui::get_modelparamspec C_S_AXI_ADDR_WIDTH -of $ipview ]

	return true
}

proc updateModel_C_S_AXI_DATA_WIDTH {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_S_AXI_DATA_WIDTH -of $ipview ]] [ipgui::get_modelparamspec C_S_AXI_DATA_WIDTH -of $ipview ]

	return true
}

proc updateModel_C_BASE_ADDRESS {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_BASE_ADDRESS -of $ipview ]] [ipgui::get_modelparamspec C_BASE_ADDRESS -of $ipview ]

	return true
}

proc updateModel_C_HIGH_ADDRESS {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_HIGH_ADDRESS -of $ipview ]] [ipgui::get_modelparamspec C_HIGH_ADDRESS -of $ipview ]

	return true
}

proc updateModel_C_TOTAL_NUM_CE {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_TOTAL_NUM_CE -of $ipview ]] [ipgui::get_modelparamspec C_TOTAL_NUM_CE -of $ipview ]

	return true
}

proc updateModel_C_NUM_ADDRESS_RANGES {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_NUM_ADDRESS_RANGES -of $ipview ]] [ipgui::get_modelparamspec C_NUM_ADDRESS_RANGES -of $ipview ]

	return true
}

proc updateModel_C_S_AXI_MIN_SIZE {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_S_AXI_MIN_SIZE -of $ipview ]] [ipgui::get_modelparamspec C_S_AXI_MIN_SIZE -of $ipview ]

	return true
}

proc updateModel_C_DPHASE_TIMEOUT {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec C_DPHASE_TIMEOUT -of $ipview ]] [ipgui::get_modelparamspec C_DPHASE_TIMEOUT -of $ipview ]

	return true
}

proc updateModel_NUM_POWER_REG {ipview} {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value

	set_property modelparam_value [get_property value [ipgui::get_paramspec NUM_POWER_REG -of $ipview ]] [ipgui::get_modelparamspec NUM_POWER_REG -of $ipview ]

	return true
}

