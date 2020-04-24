`timescale 1ns/1ns
module instmem(input[31:0] address, input clk,rst, output[31:0] inst);
  reg[31:0] daTa;
  reg [31:0] memoryData[0:16383];
  initial
  begin
   $readmemb ("inst.data", memoryData);
  end
  assign inst = memoryData[address >> 2];
endmodule