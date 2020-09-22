library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg4bits_serie is
	generic(
		N: natural := 2
	);
	port(
		clk_in: in std_logic;
		--enable_in: in std_logic;
		--rst_in: in std_logic;
		signal_in: in std_logic_vector(N-1 downto 0);
		signal_out: out std_logic_vector(N-1 downto 0)
	);
end;

architecture reg4bits_arch of reg4bits_serie is
	signal auxVector: std_logic_vector(N downto 0);
	--signal clk_int: std_logic;

	begin
		

	-- process (signal_in)
	-- begin
	-- 	for i in 0 to N-1 loop
	-- 		auxVector(i) <= signal_in(i);
	-- 		signal_out(i) <= auxVector(i+1);
	-- 	end loop;
	-- end process;
		
		behavior: process (clk_in, signal_in) is
			begin
				if rising_edge(clk_in) then
					--if rst_in = '1' then
						signal_out <= signal_in;
					--else
					--	signal_out <= signal_in;
					--end if;
				end if;
			end process;
end;