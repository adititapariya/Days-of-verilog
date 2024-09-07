`timescale 1ns / 1ps

module alu_tb;

reg [3:0] A,B;
reg [2:0] op;
wire [3:0] result;


//instantiate ALU
alu uut(
    .A(A),
    .B(B),
    .op(op),
    .result(result)
);

//stimulus generation
initial begin
$dumpfile("alu_tb.vcd");
$dumpvars(0,alu_tb);

//Test Case 1
A= 4'b0010;
B= 4'b0001;
op= 3'b000;
#10;
$display("Result of %b + %b = %b", A, B, result);

//Test Case 2
A= 4'b1010;     
B= 4'b1100;
op= 3'b010;
#10;
$display("Result of %b & %b = %b", A, B, result);
$finish;
end

endmodule
