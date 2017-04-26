// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Sign Extend module

module SignExtend(instr, SEout);
  
  input [15:0] instr;       // Instruction [15-0]
  output reg [31:0] SEout; // Sign extend output [31-0]
  
  // extend the MSB
  always @ (instr) begin
    SEout <= $signed(instr);
  end
  
endmodule
