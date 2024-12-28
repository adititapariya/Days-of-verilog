module sd1010_moore(input bit clk,
                   input logic reset,
                   input logic din,
                   output logic dout);

  typedef enum logic [2:0] {S0, S1, S2, S3, S4} state_t;
  state_t state;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dout <= 1'b0;
      state <= S0;
    end
    else begin
      case(state)
        S0: begin
          dout <=1'b0;
          if(din)
            state <= S1;
        end
        S1: begin
          dout <= 1'b0;
          if(~din)
            state <= S2;
        end
        S2: begin
          dout <= 1'b0;
          if(din)
            state <= S3;
          else
            state <= S0;
        end
        S3: begin
          dout <= 1'b0;
          if(din)
            state <= S1;
          else
            state <= S4;
        end
        S4: begin
          dout <= 1'b1;
          if(din)
            state <= S1;
          else
            state <= S0;
        end
      endcase
    end
  end


endmodule