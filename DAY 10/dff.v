module dff(
    input D,
    input clk,
    input sync_reset,
    output reg Q,
    output reg Qbar
);

//synchronous flip flops

wire Qbarwire;

not not1(Qbarwire, Qbar);

always @(posedge clk) 
    begin
    if (sync_reset) 
        Q <= 1'b0;
     else
        Q <= D;
    end

always @(*)
    Qbar = Qbarwire;

endmodule