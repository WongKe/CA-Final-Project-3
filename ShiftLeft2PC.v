// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Shift Left 2 module (PC Loop)

// Jump address target is the result of shifting the lower 26 bits of jump instruction
// left by 2 bits. Then concatenating the upper 4 bits of PC+4.
// Result is 32-bit address

`timescale 1ns/1ns

module ShiftLeft2PC(instr, PC4, out);
  
  input [25:0] instr;       // instruction [25-0]
  input [31:0] PC4;         // PC+4 bits 
  output reg [31:0] out;   // output [31-0]
  
  always @ (instr) begin
    // add two zeros to end to shift left 2 bits,
    // then add the upper 4 bits of PC+4
    out = {PC4[31:28], {instr[25:0], 2'b00}}; 
  end
endmodule  
