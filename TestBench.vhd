--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:59:56 10/12/2014
-- Design Name:   
-- Module Name:   C:/Users/Dler/Dropbox/Code/VHDL/ABC/ABC/tb_hele.vhd
-- Project Name:  ABC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ABC_Main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_hele IS
END tb_hele;
 
ARCHITECTURE behavior OF tb_hele IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ABC_Main
    PORT(
         rx : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         loudspeaker : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rx : std_logic := '1';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal loudspeaker : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ABC_Main PORT MAP (
          rx => rx,
          clk => clk,
          reset => reset,
          loudspeaker => loudspeaker
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--00110001
      wait for clk_period*10;
		
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '1';
		wait for clk_period * 5208;
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '1';
		wait for clk_period * 5208;
		rx <= '1';
		wait for clk_period * 5208;
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '0';
		wait for clk_period * 5208;
		rx <= '1';
		wait for clk_period * 5208;

      -- insert stimulus here 

      wait;
   end process;

END;
