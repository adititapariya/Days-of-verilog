`timescale 1ns/1ps

module d_ff_tb;

//inputs
reg d;  
reg clk;
reg reset;

//outputs
wire q;

//initiate the uut
d_ff uut (
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
);

//clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    //initialize
    d = 0;  
    reset = 0;
    $dumpfile("d_ff_tb.vcd");
    $dumpvars(0,d_ff_tb);

    //apply vectors
    #10 reset = 1; //applying reset
    #10 reset = 0; //releasing reset
    #10 reset = 1; //applying reset
    #10 reset = 0; //releasing reset
    #10 reset = 1; //applying reset
    #10 reset = 0; //releasing reset
    #10 $finish;
end

initial begin
    //monitor i/o
    $monitor("time=%t \t d=%d \t clk=%d \t reset=%d \t q=%d", $time, d, clk, reset, q);
end
endmodule