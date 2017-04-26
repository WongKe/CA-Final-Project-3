// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// 2-to-1 MUX  (5-bit inputs)

`timescale 1ns / 1ns

module mux2to1_5bit(in0, in1, sel, out);
  
  input [4:0] in0, in1;   // input 1 and 2
  input sel;            // select bit
  output reg [4:0] out; // output
  
  // loop for mux operation
  always @ (in0 or in1 or sel)
    begin
    if (sel == 0)
      out = in0;
    else 
      out = in1;
    end  
endmodule
