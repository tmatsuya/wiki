set outdir build

open_checkpoint $outdir/post_syn.dcp

opt_design
power_opt_design
place_design

report_utilization -file $outdir/post_place_util.txt
report_timing -file $outdir/post_place_timing.txt -nworst 5
write_checkpoint -force $outdir/post_place
