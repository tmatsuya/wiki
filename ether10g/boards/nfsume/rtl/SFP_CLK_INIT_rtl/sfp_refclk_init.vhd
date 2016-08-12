---
-- Copyright (c) 2015 Murat Arslan
-- All rights reserved.
--
-- @NETFPGA_LICENSE_HEADER_START@
--
-- Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
-- license agreements.  See the NOTICE file distributed with this work for
-- additional information regarding copyright ownership.  NetFPGA licenses this
-- file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
-- "License"); you may not use this file except in compliance with the
-- License.  You may obtain a copy of the License at:
--
--   http://www.netfpga-cic.org
--
-- Unless required by applicable law or agreed to in writing, Work distributed
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
-- CONDITIONS OF ANY KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations under the License.
--
-- @NETFPGA_LICENSE_HEADER_END@
--
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 
-- Create Date: 22.03.2015 17:09:54
-- Design Name: 
-- Module Name: sfp_refclk_init - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.pkg_clk_init_engine.all;

library UNISIM;
use UNISIM.VComponents.all;

entity sfp_refclk_init is
port(
  -- clk and reset
  ------------------------------------------
  CLK             : in std_logic;
  RST             : in std_logic;

  -- Si5324 Interface
  ------------------------------------------
  SFP_REC_CLK_P   : out std_logic;
  SFP_REC_CLK_N   : out std_logic;
  SFP_CLK_ALARM_B : in std_logic;
  --
  I2C_FPGA_SCL    : inout std_logic;
  I2C_FPGA_SDA    : inout std_logic
);
end entity sfp_refclk_init;

architecture Structural of sfp_refclk_init is

----------------------------------------
-- clk_init_engine
component clk_init_engine
port(
  CLK_I                       : in std_logic;
  RST_I                       : in std_logic;
  
  -- i2c_master_top WishBone Master Interface
  ------------------------------------------
  WBM_ADR_O       : out std_logic_vector(2 downto 0);
  WBM_DAT_O       : out std_logic_vector(7 downto 0);
  WBM_WE_O        : out std_logic;
  WBM_STB_O       : out std_logic;
  WBM_ACK_I       : in  std_logic;
  WBM_DAT_I       : in  std_logic_vector(7 downto 0)
);
end component;

signal i2c_wbm_port : i2c_wbm_port_rec;

----------------------------------------
-- i2c_master_top
component i2c_master_top
    generic(
            ARST_LVL : std_logic := '0'                   -- asynchronous reset level
    );
    port   (
            -- wishbone signals
            wb_clk_i      : in  std_logic;                    -- master clock input
            wb_rst_i      : in  std_logic := '0';             -- synchronous active high reset
            arst_i        : in  std_logic := not ARST_LVL;    -- asynchronous reset
            wb_adr_i      : in  std_logic_vector(2 downto 0); -- lower address bits
            wb_dat_i      : in  std_logic_vector(7 downto 0); -- Databus input
            wb_dat_o      : out std_logic_vector(7 downto 0); -- Databus output
            wb_we_i       : in  std_logic;                    -- Write enable input
            wb_stb_i      : in  std_logic;                    -- Strobe signals / core select signal
            wb_cyc_i      : in  std_logic;                    -- Valid bus cycle input
            wb_ack_o      : out std_logic;                    -- Bus cycle acknowledge output
            wb_inta_o     : out std_logic;                    -- interrupt request output signal

            -- i2c lines
            scl_pad_i     : in  std_logic;                    -- i2c clock line input
            scl_pad_o     : out std_logic;                    -- i2c clock line output
            scl_padoen_o  : out std_logic;                    -- i2c clock line output enable, active low
            sda_pad_i     : in  std_logic;                    -- i2c data line input
            sda_pad_o     : out std_logic;                    -- i2c data line output
            sda_padoen_o  : out std_logic                     -- i2c data line output enable, active low
    );
end component;

signal scl_pad_i    : std_logic := '0';
signal scl_pad_o    : std_logic := '0';
signal scl_padoen_o : std_logic := '0';
signal sda_pad_i    : std_logic := '0';
signal sda_pad_o    : std_logic := '0';
signal sda_padoen_o : std_logic := '0';

signal scl : std_logic := '0';
signal sda : std_logic := '0';


signal sfp_clk_alarm_b_dbg : std_logic;

