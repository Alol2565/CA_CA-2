`timescale 1ns/1ns
module datamem(input[31:0] address, writeData,input clk, memRead, memWrite, output reg [31:0] readdata);
  reg[31:0] daTa,addr;
  assign addr =  address >> 2;
  reg [31:0] memoryData[0:16383];
   initial
  begin
   $readmemb ("mem.data", memoryData);
   daTa = 32'd0;
  end
  //assign readdata = memRead ? memoryData[addr] : readdata;
  //assign memoryData[addr] = memWrite ? writeData : memoryData[addr];
  always@(negedge clk)begin
    
    if(memRead)
        daTa = memoryData[addr];
    if(memWrite)
        memoryData[addr] = writeData;
    end
    assign readdata = daTa;
endmodule
