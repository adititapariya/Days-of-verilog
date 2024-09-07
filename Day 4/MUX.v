`timescale 1ns/1ns
`include "inverter_transistor.v"
module MUX(W, A, B, S);
input A, B, S;
output W;
wire Sbar, AandSbar, BandS;
inverter_transistor Sb (Sbar, S);
and a1 (AandSbar, Sbar, A);
and a2 (BandS, S, B);
or o1 (W, AandSbar, BandS);
endmodule