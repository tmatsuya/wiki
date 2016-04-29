SYNTHPATH := synthesis

all: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit 

gui:
	@(cd $(SYNTHPATH) && vivado -source pcie_gui.tcl)

load: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit 
	@(cd $(SYNTHPATH) && ./xprog.sh load)

flash: $(SYNTHPATH)/runs/top.runs/impl_1/top.mcs 
	@(cd $(SYNTHPATH) && ./xprog.sh flash)

$(SYNTHPATH)/runs/top.runs/impl_1/top.bit:
	@(cd $(SYNTHPATH) && vivado -mode batch -source  pcie_batch.tcl)

$(SYNTHPATH)/runs/top.runs/impl_1/top.mcs: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit
	@(cd $(SYNTHPATH) && ./xprog.sh mcs)

clean:
	@(cd $(SYNTHPATH) && rm -fr runs vivado*jou vivado*log)
	rm -f *.log *.jou

.PHONY: clean gui load flash
