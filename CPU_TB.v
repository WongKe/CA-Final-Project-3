// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// CPU TestBench

`timescale 1ns / 1ns

module cpu_tb;
  
  reg clk;  // input: clock
  reg rst, rstPC;  // input: reset
  
  integer numCycles, numInstr;
  
  // instantiate DUT (device under test)
  CPU DUT(clk, rst, rstPC);
  
  initial begin
    $timeformat(-9, 1, " ns", 6);
    
    clk = 1'b0;
    
    numCycles = 0;
    numInstr = 0;
    
    rst = 1;
    rstPC = 1;
    
    #10 rst = 0;
    rstPC = 0;
  end
  
  
  // generate a clock pulse
  always #10 clk = ~clk;
  
  always @ (posedge clk) begin
    if (!rst)
      numCycles = numCycles + 1;
      numInstr = numInstr + 1;
  end
  
  // display data
  always #2000 $display("Total # of cycles: %d \n", numCycles);
  always #2000 $display("Total # of instructions: %d \n", numInstr);
  always #2000 $display("CPI: %d \n", numCycles/numInstr);
  
  always #2000 $display("Register file contents: \n");
  always #2000 $display("R0: %h R1: %h \n", DUT.Registers.register[0], DUT.Registers.register[1]);
  always #2000 $display("R2: %h R3: %h \n", DUT.Registers.register[2], DUT.Registers.register[3]);
  always #2000 $display("R4: %h R5: %h \n", DUT.Registers.register[4], DUT.Registers.register[5]);
  always #2000 $display("R6: %h R7: %h \n", DUT.Registers.register[6], DUT.Registers.register[7]);
  always #2000 $display("R8: %h R9: %h \n", DUT.Registers.register[8], DUT.Registers.register[9]);
  always #2000 $display("R10: %h R11: %h \n", DUT.Registers.register[10], DUT.Registers.register[11]);
  always #2000 $display("R12: %h R13: %h \n", DUT.Registers.register[12], DUT.Registers.register[13]);
  always #2000 $display("R14: %h R15: %h \n", DUT.Registers.register[14], DUT.Registers.register[15]);
  always #2000 $display("R16: %h R17: %h \n", DUT.Registers.register[16], DUT.Registers.register[17]);
  always #2000 $display("R18: %h R19: %h \n", DUT.Registers.register[18], DUT.Registers.register[19]);
  always #2000 $display("R20: %h R21: %h \n", DUT.Registers.register[20], DUT.Registers.register[21]);
  always #2000 $display("R22: %h R23: %h \n", DUT.Registers.register[22], DUT.Registers.register[23]);
  always #2000 $display("R24: %h R25: %h \n", DUT.Registers.register[24], DUT.Registers.register[25]);
  always #2000 $display("R26: %h R27: %h \n", DUT.Registers.register[26], DUT.Registers.register[27]);
  always #2000 $display("R28: %h R29: %h \n", DUT.Registers.register[28], DUT.Registers.register[29]);
  always #2000 $display("R30: %h R31: %h \n", DUT.Registers.register[30], DUT.Registers.register[31]);
    
endmodule
