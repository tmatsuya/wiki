source "setup.tcl"
set ps_init_file $wspace/$hw_name/ps7_init.tcl
set hw_init_file $wspace/$hw_name/system.hdf
set elf_file     $wspace/$app_name/Debug/$app_name.elf

connect
## PS init
if {[file exists $ps_init_file] != 1} then {
	puts "Error : No ps7_init.tcl"
	con
	exit 1
} else {
	source $ps_init_file
}

targets -set -filter {name =~"APU"} -index 0

## HW init
if {[file exists $hw_init_file] != 1} then {
	puts "Error : No system.hdf"
	stop
	con
	exit 1
} else {	
	loadhw $hw_init_file
}

targets -set -filter {name =~"APU"} -index 0

stop

## Initilize Zynq APU
ps7_init
ps7_post_config

con
targets -set -nocase -filter {name =~ "ARM*#0"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0"} -index 0

if {[file exists $elf_file] != 1} then {
	puts "Error : Now Elf file"
	exit 1
} else {
	dow $elf_file
}

