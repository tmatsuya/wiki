VIVADOPATH := /opt/Xilinx/Vivado/2014.4

VLOG_SRCS := $(wildcard ../rtl/pcie/support/*.v)
VLOG_SRCS += $(wildcard ../rtl/pcie/*.v)
VLOG_SRCS += $(wildcard ../rtl/*.v)
SVLOG_SRCS := $(wildcard ../rtl/*.sv)
SVLOG_SRCS += testbench.sv


XVLOG_OPTS := -m64 -d SIMULATION

XELAB_OPTS := -m64 --debug typical
XELAB_OPTS += -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip
XELAB_OPTS += --snapshot pcie_mmio_sim
XELAB_OPTS += -d SIMULATION
XELAB_OPTS += -timescale "1ps/1ps"

XSIM_OPTS := -nolog -t run.tcl

XVLOG := xvlog
XELAB := xelab
XSIM := xsim
GTKWAVE := gtkwave

default: xsim

xvlog:
	@cp pcie_7x_0_vlog.prj sim_vlog.prj
	@for src in $(VLOG_SRCS); do echo "verilog xil_defaultlib \"$$src\""; done >> sim_vlog.prj
	@for src in $(SVLOG_SRCS); do echo "sv xil_defaultlib \"$$src\""; done >> sim_vlog.prj
	@echo 'verilog xil_defaultlib "$(VIVADOPATH)/data/verilog/src/glbl.v"' >> sim_vlog.prj
	$(XVLOG) $(XVLOG_OPTS) -prj sim_vlog.prj

xelab: xvlog
	$(XELAB) $(XELAB_OPTS) xil_defaultlib.testbench xil_defaultlib.glbl

xsim: xelab
	$(XSIM) $(XSIM_OPTS) pcie_mmio_sim

gtkwave: xsim
	$(GTKWAVE) dump.vcd

xgui: xsim
	$(XSIM) -nolog -gui pcie_mmio_sim

.PHONY: clean
clean:
	rm -rf webtalk* xelab* xsim* xvlog* xsc*
	rm -f *.wdb *.vcd *.log
	rm -f sim_vlog.prj

