`timescale 1ns/1ns
module RegisterFile(input clk,rst,WinEn,RegWrite, input[1:0] ReadReg1,ReadReg2,WriteReg,WinData, input[15:0] WriteData, output [15:0]ReadData1,ReadData2);
  reg [1:0] winData;
  reg [15:0] Register[0:7];
	always@(posedge clk, posedge rst) begin
    if(rst) begin
      Register[0] <= 16'b0;
      Register[1] <= 16'b0;
      Register[2] <= 16'b0;
      Register[3] <= 16'b0;
      Register[4] <= 16'b0;
      Register[5] <= 16'b0;
      Register[6] <= 16'b0;
      Register[7] <= 16'b0;
      winData <= 2'b0;
    end
    if((WinEn^RegWrite) == 1) begin
      Register[((2*winData)+WriteReg)%8] <= WriteData;
    end
    if(WinEn) begin
      winData = WinData;
    end
  end
  assign ReadData1 = Register[((2*winData)+ReadReg1)%8];
  assign ReadData2 = Register[((2*winData)+ReadReg2)%8];
endmodule