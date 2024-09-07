`timescale 1ns/1ns
module MUX_tb();
reg A, B, S;
wire W;
MUX Combckt (W, A, B, S);
initial begin
$dumpfile("combckt_MUX.vcd");
$dumpvars(0, MUX_tb);
$monitor("At time: %t - > [ Sbar = %b] A = %b, B = %b, S = %b & W = %b", $time , Combckt.Sbar, A,B,S, W);
A = 0; B = 1; S = 0;
#2 A = 0; B = 1; S = 1;
#2 A = 1; B = 0; S = 0;
#2 A = 1; B = 0; S = 1;
#2 $finish;
end
endmodule