
`timescale 1ns/1ns
module memtb();
  
  reg rst,clk, memread, memwrite;
  reg [31:0] address, Writedata, readdata;
  initial begin
  clk = 1;
  memread = 0;
  memwrite = 0;
  address = 32'b0;
  Writedata = 32'b0;
  
end
  always
    #50 clk = !clk;
  datamem uut(address, Writedata, clk,memread , memwrite , readdata );
 // RegisterFile uut(clk,rst,RegWrite,ReadReg1,ReadReg2,WriteReg, WriteData,ReadData1,ReadData2);

  initial begin
   rst =  1;
   #200
   rst = 0;
  // #30
  // RegWrite = 1;
  // WriteData = 32'd21;
  // #100
  // RegWrite = 0;
   
   
  end
endmodule

