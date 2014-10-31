library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 
--

entity T_FF is
    Port ( 
			clk, reset: in std_logic;
			from_t_in: in std_logic;
			from_clr_FF: in std_logic;
			to_ldspkr: out std_logic := '0');
end T_FF;

architecture Behavioral of T_FF is

signal ld_spk : std_logic := '0';

begin
	process(clk, reset,from_t_in)
	begin
		if(reset='1') then
			ld_spk <='0';
		elsif(from_t_in'event and from_t_in='1') then
		
			if(from_clr_FF='1') then
				ld_spk <='0';
			else
				if (ld_spk = '0') then
					ld_spk <= '1';
				else 
					ld_spk <= '0';
				end if; 
			end if;
		end if;
	end process;
	
	to_ldspkr <= ld_spk;
	
end Behavioral;