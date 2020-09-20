library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gate is
    port(
        clk_gate: in std_logic;
        enable: in std_logic;
        clk_out: out std_logic
    );
end;

architecture gate_arch of gate is
    begin
        clk_out <= clk_gate and enable;
    end gate_arch; 