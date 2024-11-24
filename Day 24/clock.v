module clock(clk,clk1);
    input clk;
    output reg clk1;
    integer i, count;

    initial begin i=0;count=5000; end

    always @(posedge clk)
    begin i=i+1;
    if (i<count/2) begin
    clk1=1; end
    else begin
    clk1=0; end
    if (i>count) begin
    i=0; end
    end
    
endmodule