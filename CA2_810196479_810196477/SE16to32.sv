`timescale 1ns/1ns

module se16to32(input [15:0] in, output reg [31:0] out);
  
    assign  out = {in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in};

endmodule


