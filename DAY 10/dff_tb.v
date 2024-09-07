`timescale 1ns/1ps

`include "dff.v"

module dff_tb;
reg clk;
reg D;
reg reset;

wire Q;
wire Qbar;

dff d0(
    .clk(clk),
    .D(D),
    .sync_reset(reset),
    .Q(Q),
    .Qbar(Qbar)
);

initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, dff_tb);
    clk=1;
    reset=0;
    D=0;
    #100 $finish;
end

always@(*)
    D=Qbar;

always #10 clk=~clk;
endmodule