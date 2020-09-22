library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter4bits is
	generic(
        N: natural := 4;
        M: natural := 2
	);
	port(
        in_AB: in std_logic_vector(M-1 downto 0);
        in_CD: in std_logic_vector(M-1 downto 0);
        sel_0: in std_logic;
        sel_1: in std_logic;		
		word_out: out std_logic_vector(N-1 downto 0)
	);
end;

architecture BarrelShifter4bits_arch of BarrelShifter4bits is
    
    begin
        BarrelShifter: process (in_AB, in_CD, sel_0, sel_1) is
            begin
                if sel_0 = '0' and sel_1 = '0' then
                    word_out <= in_AB & in_CD;
                elsif sel_0 = '1' and sel_1 = '0' then
                    word_out <= in_AB(0) & in_CD(1) & in_CD(0) & in_AB(1);
                elsif sel_0 = '0' and sel_1 = '1' then
                    word_out <= in_CD(1) & in_CD(0) & in_AB(1) & in_AB(0);
                else
                    word_out <= in_CD(0) & in_AB(1) & in_AB(0) & in_CD(1);
                --variable selection: std_logic_vector(M-1 downto 0);
                --begin
                    -- selection := sel_in;
                    -- case selection is
                    --     --when "00" => word_out <= word_in;
                    --     --when "01" => word_out <= word_in(2 downto 0) & word_in(3);
                    --     --when "10" => word_out <= word_in(1 downto 0) & word_in(3 downto 2);
                    --     --when "11" => word_out <= word_in(0) & word_in(3 downto 1);
                    --     --when others => NULL;
                    --     when "00" => word_out <= "0000";
                    --     when "01" => word_out <= "0000";
                    --     when "10" => word_out <= "0000";
                    --     when "11" => word_out <= "0000";
                    -- end case;
                end if;                    
            end process;
end architecture;
