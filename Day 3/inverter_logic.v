`timescale 1ns/1ns
`include "inverter_transistor.v"
module inverter_logic (w, a);
input a;
output w;
wire wire1;
inverter_transistor b1 (wire1, a);
inverter_transistor b2 (w, wire1);
endmodule