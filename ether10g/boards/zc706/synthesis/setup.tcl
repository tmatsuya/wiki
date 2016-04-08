
## General Parameter
set design_top top
set sim_top board
set proj_dir "runs" 
set impl_const "../constraints/zc706sfp.xdc"
set bd_file "../bd/design_1.bd"
set board_part "xilinx.com:zc706:part0:1.2"
## SDK Parameter
set wspace "$proj_dir/sdk" 
set hw_name "design_1_wrapper_hw_platform_0"
set proc_name "ps7_cortexa9_0"
set bsp_name "bsp_0"
set app_name "si5324_app"
set hw_spec "$proj_dir/top.runs/impl_1/design_1_wrapper.sysdef"
set hdf "$wspace/si5324.hdf"
