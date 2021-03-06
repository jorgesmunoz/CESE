library ieee;
use ieee.std_logic_1164.all;

entity ffd_VHD is
end entity;

architecture behav of ffd_VHD is
    -- component ffd
    -- port(
    --     d: in std_logic;
    --     enable: in std_logic;
    --     rst: in std_logic;
    --     clk: in std_logic;
    --     q: out std_logic
    -- );
    -- end component;

    signal d_tb :std_logic :='0';
    signal enable_tb :std_logic :='0';
    signal rst_tb :std_logic :='1';
    signal clk_tb :std_logic :='0';
    signal q_tb :std_logic;

    begin
	clk_tb <= not clk_tb after 10 ns;
        d_tb <= '1' after 40 ns;
        enable_tb <= '1' after 20 ns, '0' after 250 ns;
        rst_tb <= '0' after 30 ns, '1' after 300 ns;
        

    ----instantiate
    U1 : entity work.ffd 
    port map(
        d => d_tb,
        enable => enable_tb,
        rst => rst_tb,
        clk => clk_tb,
        q => q_tb
    );

end behav;
