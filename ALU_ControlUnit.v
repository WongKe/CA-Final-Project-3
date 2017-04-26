// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// The small ALU control unit that takes the ALUop and 6-bit function code in and 
// generates 4-bit ALUctrlop signal for the ALU.

// Taken from Figure 4.13 (Pg. 318) 

`timescale 1ns / 1ns

module ALU_ControlUnit(ALUop, addi, func, ALUctrlop);
  
  input [1:0] ALUop;
  input addi;
  input [5:0] func;
  output reg [3:0] ALUctrlop;
  
  // initialize
  initial begin
    ALUctrlop = 4'b0000;
  end
  
  always @ (ALUop or func)
  begin
    
    case (ALUop)
      
      2'b00:  ALUctrlop = 4'b0010;  // lw & sw (add)
      
      2'b01:  ALUctrlop = 4'b0110;  // beq (sub)
      
      // ALUOp1 == 1
      2'b10: 
      begin
        // allow for addi
        case (addi)
          1'b1:  ALUctrlop = 4'b0010;
          
          1'b0: 
	  begin
            case (func[3:0]) // func[5:4] is don't care
              4'b0000:  ALUctrlop = 4'b0010;  // add
              
              4'b0010:  ALUctrlop = 4'b0110;  // sub
              
              4'b0100:  ALUctrlop = 4'b0000;  // and
              
              4'b0101:  ALUctrlop = 4'b0001;  // or
              
              4'b1010:  ALUctrlop = 4'b0111;  // slt
            endcase
          end
        endcase
      end
      
      // handle alternate don't care cases
      2'b11: 
      begin
        case (func[3:0]) // func[5:4] is don't care
          
          4'b0010:  ALUctrlop = 4'b0110;  // sub
          
          4'b1010:  ALUctrlop = 4'b0111;  // slt
        endcase
      end
    endcase
  end
  
endmodule
            
      
