`timescale 1ns/1ns

module b32reg(input [31:0] in, input clk, rst, output reg [31:0] out);
  always@(posedge clk, posedge rst) begin
    if(rst)
      out = 31'b0;
    else
      out <= in;
  end
endmodule

