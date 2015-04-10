
#Loading additional proc with user specified bodies to compute parameter values.

set c_family [get_project_property ARCHITECTURE]
set part [get_project_property PART]
set speedgrade [get_project_property SPEEDGRADE]
set c_device [get_project_property DEVICE]

#Definitional proc to organize widgets for parameters.
proc create_gui { ipview } {
	set Page0 [ ipgui::add_page $ipview  -name "Page 0" -layout vertical]
	set Panel0 [ipgui::add_panel  $ipview -parent $Page0 -name Panel0 -layout vertical]
	set Panel1 [ipgui::add_panel  $ipview -parent $Page0 -name Panel1 -layout vertical]
	set Panel2 [ipgui::add_panel  $ipview -parent $Panel1 -name Panel2 -layout vertical]
	set Panel3 [ipgui::add_panel  $ipview -parent $Page0 -name Panel3 -layout vertical]
	set Component_Name [ ipgui::add_param  $ipview  -parent  $Panel0  -name Component_Name ]
	set MDIO_Management [ipgui::add_param $ipview -parent $Panel0 -name MDIO_Management]
	set base_kr [ipgui::add_param $ipview -parent $Panel1 -name base_kr -widget radioGroup]
	set autonegotiation [ipgui::add_param $ipview -parent $Panel2 -name autonegotiation]
	set fec [ipgui::add_param $ipview -parent $Panel2 -name fec]
	set IEEE_1588 [ipgui::add_param $ipview -parent $Panel3 -name IEEE_1588]
        set_property visible false $IEEE_1588

	set_property tooltip "If selected, enables MDIO management interface.  Otherwise a simple configuration/status vector interface is used." [ipgui::get_paramspec MDIO_Management	-of	$ipview ] 
	set_property tooltip "If selected, enables AutoNegotiation functionality (BASE-KR only)." [ipgui::get_paramspec autonegotiation	-of	$ipview ] 
	set_property tooltip "If selected, enables FEC functionality (BASE-KR only)." [ipgui::get_paramspec fec	-of	$ipview ] 
	set_property tooltip "Selects between BASE-R and BASE-KR functionality." [ipgui::get_paramspec base_kr	-of	$ipview ] 
	set_property tooltip "If selected, enables IEEE 1588 Timestamp functionality (BASE-R only)." [ipgui::get_paramspec IEEE_1588 -of $ipview ] 
}

proc updateModel_c_is_v7gth {ipview} {
# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
    set_property  modelparam_value [IsV7GTH] [ipgui::get_modelparamspec c_is_v7gth -of $ipview]
  return true
}

#Returns true for devices containing the GTHE2 transceiver
proc IsV7GTH {} {
    variable c_device
  variable c_family

	switch -- $c_family {
    "virtex7" {
       if { [regexp -nocase -- {.+(7v585|7v1500|7v2000|7vx485).+} $c_device] == 1} {
				   return false
				} else {
				  return true
				}
		}      
        default { return false }
    }
    return false
}
    
# Procedure called when MDIO_Management is updated    
proc MDIO_Management_updated {ipview} {
	return true
}

# Procedure called to validate MDIO_Management
proc validate_MDIO_Management {ipview} {
	return true
}

# Procedure called when base_kr is updated
proc base_kr_updated {ipview} {
    set ancontrol [ipgui::get_paramspec -of $ipview -name autonegotiation]
    set feccontrol [ipgui::get_paramspec -of $ipview -name fec]
    set ieee1588control [ipgui::get_paramspec -of $ipview -name IEEE_1588]

    if { [get_param_value base_kr] == "BASE-R" } {
        set_property value false $ancontrol
        set_property value false $feccontrol        
        set_property enabled false $ancontrol
        set_property enabled false $feccontrol     
        set_property enabled true $ieee1588control           
    } else {
        set_property enabled true $ancontrol
        set_property enabled true $feccontrol
        set_property enabled false $ieee1588control        
        set_property value  "None" $ieee1588control        
}
	return true
}

# Procedure called to validate base_kr
proc validate_base_kr {ipview} {
	return true
}

# Procedure called when autonegotiation is updated
proc autonegotiation_updated {ipview} {
	return true
}

# Procedure called to validate autonegotiation
proc validate_autonegotiation {ipview} {
	return true
}

# Procedure called when fec is updated
proc fec_updated {ipview} {
	return true
}

# Procedure called to validate fec
proc validate_fec {ipview} {
	return true
}


# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_has_mdio {ipview} {
		set_property modelparam_value [get_param_value MDIO_Management ] [ipgui::get_modelparamspec c_has_mdio -of $ipview]
	return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_has_fec {ipview} {
		set_property modelparam_value [get_param_value fec ] [ipgui::get_modelparamspec c_has_fec -of $ipview]
	return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_has_an {ipview} {
		set_property modelparam_value [get_param_value autonegotiation ] [ipgui::get_modelparamspec c_has_an -of $ipview]
	return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_is_kr {ipview} {
    if { [get_param_value base_kr] == "BASE-R" } {
	    	set_property modelparam_value false [ipgui::get_modelparamspec c_is_kr -of $ipview]
		} else {
	    	set_property modelparam_value true [ipgui::get_modelparamspec c_is_kr -of $ipview]
    		}
	return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_1588 {ipview} {   
    switch -exact -- [get_param_value IEEE_1588] {
	      None { 
            set value 0
	      }    
	      1-Step {
	          set value 1
	      }
        2-Step {
	          set value 2
	      }	      
	      default {
	          set value 0
	      }
	  }
    set_property modelparam_value $value [ipgui::get_modelparamspec c_1588 -of $ipview]
    return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_family {IpView} {
     variable c_family
     set_property modelparam_value [ipgui::get_cfamily $c_family] [ipgui::get_modelparamspec c_family -of $IpView]
     return true
}

# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
proc updateModel_c_component_name { IpView } {
    set_property modelparam_value    [get_param_value Component_Name 	] [ipgui::get_modelparamspec c_component_name -of $IpView]
    return true
}

# Sets the receive data width, 32 for all 7-series devices
proc updateModel_c_data_width {ipview} {
    set_property modelparam_value 32 [ipgui::get_modelparamspec c_data_width -of $ipview]
    return true
}
