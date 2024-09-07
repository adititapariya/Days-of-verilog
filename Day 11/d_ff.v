module d_ff (
    input wire d,
    input wire clk,
    input wire reset,
    output reg q
);

//asynchronous reset

always @(posedge clk or posedge reset) begin
    if(reset) begin
        q <= 1'b0;
    end else begin
        q <= d;
    end    
end
endmodule