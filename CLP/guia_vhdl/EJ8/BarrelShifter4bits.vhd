library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter4bits is
	generic(
        N: natural := 4;
        M: natural := 2
	);
	port(
		word_in: in std_logic_vector(N-1 downto 0);
		sel_in: in std_logic_vector(M-1 downto 0);		
		word_out: out std_logic_vector(N-1 downto 0)
	);
end;

architecture BarrelShifter4bits_arch of BarrelShifter4bits is
    
    begin
        BarrelShifter: process (word_in, sel_in) is
            begin
                if sel_in = "00" then
                    word_out <= word_in;
                elsif sel_in = "01" then
                    word_out <= word_in(N-2 downto 0) & word_in(N-1);
                elsif sel_in = "10" then
                    word_out <= word_in(N-3 downto 0) & word_in(N-1 downto N-2);
                else
                    word_out <= word_in(0) & word_in(N-1 downto N-3);
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