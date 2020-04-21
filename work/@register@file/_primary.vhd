library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WinEn           : in     vl_logic;
        RegWrite        : in     vl_logic;
        ReadReg1        : in     vl_logic_vector(1 downto 0);
        ReadReg2        : in     vl_logic_vector(1 downto 0);
        WriteReg        : in     vl_logic_vector(1 downto 0);
        WinData         : in     vl_logic_vector(1 downto 0);
        WriteData       : in     vl_logic_vector(15 downto 0);
        ReadData1       : out    vl_logic_vector(15 downto 0);
        ReadData2       : out    vl_logic_vector(15 downto 0)
    );
end RegisterFile;
