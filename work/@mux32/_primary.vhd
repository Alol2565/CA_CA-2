library verilog;
use verilog.vl_types.all;
entity Mux32 is
    port(
        y               : out    vl_logic_vector(31 downto 0);
        i0              : in     vl_logic_vector(31 downto 0);
        i1              : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic
    );
end Mux32;
