library verilog;
use verilog.vl_types.all;
entity se16to32 is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end se16to32;
