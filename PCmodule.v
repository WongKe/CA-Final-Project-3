// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Program Counter file

module PCmodule(in, clk, rstPC, out);
  
  input [31:0] in;
  input clk, rstPC;
  output reg [31:0] out;
  
  // handle output and reset case
  always @ (posedge clk or posedge rstPC) begin
    if (rstPC)
      out <= 12288;
    else
      out <= in;
  end
  
endmodule
