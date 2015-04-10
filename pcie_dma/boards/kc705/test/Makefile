SOURCES=$(wildcard *.v) \
	$(wildcard ../rtl/pcie/PIO.v) \
	$(wildcard ../rtl/pcie/PIO_EP.v) \
	$(wildcard ../rtl/pcie/PIO_TO_CTRL.v) \
	$(wildcard ../rtl/pcie/PIO_RX_ENGINE.v) \
	$(wildcard ../rtl/pcie/PIO_TX_ENGINE.v) \
	$(wildcard ../rtl/pcie/PIO_EP_MEM_ACCESS.v) \
	$(wildcard ../rtl/pcie/PIO_RX_SNOOP.v) \
	$(wildcard ../rtl/pcie/XGMII_TX_ENGINE.v) \
	$(wildcard ../rtl/pcie/XGMII_RX_ENGINE.v) \
	$(wildcard ../rtl/pcie/PIO_TX_SNOOP.v) \
	$(wildcard ../rtl/pcie/TX_MUX.v) \
	$(wildcard ../../../cores/crc32/rtl/CRC32_D64.v) \
	$(wildcard ../../../cores/crc32/rtl/CRC32_D32.v) \
	$(wildcard ../rtl/biosrom.v)

#all: cversim
all: tlp_data.hex phy_data.hex isim

gtk: all
	gtkwave test.vcd

isim: tb_system
	./tb_system

cversim: $(SOURCES)
	cver $(SOURCES)

clean:
	rm -f tb_system verilog.log test.vcd

tb_system: $(SOURCES)
	iverilog -o tb_system $(SOURCES)

.PHONY: clean isim cversim gtk
