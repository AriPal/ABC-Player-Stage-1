library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM is
    Port ( from_rx_done_tick : in  STD_LOGIC;
           from_dout : in  STD_LOGIC_VECTOR (7 downto 0);
           to_clr_FF : out  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
type state_type is (mute, play);
signal state_next, state_reg: state_type;

begin
-- state register
process(clk, reset)
	begin
	if (reset = '1') then
		state_reg <= mute;
	elsif (clk'event and clk = '1') then
		state_reg <= state_next;
	end if;
end process;

-- next state and output logic
process(state_reg, from_rx_done_tick, from_dout)
	begin
	state_next <= state_reg;
	to_clr_FF <= '0';
	case state_reg is
		when mute =>
			to_clr_FF <= '1';
			if (from_rx_done_tick = '1') then
				if (from_dout = X"72" or from_dout = X"74" or from_dout = X"79" or from_dout = X"75"  
					 or from_dout = X"69" or from_dout = X"6F" or from_dout = X"70") then	-- octave 4
					state_next <= play;
				elsif (from_dout = X"61" or from_dout = X"73" or from_dout = X"64" or from_dout = X"66" 
					 or from_dout = X"67" or from_dout = X"68" or from_dout = X"6A") then	-- octave 5
					state_next <= play;
				end if;
			end if;
		when play =>
			if (from_rx_done_tick = '1') then
				if (from_dout = X"72" or from_dout = X"74" or from_dout = X"79" or from_dout = X"75"  
					 or from_dout = X"69" or from_dout = X"6F" or from_dout = X"70") then	-- octave 4
					state_next <= play;
				elsif (from_dout = X"61" or from_dout = X"73" or from_dout = X"64" or from_dout = X"66" 
					 or from_dout = X"67" or from_dout = X"68" or from_dout = X"6A") then	-- octave 5
					state_next <= play;
				else 
					state_next <= mute;
				end if;
			end if;
	end case;
end process;

end Behavioral;

