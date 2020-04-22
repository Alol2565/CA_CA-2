`timescale 1ns/1ns
module datamem(input[31:0] address, writeData, input clk,memRead, memWrite, output[31:0] readdata);
  reg[31:0] daTa;
  reg [31:0] memoryData[0:1023];
  integer i;
  initial begin
    for (i = 0; i < 1024; i = i + 1) begin
       memoryData[i] <= 32'b0;
      end
  end
  always@(posedge clk)begin
    if(memRead)
      daTa = memoryData[address];
    if(memWrite)
      memoryData[address] = writeData;
  end
  assign readdata = daTa;
endmodule
