VIVADOPATH := /opt/Xilinx/Vivado/2014.4

VLOG_SRCS := $(wildcard ../rtl/network_path/*.v)
VLOG_SRCS += $(wildcard ../rtl/*.v)
VLOG_SRCS += $(wildcard ../../../cores/xgmiisync/rtl/*.v)
VLOG_SRCS += $(wildcard ../../../cores/crc32/rtl/*.v)
SVLOG_SRCS := $(wildcard ../rtl/*.sv)
SVLOG_SRCS += top_tb.sv


XVLOG_OPTS := -m64 -d SIMULATION
XVHDL_OPTS := -m64

XELAB_OPTS := -m64 --debug typical
XELAB_OPTS += -L ten_gig_eth_pcs_pma_v5_0 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip
XELAB_OPTS += --snapshot ether10g_sim
XELAB_OPTS += -d SIMULATION
XELAB_OPTS += -timescale "1ps/1ps"

XSIM_OPTS := -nolog -t run.tcl

XVLOG := xvlog
XVHDL := xvhdl
XELAB := xelab
XSIM := xsim
GTKWAVE := gtkwave

default: xsim

xvlog:
	@cp eth_10g_pcs_ip.prj sim_vlog.prj
	@for src in $(VLOG_SRCS); do echo "verilog xil_defaultlib \"$$src\""; done >> sim_vlog.prj
	@for src in $(SVLOG_SRCS); do echo "sv xil_defaultlib \"$$src\""; done >> sim_vlog.prj
	@echo 'verilog xil_defaultlib "$(VIVADOPATH)/data/verilog/src/glbl.v"' >> sim_vlog.prj
	$(XVLOG) $(XVLOG_OPTS) -prj sim_vlog.prj

xvhdl:
	$(XVHDL) $(XVHDL_OPTS) -prj sim_vhdl.prj

xelab: xvlog xvhdl
	$(XELAB) $(XELAB_OPTS) xil_defaultlib.testbench xil_defaultlib.glbl

xsim: xelab
	$(XSIM) $(XSIM_OPTS) ether10g_sim

gtkwave: xsim
	$(GTKWAVE) dump.vcd

xgui: xsim
	$(XSIM) -nolog -gui ether10g_sim

iverilog:
	iverilog -o app_tb app_tb.v ../rtl/app.v ../../../cores/xgmiisync/rtl/xgmiisync.v ../../../cores/crc32/rtl/crc32_d64.v
	./app_tb

.PHONY: clean
clean:
	rm -rf webtalk* xelab* xsim* xvlog* xvhdl* xsc*
	rm -f *.wdb *.vcd *.log
	rm -f sim_vlog.prj

