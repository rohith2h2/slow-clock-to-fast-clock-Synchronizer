`timescale 1ns / 1ps

module tb;
  reg clk_fast;
  reg rd_en;
  reg rstn;
  wire rd_en_s2f;
  
  synchronizer uut (
    .clk_fast(clk_fast),
    .rd_en(rd_en),
    .rstn(rstn),
    .rd_en_s2f(rd_en_s2f)
  );
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);
  end
    
  initial begin
    clk_fast = 0;
    forever #5 clk_fast = ~clk_fast; 
  end
    
  initial begin
    rstn = 0;
    rd_en = 0;
    #10;
    rstn = 1; 
    #10;
    rd_en = 0;
    #100; 
    rd_en = 1;
    #20; 
    rd_en = 0;
    #40; 
    #100;
    $finish; 
  end

endmodule
