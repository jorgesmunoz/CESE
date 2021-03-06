library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counterNbit is
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

architecture counterNbit_arch of counterNbit is
    signal aux_d: std_logic_vector(N-1 downto 0);
    signal aux_q: std_logic_vector(N-1 downto 0);
    signal aux_and: std_logic_vector(N-2 downto 0);

    begin
        register_inst: entity work.serial_register
            generic map(
                N => N
            )
            port map(
                d_in => aux_d,
                clk_in => clk_counter_in,
                rst_in => rst_counter_in,
                q_out => aux_q
            );

        aux_and(0) <= enable_counter_in and aux_q(0);
        aux_and(N-2 downto 1) <= aux_and(N-3 downto 0) and aux_q(N-2 downto 1);
        aux_d(0) <= aux_q(0) xor enable_counter_in;
        aux_d(N-1 downto 1) <= aux_q(N-1 downto 1) xor aux_and(N-2 downto 0);

        q_counter_out <= aux_q;
    
    end counterNbit_arch;