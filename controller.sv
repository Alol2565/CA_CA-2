`timescale 1ns/1ns
module controller(
          input [5:0] opcode,opr,
          input zero, 
          output reg selreg,regdst,
                 alusrc,
                 memread, memwrite ,regwrite,memtoreg,
                 pcsrc, jal, jr,jmp,
          output reg[1:0] toaluctrl );
    
          
    always@(*)begin
      case(opcode)
        6'b000000:begin //rtype
          regdst = 1 ;selreg = 0; regwrite = 1; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b00 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = 0; 
          end
        6'b001000:begin //addi
          regdst = 0 ;selreg = 0; regwrite = 1; alusrc = 1;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = 0; 
          end  
        6'b001100:begin //andi
          regdst = 0 ;selreg = 0; regwrite = 1; alusrc = 1;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b11 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = 0; 
          end
        6'b100011:begin //lw
          regdst = 0 ;selreg = 0; regwrite = 1; alusrc = 1;memread = 1 ;memwrite =0;jal =0;toaluctrl = 2'b01 ; memtoreg = 1; jmp = 0; jr = 0; pcsrc = 0; 
          end
        6'b101011:begin //sw
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 1;memread = 0 ;memwrite =1;jal =0;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = 0; 
          end
        6'b000100:begin //beq
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b10 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = zero; 
          end
        6'b000101:begin //bne
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b10 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = ~zero; 
          end
        6'b000010:begin //j
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 1; jr = 0; pcsrc = 0; 
          end 
        6'b000011:begin //jal
          regdst = 0 ;selreg = 1; regwrite = 1; alusrc = 0;memread = 0 ;memwrite =0;jal =1;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 1; jr = 0; pcsrc = 0; 
          end
        6'b000001:begin //jr
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 1; jr = 1; pcsrc = 0; 
          end
        default:begin //default
          regdst = 0 ;selreg = 0; regwrite = 0; alusrc = 0;memread = 0 ;memwrite =0;jal =0;toaluctrl = 2'b01 ; memtoreg = 0; jmp = 0; jr = 0; pcsrc = 0; 
          end  
      endcase
    end 
endmodule
