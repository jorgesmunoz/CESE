library IEEE;
use IEEE.std_logic_1164.all;

entity reg4bits_serie is
	port(
		pin_in: in std_logic;
		pin_out: out std_logic;
		clk: in std_logic
	);
end;

architecture reg4bits_arch of reg4bits_serie is
	signal buffer: std_logic;
	buffer <= pin_in;
begin
	reg4bits: process(clk) is
	begin
		if rising_edge(clk) then
			pin_out => buffer;
		end if;
	end process reg4bits;
end;