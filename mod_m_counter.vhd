library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mod_m_counter is
	generic (
					N : integer := 18 -- number of bits
				);
	
    Port ( 
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           from_m_in : in STD_LOGIC_VECTOR(N-1 downto 0);
			  to_t_in: out std_logic
			  );
end mod_m_counter;

architecture arch of mod_m_counter is
	
	signal r_reg : std_logic_vector(N-1 downto 0) := (others => '0');
	signal r_next : std_logic_vector(N-1 downto 0) := (others => '0');
	signal max_tick : std_logic;	
begin

	process(clk, reset)
	begin
		if(reset = '1') then
			r_reg <= (others => '0');
		elsif (clk'event and clk='1') then
			r_reg <= r_next;
		end if; 
	end process; 
	
	--  next - state logic
	r_next <= (others => '0') when r_reg >= from_m_in else r_reg + 1; 
	-- output logic
	max_tick <= '1' when r_reg >= from_m_in else '0';
	to_t_in <= max_tick;
		

end arch;

