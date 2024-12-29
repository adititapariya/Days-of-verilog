module tb_top;
  reg a, b, Bin;
  wire D, Bout;
  
  full_subtractor fs(a, b, Bin, D, Bout);
  
initial begin
  $monitor("At time %0t: a=%b b=%b, Bin=%b, difference=%b, borrow=%b",$time, a,b,Bin,D,Bout);
    a = 0; b = 0; Bin = 0; #1;
    a = 0; b = 0; Bin = 1; #1;
    a = 0; b = 1; Bin = 0; #1;
    a = 0; b = 1; Bin = 1; #1;
    a = 1; b = 0; Bin = 0; #1;
    a = 1; b = 0; Bin = 1; #1;
    a = 1; b = 1; Bin = 0; #1;
    a = 1; b = 1; Bin = 1;
  end
endmodule