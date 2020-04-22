`timescale 1ns/1ns
module Memory(input clk ,rst ,input[31:0] address, writedata, input memRead, memWrite, output[31:0] readdata);
  reg[15:0] daTa;
  reg [31:0] memoryData[0:1023];
  initial begin
  
  end
  always@(posedge memRead,posedge memWrite)begin
    if(memRead)
      daTa = memoryData[dataAdd];
    if(memWrite)
      memoryData[dataAdd] = writeData;
  end
  assign data = daTa;
  assign instruction = memoryData[instAdd];
endmodule
