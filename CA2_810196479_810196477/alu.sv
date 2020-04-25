`timescale 1ns/1ns

module alu(input [31:0] a,b , input [2:0] aluopration, output reg [31:0] out ,output zero);
    reg[31:0] res;
    always@(*)begin
    case(aluopration)
      3'b000: res = a + b;
      3'b001: res = a - b;
      3'b010: res = a & b;
      3'b011: res = a | b;
      3'b101: res = (a < b)? 32'd1 : 32'd0 ;
      default: res = 32'd0;
    endcase 
    end
  assign zero = (out == 32'd0) ? 1'b1 : 1'b0;
  assign out = res;
endmodule



