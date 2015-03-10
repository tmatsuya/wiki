`default_nettype none
`timescale 1ps/1ps

`define SIM_SPEEDUP_PATH      testbench.top0
`define TEN_GIG_GT_BLOCK_PATH testbench.top0.xgbaser_gt_wrapper_inst_0.ten_gig_eth_pcs_pma_gt_common_block
`define TEN_GIG_IP_PATH       testbench.top0.network_path_inst_0.ten_gig_eth_pcs_pma_inst
`define TX_DISABLE_PATH       testbench.top0.network_path_inst_0

module testbench;
	defparam `TEN_GIG_GT_BLOCK_PATH.WRAPPER_SIM_GTRESET_SPEEDUP = "TRUE";

	// 156.25 MHz clock for Ethernet PHY
	`define XG_REF_CLK  6400        // 6400 * 1ps = 6.4ns, 156.25 MHz clock
	logic clk_156;
	initial begin
		clk_156 = 0;
		forever #(`XG_REF_CLK/2) clk_156 = ~clk_156;
	end

	// clock: si570_refclk
	wire si570_refclk_p = clk_156;
	wire si570_refclk_n = ~clk_156;

	// clock: sma_mgt_refclk
	wire sma_mgt_refclk_p = clk_156;
	wire sma_mgt_refclk_n = ~clk_156;

	// reset
	logic sys_rst;
	initial begin
		sys_rst = 1;
		for (int i = 0; i < 100; i++) begin
			@(posedge clk_156);
		end
		sys_rst = 0;
	end

	// top
	logic user_sma_gpio_p, user_sma_gpio_n;
	logic xphy_txp, xphy_txn;
	logic xphy_rxp, xphy_rxn;
        logic sfp_tx_disable;
	logic button_n, button_s, button_w, button_e;
	wire button_c = sys_rst;
	logic [3:0] dipsw;
	logic [7:0] led;
	top top0(
		.xphy_rxp(xphy_txp),
		.xphy_rxn(xphy_txn),
		.*
	);
	
	initial begin
		button_n = 0;
		button_s = 0;
		button_w = 0;
		button_e = 0;
		dipsw = 0;
	end
endmodule
`default_nettype wire

