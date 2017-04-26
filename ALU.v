// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

//  This module serves as the ALU. Supports the following MIPS instructions:
//  add, addi, beq, j, lw and sw. Inputs: 4-bit control signal, two 32-bit data inputs.
//  Outputs: 32-bit ALUresult and 1 bit Zero. 

`timescale 1ns / 1ns

module ALU(ALUctrlop, in0, in1, ALUresult, Zero);
  
 input [3:0] ALUctrlop;
 input [31:0] in0, in1;
  output reg [31:0] ALUresult;
  output Zero;
  
  // set zero 
  assign Zero = (ALUresult == '0);
  
  // generate ALU result
 always @ (in0 or in1 or ALUctrlop) 
 begin
  case (ALUctrlop)
      4'b0000: ALUresult = in0 & in1;  // and
      
      4'b0001: ALUresult = in0 | in1;  // or
      
      4'b0010: ALUresult = in0 + in1;  // add
      
      4'b0110: ALUresult = in0 - in1;  // sub
      
      4'b0111: ALUresult = in0 < in1 ? 1 : 0;  // slt
      
      4'b1000: ALUresult = ~(in0 | in1);  // nor
      default: ALUresult = 0;
    endcase
  end
  
endmodule