attribute keep: string;
attribute keep of scl_pad_i: signal is "true";
attribute keep of scl_pad_o: signal is "true";
attribute keep of scl_padoen_o: signal is "true";
attribute keep of sda_pad_i: signal is "true";
attribute keep of sda_pad_o: signal is "true";
attribute keep of sda_padoen_o: signal is "true";
attribute keep of sfp_clk_alarm_b_dbg: signal is "true";



begin

sfp_clk_alarm_b_dbg <= SFP_CLK_ALARM_B;

----------------------------------------
-- clk_init_engine
clk_init_engine_inst : clk_init_engine
port map(
  CLK_I           => CLK, --: in std_logic;
  RST_I           => RST, --: in std_logic;
  
  -- i2c_master_top WishBone Master Interface
  ------------------------------------------
  WBM_ADR_O       => i2c_wbm_port.adr_o, --: out std_logic_vector(2 downto 0);
  WBM_DAT_O       => i2c_wbm_port.dat_o, --: out std_logic_vector(7 downto 0);
  WBM_WE_O        => i2c_wbm_port.we_o, --: out std_logic;
  WBM_STB_O       => i2c_wbm_port.stb_o, --: out std_logic;
  WBM_ACK_I       => i2c_wbm_port.ack_i, --: in  std_logic;
  WBM_DAT_I       => i2c_wbm_port.dat_i --: in  std_logic_vector(7 downto 0)
);


----------------------------------------
-- i2c_master_top
i2c_master_top_inst : i2c_master_top
    generic map(
            ARST_LVL => '1' --: std_logic := '0'                   -- asynchronous reset level
    )
    port   map(
            -- wishbone signals
            wb_clk_i      => CLK, --: in  std_logic;                    -- master clock input
            wb_rst_i      => '0', --: in  std_logic := '0';             -- synchronous active high reset
            arst_i        => RST, --: in  std_logic := not ARST_LVL;    -- asynchronous reset
            wb_adr_i      => i2c_wbm_port.adr_o, --: in  std_logic_vector(2 downto 0); -- lower address bits
            wb_dat_i      => i2c_wbm_port.dat_o, --: in  std_logic_vector(7 downto 0); -- Databus input
            wb_dat_o      => i2c_wbm_port.dat_i, --: out std_logic_vector(7 downto 0); -- Databus output
            wb_we_i       => i2c_wbm_port.we_o, --: in  std_logic;                    -- Write enable input
            wb_stb_i      => i2c_wbm_port.stb_o, --: in  std_logic;                    -- Strobe signals / core select signal
            wb_cyc_i      => '1', --: in  std_logic;                    -- Valid bus cycle input
            wb_ack_o      => i2c_wbm_port.ack_i, --: out std_logic;                    -- Bus cycle acknowledge output
            wb_inta_o     => open, --: out std_logic;                    -- interrupt request output signal

            -- i2c lines
            scl_pad_i     => scl_pad_i, --: in  std_logic;                    -- i2c clock line input
            scl_pad_o     => scl_pad_o, --: out std_logic;                    -- i2c clock line output
            scl_padoen_o  => scl_padoen_o, --: out std_logic;                    -- i2c clock line output enable, active low
            sda_pad_i     => sda_pad_i, --: in  std_logic;                    -- i2c data line input
            sda_pad_o     => sda_pad_o, --: out std_logic;                    -- i2c data line output
            sda_padoen_o  => sda_padoen_o --: out std_logic                     -- i2c data line output enable, active low
    );

-- I2C_FPGA_SCL <= scl_pad_o when (scl_padoen_o = '0') else 'Z';
-- I2C_FPGA_SDA <= sda_pad_o when (sda_padoen_o = '0') else 'Z';

-- scl_pad_i <= I2C_FPGA_SCL;
-- scl_pad_i <= I2C_FPGA_SDA;

I2C_FPGA_SCL <= 'Z' when (scl_padoen_o = '1') else scl_pad_o;
scl_pad_i <= I2C_FPGA_SCL;

I2C_FPGA_SDA <= 'Z' when (sda_padoen_o = '1') else sda_pad_o;
sda_pad_i <= I2C_FPGA_SDA;


OBUFDS_inst : OBUFDS
generic map (
IOSTANDARD => "LVDS", -- Specify the output I/O standard
SLEW => "SLOW") -- Specify the output slew rate
port map (
O => SFP_REC_CLK_P, -- Diff_p output (connect directly to top-level port)
OB => SFP_REC_CLK_N, -- Diff_n output (connect directly to top-level port)
I => CLK -- Buffer input
);


end Structural;
