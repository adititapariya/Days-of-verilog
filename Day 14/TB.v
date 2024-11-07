module TB;
  reg [3:0] binary, gray;
  b2g_converter b2g(binary, gray);
  
  initial begin
    $monitor("Binary = %b --> Gray = %b", binary, gray);
    binary = 4'b1011; #1;
    binary = 4'b0111; #1;
    binary = 4'b0101; #1;
    binary = 4'b1100; #1;
    binary = 4'b1111;
  end
endmodule