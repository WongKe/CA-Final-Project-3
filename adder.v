// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// 32-bit adder

module Adder(in0, in1, out);
  input [31:0] in0, in1;
  output reg [31:0] out;
  
  always @ (in0 or in1) begin
    out = in0 + in1;
  end
  
endmodule
