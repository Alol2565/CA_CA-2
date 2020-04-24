`timescale 1ns/1ns
module datapath( input clk ,rst,
                      selreg,regdst,
                      alusrc,
                      memread, memwrite ,regwrite,memtoreg,
                      pcsrc, jal, jr,jmp,
              input [2:0] aluopration,       
              output [5:0] opcode ,opr,
              output zero);
  
  logic [31:0] n31 = 32'd31;
  logic [31:0] n4 = 32'd4;
  logic [31:0] pcin ,pcout,
                inst, regd1, regd2 , wregd,
                alub ,seout, aluout,
                add1out,add2out,
                datamemout,
                shift1out ,shift2out,
                topc1,topc2;
  logic [4:0] wregin;
  logic z;
  
    assign topc1 = pcsrc ? add2out : add1out;
    assign topc2 = jr ? aluout : shift2out;
    assign pcin = jmp ? topc2 : topc1;
    assign shift2out = {add1out[31:28],inst[25:0],2'b00};
    assign shift1out = seout << 2;
    assign alub = alusrc ? seout : regd2;
    assign wregin = selreg? n31 : regdst ? inst[15:11] : inst[20:16];
    assign wregd = jal ? add1out : memtoreg ? datamemout : aluout;
    b32reg PC(pcin,clk, rst, pcout);
    instmem IM(pcout ,clk,rst,inst);
    RegisterFile RF(clk,rst,regwrite, inst[25:21],inst[20:16],wregin, wregd, regd1,regd2);
    alu ALU(regd1 ,alub ,aluopration, aluout ,z);
    datamem DM(aluout, regd2,clk, memread, memwrite, datamemout);
    se16to32 SE(inst[15:0], seout);
    b32adder A1(n4 ,pcout, add1out);
    b32adder A2(add1out,shift1out, add2out);
    
  assign zero = z;
  assign opcode = inst[31:26];
  assign opr =   inst[5:0];

endmodule

