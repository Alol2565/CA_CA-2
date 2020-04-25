`timescale 1ns/1ns
module cpu( input clk ,rst);
                      
                      
        wire selreg,regdst,
              alusrc,
              memread, memwrite ,regwrite,memtoreg,
                      pcsrc, jal, jr,jmp,
                      zero;
        wire [1:0] toaluctrl    ;       
        wire [2:0] aluopration;       
        wire [5:0] opcode ,opr;  
              
datapath DP( clk ,rst,selreg,regdst,alusrc,memread, memwrite ,regwrite,memtoreg,pcsrc, jal, jr,jmp,aluopration,opcode ,opr,zero);
controller CU(opcode,opr,zero, selreg,regdst,alusrc,memread, memwrite ,regwrite,memtoreg,pcsrc, jal, jr,jmp,toaluctrl );
aluctrl ALUCU(opr,toaluctrl, aluopration );          
endmodule