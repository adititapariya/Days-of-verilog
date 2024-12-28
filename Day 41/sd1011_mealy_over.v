module sd1011_mealy_over(input bit clk,
                   input logic reset,
                   input logic din,
                   output logic dout);

  typedef enum logic [1:0] {S0, S1, S2, S3} state_t;
  state_t state;

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dout <= 1'b0;
      state <= S0;
    end
    else begin
      case(state)
        S0: begin
          if(din) begin
            state <= S1;
            dout <=1'b0;
          end
          else
            dout <=1'b0;
        end
        S1: begin
          if(~din) begin
            state <= S2;
            dout <=1'b0;
          end
          else begin
            dout <=1'b0;
          end
        end
        S2: begin
          if(~din) begin
            state <= S0;
            dout <=1'b0;
          end
          else begin
            state <= S3;
            dout <=1'b0;
          end
        end
        S3: begin
          if(din) begin
            state <= S1;
            dout <=1'b1;
          end
          else begin
            state <= S2;
            dout <=1'b0;
          end
        end
      endcase
    end
  end

endmodule