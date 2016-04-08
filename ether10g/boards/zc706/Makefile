SYNTHPATH := synthesis

all: bitfile sdk

gui:
	@(cd $(SYNTHPATH) && vivado -source app_gui.tcl)

bitfile:
	@(cd $(SYNTHPATH) && vivado -mode batch -source  app_batch.tcl)

sdk: $(SYNTHPATH)/runs/top.runs/impl_1/design_1_wrapper.sysdef
	@(cd $(SYNTHPATH) && xsct sdk.tcl)

load: 
	@(cd $(SYNTHPATH) && xsdb -n load_elf.tcl)
	@(cd $(SYNTHPATH) && xsdb -n load_bitfile.tcl)

clean:
	@(cd $(SYNTHPATH) && rm -fr runs vivado*jou vivado*log bd_build)

.PHONY: clean gui load flash
