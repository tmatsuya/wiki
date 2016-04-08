source "setup.tcl"
set src_file [glob -directory "../embed_sw/" "*"]

## Working Space
if {[file exists $wspace] != 1} then {
	file mkdir $wspace
} 
sdk set_workspace $wspace

## SDK initilize *.hdf file
if {[file exists $hw_spec] != 1} then {
	puts "Error: Not found Hardware Specification File"
	exit 1
} else {
	file copy -force $hw_spec $hdf
}

## Creating HW Project
if {[file exists $wspace/$hw_name] != 1} then {
	sdk create_hw_project -name $hw_name -hwspec $hdf
}

## Creating BSP Project
if {[file exists $wspace/$bsp_name] != 1} then {
	sdk create_bsp_project -name $bsp_name -hwproject $hw_name -proc $proc_name -os standalone 
}

## Creating APP project
if {[file exists $wspace/$app_name] != 1} then {
	sdk create_app_project -name $app_name -hwproject $hw_name -bsp $bsp_name -proc $proc_name -os standalone -lang c -app "Hello World" 
}

## Copying C source to APP project
foreach file $src_file {
		file copy -force $file $wspace/$app_name/src/
}

## Building
sdk build_project -type all

