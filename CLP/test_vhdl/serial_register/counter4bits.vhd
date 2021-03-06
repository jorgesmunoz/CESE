library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter4bits is
    generic(
        N: natural := 4
    );
    port(
        enable_counter_in: in std_logic;
        clk_counter_in: in std_logic;
        rst_counter_in: in std_logic;
        q_counter_out: out std_logic_vector(N-1 downto 0)
    );
end;

architecture counter4bits_arch of counter4bits is
    constant aux_N: natural := 4;
    signal aux_d: std_logic_vector(aux_N-1 downto 0);
    signal aux_q: std_logic_vector(aux_N-1 downto 0);
    signal aux_and: std_logic_vector(aux_N-2 downto 0);

    begin
        register_inst: entity work.serial_register
            generic map(
                N => aux_N
            )
            port map(
                d_reg_in => aux_d,
                clk_reg_in => clk_counter_in,
                rst_reg_in => rst_counter_in,
                q_reg_out => aux_q
            );

        aux_and(0) <= enable_counter_in and aux_q(0);
        aux_and(aux_N-2 downto 1) <= aux_and(aux_N-3 downto 0) and aux_q(aux_N-2 downto 1);
        aux_d(0) <= aux_q(0) xor enable_counter_in;
        aux_d(aux_N-1 downto 1) <= aux_q(aux_N-1 downto 1) xor aux_and(aux_N-2 downto 0);

        q_counter_out <= aux_q;
    
    end counter4bits_arch;