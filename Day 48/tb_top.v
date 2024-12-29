module tb_top;
  reg a, b;
  wire D, B;
  
  half_subtractor hs(a, b, D, B);
  
  initial begin
    $monitor("At time %0t: a=%b b=%b, difference=%b, borrow=%b",$time, a,b,D,B);
    a = 0; b = 0;
    #1;
    a = 0; b = 1;
    #1;
    a = 1; b = 0;
    #1;
    a = 1; b = 1;
  end
endmodule