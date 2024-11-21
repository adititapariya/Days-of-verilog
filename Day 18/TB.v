module TB;
  reg [7:0] D;
  wire [2:0] y;
  int i;
  
  binary_encoder bin_enc(D, y);
  
  initial begin
    D=8'b1; #1;
    for(i=0; i<8; i++) begin
      $display("D = %h(in dec:%0d) -> y = %0h", D, i, y);
      D=D<<1; #1;
    end
  end
endmodule