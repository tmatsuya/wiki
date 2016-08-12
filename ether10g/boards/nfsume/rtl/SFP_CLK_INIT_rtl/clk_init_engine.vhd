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
-- Create Date:   14:15:00 22/03/2015 
-- Design Name: 
-- Module Name:    clk_init_engine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_init_engine is
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
end clk_init_engine;

architecture Behavioral of clk_init_engine is

----------------------------------------
-- si5324_regs ROM
component si5324_regs_rom
PORT(
  A     : in  std_logic_vector(5 downto 0);
  CLK   : in  std_logic;
  QSPO  : out std_logic_vector(15 downto 0)
);
end component;

signal addr_to_rom    : std_logic_vector(5 downto 0) := (others => '0');
signal data_from_rom  : std_logic_vector(15 downto 0) := (others => '0');

----------------------------------------
-- output signals
signal i2c_wbm_port : i2c_wbm_port_rec;   

----------------------------------------
-- state and control signals
signal state: clk_init_state_type := st_reset;

signal state_cntr : integer range 0 to 3 := 0;

attribute keep: string;
attribute keep of addr_to_rom: signal is "true";
attribute keep of data_from_rom: signal is "true";
attribute keep of i2c_wbm_port: signal is "true";
attribute keep of state: signal is "true";
attribute keep of state_cntr: signal is "true";

begin

----------------------------------------
--  state

