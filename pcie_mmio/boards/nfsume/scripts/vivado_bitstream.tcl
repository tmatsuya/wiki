set outdir build

open_checkpoint $outdir/post_route.dcp
write_bitstream -force $outdir/pemu.bit
