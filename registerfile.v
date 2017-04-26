// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// A register file consisting of 32 32-bit registers

`timescale 1ns / 1ns

module RegisterFile(readReg1, readReg2, writeReg, writeData, 
                    enable, clk, rst, readData1, readData2);
  
  input [4:0] readReg1, readReg2, writeReg;
  input [31:0] writeData;
  input enable, clk, rst;
  output reg[31:0] readData1, readData2;
  
  reg [31:0] register[31:0];
  
  // set registers to zero on reset
  always @ (posedge rst) begin
    register [0] = 0;
    register [1] = 0;
    register [2] = 0;
    register [3] = 0;
    register [4] = 0;
    register [5] = 0;
    register [6] = 0;
    register [7] = 0;
    register [8] = 0;
    register [9] = 0;
    register [10] = 0;
    register [11] = 0;
    register [12] = 0;
    register [13] = 0;
    register [14] = 0;
    register [15] = 0;
    register [16] = 0;
    register [17] = 0;
    register [18] = 0;
    register [19] = 0;
    register [20] = 0;
    register [21] = 0;
    register [22] = 0;
    register [23] = 0;
    register [24] = 0;
    register [25] = 0;
    register [26] = 0;
    register [27] = 0;
    register [28] = 0;
    register [29] = 0;
    register [30] = 0;
    register [31] = 0;
  end
  
  // handle register data
  always @ (readReg1 or readReg2) begin
    readData1 <= register[readReg1];
    readData2 <= register[readReg2];
  end
  
  // write back
  always @ (posedge clk) begin 
    // on enable, write data in register    
    if (enable && (writeReg != 0))
      register[writeReg] <= writeData;
  end
   
endmodule
