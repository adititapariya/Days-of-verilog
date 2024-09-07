`timescale 1ns/1ns
`include "MUX.v"
module datapath (OutBus, ABus, SelB, LoadAC, AddAlu, clock);
input [3:0] ABus;
input SelB, LoadAC, AddAlu, clock;
output [3:0] OutBus;
wire [3:0] BBus;
wire [3:0] AC_w;
reg [3:0] AC;
reg [3:0] Add;
MUX m0 (AC_w[0], ABus[0], BBus[0], SelB);
MUX m1 (AC_w[1], ABus[1], BBus[1], SelB);
MUX m2 (AC_w[2], ABus[2], BBus[2], SelB);
MUX m3 (AC_w[3], ABus[3], BBus[3], SelB);
always@(posedge clock) begin
if(LoadAC)
AC <= AC_w;
end
assign OutBus = AC;
assign BBus = ABus + AC;
endmodule