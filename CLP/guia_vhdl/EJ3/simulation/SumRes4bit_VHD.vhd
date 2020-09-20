library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SumRes4bit_VHD is
end SumRes4bit_VHD;

architecture behav of SumRes4bit_VHD is

-- Parte declarativa de la arquitectura
    constant N_tb: natural := 4;	
    signal a_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal b_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal ci_tb: std_logic := '0';
    signal sr_tb: std_logic := '0';
    signal co_tb: std_logic;
    signal s_tb: std_logic_vector(N_tb-1 downto 0);
-- Parte descriptiva (indica el comportamiento)
begin
    a_tb <= "0001" after 10 ns, 
            "0010" after 20 ns, 
            "0100" after 30 ns, 
            "1000" after 40 ns,
            "0001" after 50 ns, 
            "0010" after 60 ns, 
            "0100" after 70 ns, 
            "1000" after 80 ns;
    b_tb <= "0000" after 10 ns,
            "0010" after 20 ns,
            "0000" after 30 ns,
            "1000" after 40 ns,
            "0001" after 50 ns, 
            "0010" after 60 ns, 
            "0100" after 70 ns, 
            "1000" after 80 ns;
    ci_tb<= not ci_tb after 20 ns;
    sr_tb <= not sr_tb after 50 ns;


    dut: entity work.SumRes4bit
    port map(
        aNum_in => a_tb,
        bNum_in => b_tb,
        carry_in => ci_tb,
        srEnable_in => sr_tb,
        carry_out => co_tb,
        res_out => s_tb
    );

end;
