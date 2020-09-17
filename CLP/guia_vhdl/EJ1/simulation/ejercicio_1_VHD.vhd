library ieee;
use ieee.std_logic_1164.all;

entity ejercicio_1_VHD is
end ejercicio_1_VHD;
---
architecture behav of ejercicio_1_VHD is
	component ejercicio_1
	port(
		a_in :in std_logic;
		b_in :in std_logic;
		c_in: in std_logic;
		c_out :out std_logic;
		s_out :out std_logic
		);
	end component;

	signal a_tb :std_logic :='0';
	signal b_tb :std_logic :='0';
	signal ci_tb :std_logic :='0';
	signal c_tb :std_logic;
	signal s_tb :std_logic;

	begin
	----instantiate
	U1 :ejercicio_1 port map(
			a_in => a_tb,
			b_in => b_tb,
			c_in => ci_tb,
			c_out => c_tb,
			s_out => s_tb
			);
	-----ain stimulus
	Process
		begin
		a_tb<='0';
		wait for 40 ns;
		a_tb<='1';
		wait for 40 ns;
	end process;
	-----bin stimulus
	process
		begin
		b_tb<='0';
		wait for 20 ns;
		b_tb<='1';
		wait for 20 ns;
	end process;
	process
		begin
		ci_tb<='0';
		wait for 10 ns;
		ci_tb<='1';
		wait for 10 ns;
	end process;
	----
end behav;