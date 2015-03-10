`default_nettype none
`timescale 1ps/1ps

`define TOP_PATH    testbench.top0

module testbench;
	defparam `TOP_PATH.PL_FAST_TRAIN = "TRUE";

	// 200 MHz clock for PCIe
	`define XG_REF_CLK  5000        // 5000 * 1ps = 5ns, 200 MHz clock
	logic clk_200;
	initial begin
		clk_200 = 0;
		forever #(`XG_REF_CLK/2) clk_200 = ~clk_200;
	end

	// clock: sysclk_p, sysclk_n
	logic sysclk_p = clk_200;
	logic sysclk_n = ~clk_200;

	// clock: sys_clk_p, sys_clk_n
	logic sys_clk_p = clk_200;
	logic sys_clk_n = ~clk_200;

	// sys_rst_n
	logic sys_rst_n;
	initial begin
		sys_rst_n = 0;
		for (int i = 0; i < 100; i++) begin
			@(posedge clk_200);
		end
		sys_rst_n = 1;
	end

	// top
	logic [`TOP_PATH.LINK_WIDTH-1:0] pci_exp_txp, pci_exp_txn;
	logic [`TOP_PATH.LINK_WIDTH-1:0] pci_exp_rxp, pci_exp_rxn;
	logic button_n, button_s, button_w, button_e;
	logic button_c = ~sys_rst_n;
	logic [3:0] dipsw;
	logic [7:0] led;
	top top0(.*); 
	
	initial begin
		#5000;

		for (int i = 0; i < 2000; i++) begin
			pcitx2pcirx(pci_exp_txp, pci_exp_txn, pci_exp_rxp, pci_exp_rxn);
		end

		#1000;
		$finish;
	end

	task pcitx2pcirx;
		input  pci_exp_txp;
		input  pci_exp_txn;
		output pci_exp_rxp;
		output pci_exp_rxn;

		@(posedge clk_200) begin
			pci_exp_rxp = pci_exp_txp;
			pci_exp_rxn = pci_exp_txn;
		end
	endtask

	initial begin
		button_n = 0;
		button_s = 0;
		button_w = 0;
		button_e = 0;
		dipsw = 0;
	end
endmodule
`default_nettype wire

