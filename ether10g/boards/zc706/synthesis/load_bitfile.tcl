source "setup.tcl"
set bitfile $wspace/$hw_name/design_1_wrapper.bit

connect
targets 1
if {[file exists $bitfile] != 1} then {
	puts "Error : No bitfile"
	con
	exit
} else {
	fpga $bitfile
}
con
