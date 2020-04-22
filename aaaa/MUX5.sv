`timescale 1ns/1ns
module Mux32(output	[4:0]	y,input [4:0]i0,i1,input sel);
	reg	[4:0]	out; 	
assign	y = out;	
always @({sel,i0,i1})	begin
	if (sel == 0) out = i0;
	if (sel == 1) out = i1;
	end
endmodule
