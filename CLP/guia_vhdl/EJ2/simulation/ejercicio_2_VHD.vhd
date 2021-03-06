library ieee;
use ieee.std_logic_1164.all;

entity ejercicio_2_VHD is
end ejercicio_2_VHD;
---
architecture behav of ejercicio_2_VHD is
	constant N_tb: natural := 4;
	signal a_tb :std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	signal b_tb :std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
	signal ci_tb :std_logic :='0';
	signal c_tb :std_logic;
	signal s_tb :std_logic_vector(N_tb-1 downto 0);

	begin
	
	----instantiate
	dut : entity work.ejercicio_2
		generic map(
			N => N_tb
		)
		port map(
			aSum_in => a_tb,
			bSum_in => b_tb,
			carry_in => ci_tb,
			carry_out => c_tb,
			sSum_out => s_tb
		);
	
	stimulus : process is
	begin
		a_tb <= "0011" after 100 ns, "1010" after 300 ns;
		b_tb <= "0010" after 200 ns;
		ci_tb <= '1' after 400 ns;
		wait;
	end process stimulus;	
	
end architecture behav;
