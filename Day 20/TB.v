module TB;
  reg [2:0] D;
  wire [7:0] y;
  
  binary_decoder bin_dec(D, y);
  
  initial begin
    $monitor("D = %b -> y = %0b", D, y);
    repeat(5) begin
      D=$random; #1;
    end
  end
endmodule