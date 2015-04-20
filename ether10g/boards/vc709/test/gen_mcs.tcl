  ## Generates MCS file
  if {[get_projects] == {xt_conn_trd}} {
    ### Check if running from GUI (assumes TRD project is the current project) 
    set dir [get_property DIRECTORY [current_project]]
    cd ${dir}/xt_conn_trd.runs/impl_1
    write_cfgmem -force -format MCS -size 128 -interface BPIx16 -checksum -loadbit "up 0x0 xt_connectivity_trd.bit" -file VC709.mcs
  } else {
    # Assume running in script/batch mode from vivado directory
    cd runs/xt_conn_trd.runs/impl_1
    write_cfgmem -force -format MCS -size 128 -interface BPIx16 -checksum -loadbit "up 0x0 xt_connectivity_trd.bit" -file VC709.mcs
  }
         