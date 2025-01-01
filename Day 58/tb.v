module tb;
  reg clk, rst_n;
  reg j, k;
  reg up;
  wire [3:0] q, q_bar;
  asynchronous_counter(clk, rst_n, j, k, up, q, q_bar);
  
  initial begin
    clk = 0; rst_n = 0; 
    up = 1;
    #4; rst_n = 1;
    j = 1; k = 1;
    #80;
    rst_n = 0;
    #4; rst_n = 1; up = 0;
    #50;
    $finish;
  end
  always #2 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule