proj = "pemu"

sim_top = app_tb
outdir = build

# Xilinx sources and top module
RTL_SRC := rtl/pcie/support/pcie3_7x_0_pipe_clock.v \
           rtl/pcie/support/pcie3_7x_0_support.v    \
           rtl/pcie/pcie_app_7vx.v                  \
           rtl/pcie/PIO_EP_MEM_ACCESS.v             \
           rtl/pcie/PIO_RX_ENGINE.v                 \
           rtl/pcie/PIO_TO_CTRL.v                   \
           rtl/pcie/PIO_TX_ENGINE.v                 \
           rtl/pcie/PIO_INTR_CTRL.v                 \
           rtl/pcie/PIO_EP.v                        \
           rtl/pcie/PIO.v                           \
           rtl/biosrom.v                            \
           rtl/top.v

## libraries
INC_SRC := $(wildcard cores/pkg/*.sv)
#INC_SRC := $(wildcard ../../cores/pkg/*.sv) \
#           $(wildcard ../../cores/xgmiisync/rtl/*.sv) \
#           $(wildcard ../../cores/crc32/rtl/*.v) \
#           $(wildcard ../../cores/eth_fcs/rtl/*.sv) \
#           $(wildcard ../../cores/txfifo/rtl/*.sv)

#IM_SRC := $(wildcard test/*.sv)

#VERILATOR_SRC := test/app_tb.cpp

IP_SRC := ip_catalog/pcie3_7x_0/pcie3_7x_0.xci

XDC_SRC := constraints/sume.xdc \
           constraints/xilinx_pcie3_7x_ep_x8g3_VC709.xdc

TCL_SRC := scripts/vivado_synth.tcl \
           scripts/vivado_place.tcl \
           scripts/vivado_route.tcl \
           scripts/vivado_bitstream.tcl


all: bitstream

synth: $(outdir)/post_syn.dcp
$(outdir)/post_syn.dcp: $(TCL_SRC) $(INC_SRC) $(RTL_SRC) $(IP_SRC) $(XDC_SRC)
	test -e $(outdir) || mkdir $(outdir)
	vivado -mode batch -source scripts/vivado_synth.tcl -log $(outdir)/syn_log.txt -nojournal -tclargs "$(INC_SRC) $(RTL_SRC)" "$(IP_SRC)" "$(XDC_SRC)"

place: $(outdir)/post_place.dcp
$(outdir)/post_place.dcp: $(outdir)/post_syn.dcp
	vivado -mode batch -source scripts/vivado_place.tcl -log $(outdir)/place_log.txt -nojournal

route: $(outdir)/post_route.dcp
$(outdir)/post_route.dcp: $(outdir)/post_place.dcp
	vivado -mode batch -source scripts/vivado_route.tcl -log $(outdir)/route_log.txt -nojournal

bitstream: $(outdir)/$(proj).bit
$(outdir)/$(proj).bit: $(outdir)/post_route.dcp
	vivado -mode batch -source scripts/vivado_bitstream.tcl -log $(outdir)/bitstream_log.txt -nojournal

program: $(outdir)/$(proj).bit
	vivado -mode batch -source scripts/vivado_program.tcl -log $(outdir)/program_log.txt -nojournal


#sim: sim-verilator
#
#lint: $(INC_SRC) $(RTL_SRC)
#	verilator -Wall --lint-only --cc --top-module $(sim_top) -sv $(INC_SRC) $(RTL_SRC)

#sim-verilator:
#	verilator -Wall -DSIMULATION --cc --trace --top-module $(sim_top) -sv $(INC_SRC) $(SIM_SRC) --exe $(VERILATOR_SRC)
#	make -j -C obj_dir/ -f V$(sim_top).mk V$(sim_top)
#	obj_dir/V$(sim_top)

synth-clean:
	rm -f fsm_encoding.os usage_stat*
	rm -rf build .Xil
	rm -rf *.jou *.log

sim-clean:
	rm -f wave.vcd
	rm -rf obj_dir

.PHONY: clean
clean: sim-clean synth-clean


