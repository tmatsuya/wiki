onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /board/dut/user_clk
add wave -noupdate /board/dut/user_reset
add wave -noupdate /board/dut/user_lnk_up
add wave -noupdate -radix hexadecimal /board/dut/cfg_phy_link_status
add wave -noupdate -radix hexadecimal /board/dut/cfg_negotiated_width
add wave -noupdate -radix hexadecimal /board/dut/cfg_current_speed
add wave -noupdate -radix hexadecimal /board/dut/cfg_function_status
add wave -noupdate /board/dut/mcb_clk
add wave -noupdate /board/dut/clk_ref_200
add wave -noupdate /board/dut/c0_calib_done
add wave -noupdate /board/dut/c1_calib_done
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tlast
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tdata
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tuser
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tkeep
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tready
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_rq_tvalid
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tdata
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tuser
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tlast
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tkeep
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tvalid
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tready
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_rc_tready_i
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tdata
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tuser
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tlast
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tkeep
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tvalid
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tready
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/m_axis_cq_tready_i
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tdata
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tuser
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tlast
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tkeep
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tvalid
add wave -noupdate -group PCIe -radix hexadecimal /board/dut/s_axis_cc_tready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_awaddr
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_awvalid
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_awready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_wdata
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_wstrb
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_wvalid
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_wready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_bvalid
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_bready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_bresp
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_araddr
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_arready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_arvalid
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_rdata
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_rresp
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_rready
add wave -noupdate -group AXI4LITE -radix hexadecimal /board/dut/axi4lite_s_rvalid
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tuser
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tlast
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tdata
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tkeep
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tvalid
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_tready
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_s2c0_aresetn
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tuser
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tlast
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tdata
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tkeep
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tvalid
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_tready
add wave -noupdate -group DMA_S2C_C2S_0 -radix hexadecimal /board/dut/axi_str_c2s0_aresetn
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tuser
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tlast
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tdata
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tkeep
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tvalid
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_tready
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_s2c1_aresetn
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tuser
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tlast
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tdata
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tkeep
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tvalid
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_tready
add wave -noupdate -group DMA_S2C_C2S_1 -radix hexadecimal /board/dut/axi_str_c2s1_aresetn
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tuser
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tlast
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tdata
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tkeep
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tvalid
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_tready
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_s2c2_aresetn
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tuser
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tlast
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tdata
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tkeep
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tvalid
add wave -noupdate -group DMA_S2C_C2S_2 -radix hexadecimal /board/dut/axi_str_c2s2_tready
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tuser
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tlast
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tdata
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tkeep
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tvalid
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_tready
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_s2c3_aresetn
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tuser
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tlast
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tdata
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tkeep
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tvalid
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_tready
add wave -noupdate -group DMA_S2C_C2S_3 -radix hexadecimal /board/dut/axi_str_c2s3_aresetn
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_tlast
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_tdata
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_tvalid
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_tkeep
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_tready
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_wr_aclk
add wave -noupdate -group AXIS_VF -radix hexadecimal -childformat {{{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[7]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[6]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[5]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[4]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[3]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[2]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[1]} -radix hexadecimal} {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[0]} -radix hexadecimal}} -subitemconfig {{/board/dut/mp_pfifo_inst/axi_str_rd_tlast[7]} {-radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[6]} {-radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[5]} {-radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[4]} {-radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[3]} {-height 16 -radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[2]} {-height 16 -radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[1]} {-height 16 -radix hexadecimal} {/board/dut/mp_pfifo_inst/axi_str_rd_tlast[0]} {-height 16 -radix hexadecimal}} /board/dut/mp_pfifo_inst/axi_str_rd_tlast
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_rd_tdata
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_rd_tvalid
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_rd_tkeep
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_rd_tready
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/axi_str_rd_aclk
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/wr_reset_n
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/rd_reset_n
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/ddr3_fifo_empty
add wave -noupdate -group AXIS_VF -radix hexadecimal /board/dut/mp_pfifo_inst/user_reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
configure wave -namecolwidth 170
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {316284487 fs} {7517454269 fs}

run 200us

