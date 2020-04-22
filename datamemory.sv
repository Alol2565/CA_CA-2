`timescale 1ns/1ns
module datamem(input[31:0] address, writeData, input clk,memRead, memWrite, output[31:0] readdata);
  reg[31:0] daTa;
  reg [31:0] memoryData[0:16383];
   initial
  begin
   $readmemh ("mem.data", memoryData);
  end
  always@(posedge memRead,posedge memWrite )begin
    if(memRead)
      daTa = memoryData[address << 2];
    if(memWrite)
      memoryData[address << 2] = writeData;
  end
  assign readdata = daTa;
endmodule
