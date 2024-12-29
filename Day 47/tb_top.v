module tb_top;
  reg a, b, c;
  wire s, c_out;
  
  full_adder fa(a, b, c, s, c_out);
  
  initial begin
    $monitor("At time %0t: a=%b b=%b, cin=%b, sum=%b, carry=%b",$time, a,b,c,s,c_out);
    a = 0; b = 0; c = 0; #1;
    a = 0; b = 0; c = 1; #1;
    a = 0; b = 1; c = 0; #1;
    a = 0; b = 1; c = 1; #1;
    a = 1; b = 0; c = 0; #1;
    a = 1; b = 0; c = 1; #1;
    a = 1; b = 1; c = 0; #1;
    a = 1; b = 1; c = 1;
  end
endmodule