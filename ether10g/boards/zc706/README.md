# ZC706 Ether10g

## Required Tools
	- Xilinx Vivado 2015.4

## How to build
	$ source /opt/Xilinx/Vivado/2015.4/settings64.sh
	$ cd wiki/ether10g/boards/zc706
	$ make all

## How to Costomize Block Design 
	## Costomize with Vivado Gui
	$ make gui
	## if you have done configuration, copy block design file to initil derectory.
	$ cp synthesis/bd_build/design_1.bd bd/
	## and build entire design ..
	$ make all