state_process: process(CLK_I)
begin
if(CLK_I'event and CLK_I = '1') then
  if(RST_I = '1') then
    state <= st_reset;
  else
    case state is
      when st_reset =>
        state <= st00_init_i2c_core;
      ----
      when st00_init_i2c_core =>
        if state_cntr = 2 and i2c_wbm_port.ack_i = '1' then
          state <= st010_wr_i2c_sw_slvaddr;
        end if;
      ----
      when st010_wr_i2c_sw_slvaddr =>
        if state_cntr = 1 and i2c_wbm_port.ack_i = '1' then
          state <= st011_wait_wr_done;
        end if;
      ----
      when st011_wait_wr_done =>
        if i2c_wbm_port.ack_i = '1'  and i2c_wbm_port.dat_i(1) = '0' then
          state <= st012_wr_data;
        end if;
      ----
      when st012_wr_data =>
        if state_cntr = 1 and i2c_wbm_port.ack_i = '1' then
          state <= st013_wait_wr_done;
        end if;
      ----
      when st013_wait_wr_done =>
        if i2c_wbm_port.ack_i = '1'  and i2c_wbm_port.dat_i(1) = '0' then
          state <= st100_wr_slvaddr;
        end if;
      ----
      when st100_wr_slvaddr =>
        if state_cntr = 1 and i2c_wbm_port.ack_i = '1' then
          state <= st101_wait_wr_done;
        end if;
      ----
      when st101_wait_wr_done =>
        if i2c_wbm_port.ack_i = '1'  and i2c_wbm_port.dat_i(1) = '0' then
          state <= st110_wr_regaddr;
        end if;
      ----
      when st110_wr_regaddr =>
        if state_cntr = 1 and i2c_wbm_port.ack_i = '1' then
          state <= st111_wait_wr_done;
        end if;
      ----
      when st111_wait_wr_done =>
        if i2c_wbm_port.ack_i = '1'  and i2c_wbm_port.dat_i(1) = '0' then
          state <= st120_wr_data;
        end if;
      ----
      when st120_wr_data =>
        if state_cntr = 1 and i2c_wbm_port.ack_i = '1' then
          state <= st121_wait_wr_done;
        end if;
      ----
      when st121_wait_wr_done =>
        if i2c_wbm_port.ack_i = '1'  and i2c_wbm_port.dat_i(1) = '0' then
          if addr_to_rom = rom_addr_max_c + '1' then
            state <= st_idle;
          else 
            state <= st100_wr_slvaddr;
          end  if;
        end if;
      ----
      when others => null;
    end case;
  end if;
end if;
end process state_process;

----------------------------------------
--  state_cntr

state_cntr_process: process(CLK_I)
begin
if(CLK_I'event and CLK_I = '1') then
  if RST_I = '1' then
    state_cntr <= 0;
  else
    case state is
      when st_reset =>
        state_cntr <= 0;
      ----
      when st00_init_i2c_core =>
        if i2c_wbm_port.stb_o = '1' and i2c_wbm_port.ack_i = '1' then
          if state_cntr = 2 then 
            state_cntr <= 0;
          else 
            state_cntr <= state_cntr + 1;
          end if;
        end if;
      ----
      when st010_wr_i2c_sw_slvaddr | st100_wr_slvaddr =>
        if i2c_wbm_port.stb_o = '1' and i2c_wbm_port.ack_i = '1' then
          if state_cntr = 1 then 
            state_cntr <= 0;
          else 
            state_cntr <= state_cntr + 1;
          end if;
        end if;
      ----
      when st011_wait_wr_done | st101_wait_wr_done =>
        state_cntr <= 0;
      ----
      when st110_wr_regaddr =>
        if i2c_wbm_port.stb_o = '1' and i2c_wbm_port.ack_i = '1' then
          if state_cntr = 1 then 
            state_cntr <= 0;
          else 
            state_cntr <= state_cntr + 1;
          end if;
        end if;
      ----
      when st111_wait_wr_done =>
        state_cntr <= 0;
      ----
      when st012_wr_data | st120_wr_data =>
        if i2c_wbm_port.stb_o = '1' and i2c_wbm_port.ack_i = '1' then
          if state_cntr = 1 then 
            state_cntr <= 0;
          else 
            state_cntr <= state_cntr + 1;
          end if;
        end if;
      ----
      when st013_wait_wr_done | st121_wait_wr_done | st_idle =>
        state_cntr <= 0;
      ----
      when others => null;
    end case;
  end if;
end if;
end process state_cntr_process;
       
----------------------------------------
-- si5324_regs ROM
si5324_regs_rom_init : si5324_regs_rom
port map(
  A     => addr_to_rom, --: in  std_logic_vector(5 downto 0);
  CLK   => CLK_I, --: in  std_logic;
  QSPO  => data_from_rom --: out std_logic_vector(15 downto 0)
);
  
addr_to_rom_process: process(CLK_I)
begin
if(CLK_I'event and CLK_I = '1') then
  if RST_I = '1' then
    addr_to_rom <= (others => '0');
  else
    if state = st120_wr_data and state_cntr = 1 and i2c_wbm_port.stb_o = '1' and i2c_wbm_port.ack_i = '1' then
      addr_to_rom <= addr_to_rom + '1';
    end if;
  end if;
end if;
end process addr_to_rom_process;
      
----------------------------------------
-- i2c core withbone master interface

WBM_ADR_O           <= i2c_wbm_port.adr_o;  --: out std_logic_vector(2 downto 0);
WBM_DAT_O           <= i2c_wbm_port.dat_o;  --: out std_logic_vector(7 downto 0);
WBM_WE_O            <= i2c_wbm_port.we_o;   --: out std_logic;
WBM_STB_O           <= i2c_wbm_port.stb_o;  --: out std_logic;
i2c_wbm_port.ack_i  <= WBM_ACK_I;           --: in  std_logic;
i2c_wbm_port.dat_i  <= WBM_DAT_I;           --: in  std_logic_vector(7 downto 0)

i2c_wbm_port_process: process(CLK_I)
begin
if CLK_I'event and CLK_I = '1' then
  if RST_I = '1' then
    i2c_wbm_port.adr_o  <= (others => '0');
    i2c_wbm_port.dat_o  <= (others => '0');
    i2c_wbm_port.we_o   <= '0';
    i2c_wbm_port.stb_o  <= '0';
  else
    case state is
      when st_reset =>
        i2c_wbm_port.adr_o  <= (others => '0');
        i2c_wbm_port.dat_o  <= (others => '0');
        i2c_wbm_port.we_o   <= '0';
        i2c_wbm_port.stb_o  <= '0';
      ----
      when st00_init_i2c_core =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= prerlo_addr_c;
            i2c_wbm_port.dat_o <= x"C7";
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= prerhi_addr_c;
            i2c_wbm_port.dat_o <= x"00";
          ----
          when 2 => 
            i2c_wbm_port.adr_o <= ctr_addr_c;
            i2c_wbm_port.dat_o <= x"80";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
      ----
      when st010_wr_i2c_sw_slvaddr =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= txr_addr_c;
            i2c_wbm_port.dat_o <= x"E8";
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= cr_addr_c;
            i2c_wbm_port.dat_o <= x"90";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
      ----
      when st012_wr_data =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= txr_addr_c;
            i2c_wbm_port.dat_o <= x"10";
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= cr_addr_c;
            i2c_wbm_port.dat_o <= x"50";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
          
      ----
      when st100_wr_slvaddr =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= txr_addr_c;
            i2c_wbm_port.dat_o <= x"D0";
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= cr_addr_c;
            i2c_wbm_port.dat_o <= x"90";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
        
      ----
      when st011_wait_wr_done | st013_wait_wr_done | st101_wait_wr_done | st111_wait_wr_done | st121_wait_wr_done =>
        -- adr_o, dat_o
        i2c_wbm_port.adr_o <= sr_addr_c;
        i2c_wbm_port.dat_o <= x"00";
          
        -- we_o
        i2c_wbm_port.we_o <= '0';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
        
      ----
      when st110_wr_regaddr =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= txr_addr_c;
            i2c_wbm_port.dat_o <= data_from_rom(15 downto 8);
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= cr_addr_c;
            i2c_wbm_port.dat_o <= x"10";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
      ----
      when st120_wr_data =>
        -- adr_o, dat_o
        case state_cntr is
          when 0 => 
            i2c_wbm_port.adr_o <= txr_addr_c;
            i2c_wbm_port.dat_o <= data_from_rom(7 downto 0);
          ----
          when 1 => 
            i2c_wbm_port.adr_o <= cr_addr_c;
            i2c_wbm_port.dat_o <= x"50";
          ----
          when others => null;
        end case;
        
        -- we_o
        i2c_wbm_port.we_o <= '1';
        
        -- stb_o
        if i2c_wbm_port.stb_o = '1' then
          if i2c_wbm_port.ack_i = '1' then
            i2c_wbm_port.stb_o <= '0';
          end if;
        else
          i2c_wbm_port.stb_o <= '1';
        end if;
      
      ----    
      when st_idle =>
        i2c_wbm_port.adr_o  <= (others => '0');
        i2c_wbm_port.dat_o  <= (others => '0');
        i2c_wbm_port.we_o   <= '0';
        i2c_wbm_port.stb_o  <= '0';
      ----
      when others => null;
    end case;
  end if;
end if;
end process i2c_wbm_port_process;

end Behavioral;
