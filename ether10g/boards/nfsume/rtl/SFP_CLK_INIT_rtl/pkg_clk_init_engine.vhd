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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package pkg_clk_init_engine is

type i2c_wbm_port_rec is record
  adr_o     : std_logic_vector(2 downto 0);
  dat_o     : std_logic_vector(7 downto 0);
  we_o      : std_logic;
  stb_o     : std_logic;
  ack_i     : std_logic;
  dat_i     : std_logic_vector(7 downto 0);
end record;
  
----

type clk_init_state_type is (
  st_reset,
  st00_init_i2c_core,
  st010_wr_i2c_sw_slvaddr,
  st011_wait_wr_done,
  st012_wr_data,
  st013_wait_wr_done,
  st100_wr_slvaddr,
  st101_wait_wr_done,
  st110_wr_regaddr,
  st111_wait_wr_done,
  st120_wr_data,
  st121_wait_wr_done,
  st_idle
);

-- Declare constants

constant prerlo_addr_c    : std_logic_vector(2 downto 0)  := "000";
constant prerhi_addr_c    : std_logic_vector(2 downto 0)  := "001";
constant ctr_addr_c       : std_logic_vector(2 downto 0)  := "010";
constant txr_addr_c       : std_logic_vector(2 downto 0)  := "011";
constant cr_addr_c        : std_logic_vector(2 downto 0)  := "100";
constant sr_addr_c        : std_logic_vector(2 downto 0)  := "100";

constant rom_addr_max_c   : std_logic_vector(5 downto 0)  := "101010";


end pkg_clk_init_engine;

package body pkg_clk_init_engine is


end pkg_clk_init_engine;
