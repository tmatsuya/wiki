SYNTHPATH := synthesis

all: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit

gui:
	@(cd $(SYNTHPATH) && vivado -source app_gui.tcl)

load: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit
	@(cd $(SYNTHPATH) && ./xprog.sh load)

flash: $(SYNTHPATH)/runs/top.runs/impl_1/top.mcs
	@(cd $(SYNTHPATH) && ./xprog.sh flash)

$(SYNTHPATH)/runs/top.runs/impl_1/top.bit:
	@(cd $(SYNTHPATH) && vivado -mode batch -source  app_batch.tcl)

$(SYNTHPATH)/runs/top.runs/impl_1/top.mcs: $(SYNTHPATH)/runs/top.runs/impl_1/top.bit
	@(cd $(SYNTHPATH) && ./xprog.sh mcs)

clean:
	@(cd $(SYNTHPATH) && rm -fr runs vivado*jou vivado*log)

.PHONY: clean gui load flash
