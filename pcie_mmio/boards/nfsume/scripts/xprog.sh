#!/bin/bash
# Xilinx Programming scripts using Vivado
# Takeshi Matsuya (macchan@sfc.wide.ad.jp)

DEFAULT_HOST="localhost:3121"
DEFAULT_BOARD="KC705"
#DEFAULT_BOARD="VC709"
#DEFAULT_BOARD="ZYBO"


function flash {
case "${board}" in
	"KC705" ) flash="28f00ap30t-bpi-x16" ;;
	"VC709" ) flash="mt28gu01gaax1e-bpi-x16" ;;
esac
case "${board}" in
	"KC705" | "VC709" )
	vivado -mode tcl -nojournal -nolog <<EOF
	open_hw
	connect_hw_server -url ${host}
        set_property PARAM.FREQUENCY 15000000 [lindex [get_hw_targets *${target}*] 0]
        open_hw_target
	create_hw_cfgmem -hw_device [lindex [get_hw_devices] 0] -mem_dev [lindex [get_cfgmem_parts {${flash}}] 0]
	set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.VERIFY  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	refresh_hw_device [lindex [get_hw_devices] 0]

	set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.VERIFY  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]

	set_property PROGRAM.FILE_1 {${mcsfile}} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0]]

	set_property PROGRAM.BPI_RS_PINS {none} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
	startgroup 

	if {![string equal [get_property PROGRAM.HW_CFGMEM_TYPE  [lindex [get_hw_devices] 0]] [get_property MEM_TYPE [get_property CFGMEM_PART [get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]]]] }  { create_hw_bitstream -hw_device [lindex [get_hw_devices] 0] [get_property PROGRAM.HW_CFGMEM_BITFILE [ lindex [get_hw_devices] 0]]; program_hw_devices [lindex [get_hw_devices] 0]; }; 

	program_hw_cfgmem -hw_cfgmem [get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices] 0 ]]
EOF
	;;
	* ) echo "board ${board} is not support" ;;
esac
}

function mcs {
case "${board}" in
	"KC705" | "VC709" )
	vivado -mode tcl -nojournal -nolog <<EOF
	write_cfgmem -force -format MCS -size 128 -interface BPIx16 -loadbit "up 0x0 ${bitfile}" ${mcsfile}
EOF
	;;
	* ) echo "board ${board} is not support" ;;
esac
}

function load {
case "${board}" in
	"ZYBO" ) device="xc7z010_1" ;;
	* ) device="*" ;;
esac
	vivado -mode tcl -nojournal -nolog <<EOF
	open_hw
	connect_hw_server -url ${host}
	current_hw_target [lindex [get_hw_targets *${target}*] 0]
	set_property PARAM.FREQUENCY 15000000 [lindex [get_hw_targets *${target}*] 0]
	open_hw_target
	set_property PROGRAM.FILE {${bitfile}} [lindex [get_hw_devices ${device}] 0]
	current_hw_device [lindex [get_hw_devices ${device}] 0]
	set_property PROGRAM.FILE {${bitfile}} [lindex [get_hw_devices ${device}] 0]
	program_hw_devices [lindex [get_hw_devices ${device}] 0]
	refresh_hw_device [lindex [get_hw_devices ${device}] 0]
	close_hw_target -quiet
	disconnect_hw_server -quiet
EOF
}

function list {
	vivado -mode tcl -nojournal -nolog <<EOF
	open_hw
	connect_hw_server -url ${host}
	puts "#  target_id"
	puts "\t#  device name"
	puts "----------------------------------"
	set tcount 1
	foreach target [get_hw_targets] {
		puts "\$tcount. \$target"
		current_hw_target \$target
		open_hw_target -quiet
		set dcount 1
		foreach device [get_hw_devices] {
			puts "\t\$dcount. \$device"
			incr dcount
		}
		close_hw_target -quiet
		incr tcount
	}
	disconnect_hw_server -quiet
#	set line [regsub -all { } [get_hw_targets] \n]
#	puts \$line
EOF
}

function usage {
	echo "usage: $0 list  [-h host]                                 ... list targets and connected devices"
	echo "       $0 load  bit_file [-h host] [-t target]            ... program FPGA"
	echo "       $0 flash bit|mcs_file [-h host] [-b board] [-t target] ... program ROM"
	echo "       $0 mcs   bit_file [-h host] [-b board]             ... generate mcs file"
	echo ""
	echo "<option parameter>:"
	echo "  host  : localhost:3121 or 192.168.1.1:3121"
	echo "  target: 210203336974A"
	echo "  board : kc705 or vc709 or zybo"
	exit 0
}

GETOPT=`getopt -q -o ab:t:h: -- "$@"` ; [ $? != 0 ] && usage
eval set -- "$GETOPT"
while true
do
	case $1 in
	-a)  A_FLAG=yes      ; shift
	;;
	-b)  board=$2        ; shift 2
	;;
	-t)  target=$2       ; shift 2
	;;
	-h)  host=$2         ; shift 2
	;;
	--)  shift ; break
	;;
	*)   usage
	;;
	esac
done

if [ "${host}" = "" ]; then
	if [ "${VIVADO_HOST}" = "" ]; then
		host=${DEFAULT_HOST}
	else
		host=${VIVADO_HOST}
	fi
fi

if [ "${board}" = "" ]; then
	if [ "${VIVADO_BOARD}" = "" ]; then
		board=${DEFAULT_BOARD}
	else
		board=${VIVADO_BOARD}
	fi
fi

if [ "${target}" = "" ]; then
	if [ "${VIVADO_TARGET}" = "" ]; then
		target=*
	else
		target=${VIVADO_TARGET}
	fi
fi

fullfilename=$2
extension=${fullfilename##*.}	# get file extension
filename=${fullfilename%.*}	# remove file extension
for bitfile in ./runs/top.runs/impl_1/*.bit ;do break; done
for mcsfile in ./runs/top.runs/impl_1/*.mcs ;do break; done

if [ "${fullfilename}" != "" ]; then
	bitfile=${filename}.bit
	mcsfile=${filename}.mcs
fi


# convert upper
board=${board^^}

#echo target=${target}
#echo board=${board}

case "${1^^}" in
	"LIST" )
		shift; list ;;
	"LOAD" )
		shift; load ;;
	"MCS" )
		shift; mcs ;;
	"FLASH" )
		shift;
		if [ "${extension}" = "bit" ]; then
			mcs 
		fi
		flash ;;
		
	* ) usage ;;
esac
