library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont4bits is
    generic(
        N: natural := 4
    );
    port(
        enable_in: in std_logic;
        clk_in: in std_logic;
        and_out: out std_logic;
        cont_out: out std_logic
    );
end;

architecture cont1bit_arch of cont4bits is
    signal aux_q: std_logic;
    signal aux_d: std_logic;
    --signal aux_cont: std_logic;
    --signal aux_xor: std_logic;
    signal aux_and: std_logic;	 
    
    begin
        aux_d <= enable_in xor aux_q;
        and_out <= enable_in and aux_q;
        cont_out <= aux_q;
		cont_inst0: entity work.ffd
            port map(
                d => aux_d,
                clk => clk_in,
                q => aux_q
            );

    signal aux_xor_vector: std_logic_vector(N-1 downto 0);
    signal aux_and_vector: std_logic_vector(N-2 downto 0);

    begin
        auxVector(0) <= input_in;
        output_out <= auxVector(N);

        reg4bits_gen: for i in 0 to N-1 generate
            reg_inst: entity work.ffd
                port map(
                    d => auxVector(i),
                    clk => clk_int,
                    rst => rst_in,
                    q => auxVector(i+1)
                );
        end generate;
        
        gate_inst: entity work.gate
            port map(
                clk_gate => clk_in,
                enable => enable_in,
                clk_out => clk_int	
            );
        
    end cont1bit_arch;