`timescale 1ns/1ns
module tb();
  
  reg rst,clk,RegWrite;
  reg [4:0] ReadReg1,ReadReg2,WriteReg;
  reg [31:0] WriteData ,ReadData1,ReadData2;
  initial begin
  clk = 1;
//  ReadReg1 =4'd3 ;
  //ReadReg2 = 4'd4;
  //WriteReg =4'd5;
  //WriteData = 32'd12;
  //RegWrite = 0;
  
end
  always
    #50 clk = !clk;
  cpu uut(clk, rst);
 // RegisterFile uut(clk,rst,RegWrite,ReadReg1,ReadReg2,WriteReg, WriteData,ReadData1,ReadData2);

  initial begin
   rst =  1;
   #120
   rst = 0;
  // #30
  // RegWrite = 1;
  // WriteData = 32'd21;
  // #100
  // RegWrite = 0;
   
   
  end
endmodule
