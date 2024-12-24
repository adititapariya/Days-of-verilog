module tb;
  reg clk, rst_n;
  reg t;
  wire q, q_bar;
  
  T_flipflop dff(clk, rst_n, t, q, q_bar);
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);
    #3 rst_n = 1;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);
    
    drive(0); // Same as previous output
    drive(1); // Toggles previous output
    drive(1); // Toggles previous output
    drive(1); // Toggles previous output
    drive(0); // Same as previous output
    #5;
    $finish;
  end
  
  task drive(bit ip);
    @(posedge clk);
    t = ip;
    #1 $display("t=%b --> q=%b, q_bar=%b",t, q, q_bar);
  endtask
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule