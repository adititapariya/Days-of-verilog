module clock_tb;
    reg clk;
    wire clk1;

    clock lt(
    .clk(clk),
    .clk1(clk1)
    );

    initial begin 
    clk=0; 
    end

    always #10000 clk = ~clk;
    
endmodule