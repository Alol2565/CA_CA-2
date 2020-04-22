`timescale 1ns/1ns
module Memory(input[9:0] instAdd, dataAdd, input[15:0] writeData, input memRead, memWrite, output[15:0] instruction, data);
  reg[15:0] daTa;
  reg [15:0] memoryData[0:1023];
  initial begin
    memoryData[0] = 16'b1100010100010001;
    memoryData[1] = 16'b0001010111110100;
    memoryData[2] = 16'b0000000111110100;
    memoryData[3] = 16'b1000000000000010;
    memoryData[4] = 16'b0001000111111110;
    memoryData[5] = 16'b0010110000000111;
    memoryData[6] = 16'b0000000111110100;
    memoryData[7] = 16'b1100101000010001;
    memoryData[8] = 16'b0100100100001010;
    memoryData[9] = 16'b0000000111110100;
    memoryData[10] = 16'b1000110000000010;
    memoryData[11] = 16'b1000011110000001;
    memoryData[12] = 16'b1100010100000011;
    memoryData[13] = 16'b1100101000010100;
    memoryData[14] = 16'b1101101000001101;
    memoryData[15] = 16'b1000011000001000;
    memoryData[16] = 16'b1000100100000100;
    memoryData[17] = 16'b1101010100000010;
    memoryData[18] = 16'b1110010100010010;
    memoryData[19] = 16'b1111010100011000;
    memoryData[20] = 16'b0001010111110100;
    memoryData[21] = 16'b1000110100000010;
    memoryData[22] = 16'b1000100110000010;
    memoryData[23] = 16'b1100100100000000;
    memoryData[24] = 16'b1000101110000011;
    memoryData[25] = 16'b1000110000000010;
  end
  always@(posedge memRead,posedge memWrite)begin
    if(memRead)
      daTa = memoryData[dataAdd];
    if(memWrite)
      memoryData[dataAdd] = writeData;
  end
  assign data = daTa;
  assign instruction = memoryData[instAdd];
endmodule