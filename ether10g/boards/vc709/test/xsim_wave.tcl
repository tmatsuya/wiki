add_wave  /board/dut/user_clk
add_wave  /board/dut/user_reset
add_wave  /board/dut/user_lnk_up
add_wave  -radix hex /board/dut/cfg_negotiated_width
add_wave  -radix hex /board/dut/cfg_current_speed
add_wave  /board/dut/clk_ref_200
add_wave  /board/dut/mcb_clk
add_wave  /board/dut/c0_calib_done
add_wave  /board/dut/c1_calib_done
add_wave_divider PCIe
add_wave -radix hex /board/dut/s_axis_rq_*
add_wave -radix hex /board/dut/m_axis_rc_*
add_wave -radix hex /board/dut/m_axis_cq_*
add_wave -radix hex /board/dut/s_axis_cc_*
add_wave_divider AXI4LITE
add_wave -radix hex /board/dut/axi4lite_s_*
add_wave_divider DMA_S2C_C2S_0
add_wave -radix hex /board/dut/axi_str_s2c0_*
add_wave -radix hex /board/dut/axi_str_c2s0_*
add_wave_divider DMA_S2C_C2S_1
add_wave -radix hex /board/dut/axi_str_s2c0_*
add_wave -radix hex /board/dut/axi_str_c2s0_*
add_wave_divider DMA_S2C_C2S_2
add_wave -radix hex /board/dut/axi_str_s2c2_*
add_wave -radix hex /board/dut/axi_str_c2s2_*
add_wave_divider DMA_S2C_C2S_3
add_wave -radix hex /board/dut/axi_str_s2c3_*
add_wave -radix hex /board/dut/axi_str_c2s3_*
add_wave_divider VFIFO
add_wave -radix hex /board/dut/mp_pfifo_inst/axi_str_wr_*
add_wave -radix hex /board/dut/mp_pfifo_inst/axi_str_rd_*
add_wave -radix hex /board/dut/mp_pfifo_inst/wr_reset_n
add_wave -radix hex /board/dut/mp_pfifo_inst/rd_reset_n
add_wave -radix hex /board/dut/mp_pfifo_inst/user_reset
add_wave -radix hex /board/dut/mp_pfifo_inst/ddr3_fifo_empty


