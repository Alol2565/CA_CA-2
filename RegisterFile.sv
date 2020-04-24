`timescale 1ns/1ns
module RegisterFile(input clk,rst,RegWrite, input[4:0] ReadReg1,ReadReg2,WriteReg, input[31:0] WriteData, output [31:0]ReadData1,ReadData2);
  reg [1:0] winData;
  reg [31:0] Register[0:31];
 integer i;

   initial begin
    Register[0] = 32'b0;
    for (i = 0; i < 32; i = i + 1) begin
       Register[i] = 32'b0;
    end
   end
  
	always@(posedge clk) begin
  //  if(rst) begin
    if(RegWrite) begin
      if(WriteReg != 5'd0) begin
        Register[WriteReg] <= WriteData;
        
      end
    end
  end
  assign ReadData1 = Register[ReadReg1];
  assign ReadData2 = Register[ReadReg2];
endmodule

