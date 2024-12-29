module D_flipflop (
  input clk, rst_n,
  input d,
  output reg q
  );
  
  always@(posedge clk) begin
    if(!rst_n) q <= 0;
    else       q <= d;
  end
  
endmodule