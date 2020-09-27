library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serial_register is
    generic(
        N: natural := 4
    );
    port(
        d_reg_in: in std_logic_vector(N-1 downto 0);
        clk_reg_in: in std_logic;
        rst_reg_in: in std_logic;
        q_reg_out: out std_logic_vector(N-1 downto 0)
    );
end;

architecture serial_register_arch of serial_register is
    begin
        ffd_generate: for i in 0 to N-1 generate
            ffd_inst: entity work.ffd
            port map(
                d_in => d_reg_in(i),
                clk_in => clk_reg_in,
                rst_in => rst_reg_in,
                q_out => q_reg_out(i)
            );
		end generate;
    
    end serial_register_arch;