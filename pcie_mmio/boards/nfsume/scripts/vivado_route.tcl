set outdir build

open_checkpoint $outdir/post_place.dcp

phys_opt_design
route_design

report_timing -file $outdir/post_route_timing.txt -nworst 5
report_timing_summary -file $outdir/post_route_timing_summary.txt
report_drc -file $outdir/post_route_drc.txt

write_checkpoint -force $outdir/post_route

write_verilog -force $outdir/post_route_netlist.v
write_xdc -no_fixed_only -force $outdir/post_route_constr.xdc
