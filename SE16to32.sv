`timescale 1ns/1ns

module se16to32(input [15:0] in, input clk, output reg [31:0] out);
  always@(posedge clk) begin
      out <= {in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in};
  end
endmodule


