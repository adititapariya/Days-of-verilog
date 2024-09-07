`timescale 1ns/1ps

module counter_tb;

//Declare signals
reg clk;
reg reset;
wire [3:0] cout;

//instantiate the uut
counter uut(
    .clk(clk),
    .reset(reset),
    .cout(cout)
);

//generate clock signals
initial begin
    clk=0;
    forever #5 clk=~clk;
end

//test sequence
initial begin

    $dumpfile("counter_tb.vcd");
    $dumpvars(0,counter_tb);
    reset = 1;
    #10;

    reset =0;
    #100;

    reset=1;
    #50;
    $finish;
end

endmodule