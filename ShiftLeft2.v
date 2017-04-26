// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Shift Left 2 module

`timescale 1ns/1ns

module ShiftLeft2(in, out);
  
  input [31:0] in;       // output of sign-extend
  output reg [31:0] out; // output of shift-left 2
  
  always @ (in) begin
    // ignore first two bits and add two zeros to end
    out = {in[29:0], 2'b00};
  end
endmodule  
