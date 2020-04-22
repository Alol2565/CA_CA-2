`timescale 1ns/1ns
module tb();
  
  reg rst,clk;
  initial clk = 0;
  always
    #50 clk = !clk;
  cpu uut( clk ,rst);
  initial begin
   rst =  1;
   #200
   rst = 0;
  end
endmodule
