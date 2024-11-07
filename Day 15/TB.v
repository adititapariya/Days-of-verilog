module TB;
  reg [3:0] binary, gray;
  g2b_converter g2b(gray, binary);
  
  initial begin
    $monitor("Gray = %b --> Binary = %b", gray, binary);
    gray = 4'b1110; #1;
    gray = 4'b0100; #1;
    gray = 4'b0111; #1;
    gray = 4'b1010; #1;
    gray = 4'b1000;
  end
endmodule