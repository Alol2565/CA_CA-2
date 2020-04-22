`timescale 1ns/1ns
module Memory(input[31:0] address, input clk,rst, output[31:0] inst);
  reg[31:0] daTa;
  reg [31:0] memoryData[0:1023];
  initial
  begin
   $readmemh ("inst.data", memoryData);
  end
  always@(posedge clk ,posedge rst)begin
      daTa = memoryData[address];
  end
  assign inst = daTa;
endmodule

