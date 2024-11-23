module universal_shift_reg(
  input clk, rst_n, 
  input [1:0] select, // select operation
  input [3:0] p_din,  // parallel data in 
  input s_left_din,   // serial left data in
  input s_right_din,  // serial right data in
  output reg [3:0] p_dout, //parallel data out
  output s_left_dout, // serial left data out
  output s_right_dout // serial right data out
);
  always@(posedge clk) begin
    if(!rst_n) p_dout <= 0;
    else begin
      case(select)
        2'h1: p_dout <= {s_right_din,p_dout[3:1]}; // Right Shift
        2'h2: p_dout <= {p_dout[2:0],s_left_din};  // Left Shift
        2'h3: p_dout <= p_din; // Parallel in - Parallel out
        default: p_dout <= p_dout; // Do nothing
      endcase
    end
  end
  assign s_left_dout = p_dout[0];
  assign s_right_dout = p_dout[3];
endmodule