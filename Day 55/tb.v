module tb;
  reg clk, rst_n;
  reg d;
  wire q;
  
  D_flipflop dff(clk, rst_n, d, q);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0;
    d = 0;
    
    #3 rst_n = 1;
    
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    rst_n = 0; #3;
    rst_n = 1;
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule