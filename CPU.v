// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// cpu module

`timescale 1ns/1ns

module CPU(clk, rst, rstPC);
  input clk;
  input rst, rstPC;  
  
  // Wires
  wire [31:0] PCinput, PCoutput, PC4, Jadd, PCmux1out;
  wire [31:0] Instruction;
  wire [31:0] Reg_read_data1, Reg_read_data2, Reg_Write_Data;
  wire [31:0] mux1out, ALUresult, Mem_read_data;
  wire [31:0] SEout, SL2out, PCaddOut;
  wire [25:0] SL2input;
  wire [15:0] SEin;
  wire [5:0] ctrlInput, ALUctrl;
  wire [4:0] Reg_Write_reg, ReadReg1, ReadReg2, WrRegMuxIn;
  wire [3:0] ALUctrlop;
  wire Zero;
  
  // Control Signals
  wire RegDst;
  wire Jump;
  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire [1:0] ALUop;
  wire MemWrite;
  wire ALUsrc;
  wire RegWrite;
  wire addi;
  wire HLT;
  
  // Decode Instruction
  assign SL2input = Instruction[25:0];
  assign ctrlInput = Instruction[31:26];
  assign ReadReg1 = Instruction[25:21];
  assign ReadReg2 = Instruction[20:16];
  assign WrRegMuxIn = Instruction[15:11];
  assign SEin = Instruction[15:0];
  assign ALUctrl = Instruction[5:0];
  
  assign PCmux1sel = Branch & Zero;
  
  // Connect Modules
  PCmodule PC(PCinput, clk, rstPC, PCoutput);
  Add4 add4(PCoutput, PC4);
  ShiftLeft2PC SL2PC(SL2input, PC4, Jadd);
  mux2to1 PCMux1(PC4, PCaddOut, PCmux1sel, PCmux1out);
  mux2to1 PCMux2(PCmux1out, Jadd, Jump, PCinput);
  ControlUnit CtrlU(ctrlInput, rst, RegDst, Jump, Branch, MemRead, MemtoReg, 
                     MemWrite, ALUsrc, RegWrite, ALUop, addi, HLT);
  SignExtend SE(SEin, SEout);
  ShiftLeft2 SL2(SEout, SL2out);
  mux2to1_5bit MX0(ReadReg2, WrRegMuxIn, RegDst, Reg_Write_reg);
  RegisterFile Registers(ReadReg1, ReadReg2, Reg_Write_reg, Reg_Write_Data, 
                         RegWrite, clk, rst, Reg_read_data1, Reg_read_data2);
  ALU_ControlUnit ALUctrlU(ALUop, addi, ALUctrl, ALUctrlop);
  mux2to1 MX1(Reg_read_data2, SEout, ALUsrc, mux1out);
  ALU alu(ALUctrlop, Reg_read_data1, mux1out, ALUresult, Zero);
  Adder add(PC4, SL2out, PCaddOut);
  Memory MEM(PCoutput, Instruction, ALUresult, Reg_read_data2,
             MemRead, MemWrite, Mem_read_data);
  mux2to1 MX2(ALUresult, Mem_read_data, MemtoReg, Reg_Write_Data);
  
endmodule
