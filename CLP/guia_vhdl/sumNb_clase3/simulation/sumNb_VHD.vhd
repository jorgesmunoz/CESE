
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Declaracion de la entidad
entity sumNb_VHD is
end;

architecture sumNb_VHD_arch of sumNb_VHD is

    component sumNb is
        generic(
            N: natural := 4
        );
        port(
            a_i : in std_logic_vector(N-1 downto 0);
            b_i : in std_logic_vector(N-1 downto 0);
            ci_i : in std_logic;
            s_o : out std_logic_vector(N-1 downto 0);
            co_o : out std_logic
        );
    end component;

    constant N_tb: natural := 8;
    signal a_tb : std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal b_tb : std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal ci_tb : std_logic := '0';
    signal s_tb : std_logic_vector(N_tb-1 downto 0);
    signal co_tb : std_logic;

begin

    a_tb <= std_logic_vector(to_unsigned(7,N_tb)) after 50 ns,
            std_logic_vector(to_unsigned(11,N_tb)) after 500 ns;
    b_tb <= std_logic_vector(to_unsigned(3,N_tb)) after 200 ns,
            std_logic_vector(to_unsigned(21,N_tb)) after 650 ns;
    ci_tb <= '1' after 800 ns;

    DUT: sumNb
    generic map(
        N => N_tb
    )
    port map(
        a_i => a_tb,
        b_i => b_tb,
        ci_i => ci_tb,
        s_o => s_tb,
        co_o => co_tb
    );

end;