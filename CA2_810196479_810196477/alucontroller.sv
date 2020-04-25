`timescale 1ns/1ns

module aluctrl(input [5:0] opr,input [1:0] fctrl, output reg [2:0] func );
    reg[2 : 0] f;
    always@(*)begin
     case(fctrl)
      2'b00: begin
              case(opr)
                6'b100000: f = 3'b000;
                6'b100010: f = 3'b001;
                6'b100100: f = 3'b010;
                6'b100101: f = 3'b011;
                6'b101010: f = 3'b101;
              endcase
           end
      2'b01: f = 3'b000;
      2'b10: f = 3'b001;
      2'b11: f = 3'b010;
      default: f = 3'b000;
    endcase 
    end
  assign func = f;
endmodule





