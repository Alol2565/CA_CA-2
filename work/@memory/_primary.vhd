library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        instAdd         : in     vl_logic_vector(9 downto 0);
        dataAdd         : in     vl_logic_vector(9 downto 0);
        writeData       : in     vl_logic_vector(15 downto 0);
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        instruction     : out    vl_logic_vector(15 downto 0);
        data            : out    vl_logic_vector(15 downto 0)
    );
end Memory;
