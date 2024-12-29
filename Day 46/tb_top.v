module tb_top;
  reg a, b;
  wire s, c_out;
  
  half_adder ha(a, b, s, c_out);
  
  initial begin
    $monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b",$time, a,b,s,c_out);
    a = 0; b = 0;
    #1;
    a = 0; b = 1;
    #1;
    a = 1; b = 0;
    #1;
    a = 1; b = 1;
  end
endmodule