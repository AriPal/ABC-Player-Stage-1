
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 


entity CodeConverter is
    Port (			  from_dout : in  STD_LOGIC_VECTOR (7 downto 0);
           to_m_in : out  STD_LOGIC_VECTOR (17 downto 0)
			  );
end CodeConverter;

	
architecture Behavioral of CodeConverter is

begin

process(from_dout)

begin		
	case from_dout is						
		when "00110001" => to_m_in <= "101110101010001001"; -- Keyboard number 1 for music note C4 (262 Hz)
		when "00110010" => to_m_in <= "111110010010000010"; -- Keyboard number 2 for music note G4 (392 Hz)
		when "00110011" => to_m_in <= "100010111101000100"; -- Keyboard number 3 for music note F5 (698 Hz)
		when "00110100" => to_m_in <= "101001100100010110"; -- Keyboard number 4 for music note D4 (294 Hz)
		
		when others => NULL; 
		
	end case; 
end process; 

end Behavioral;

