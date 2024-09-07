`timescale 1ns/1ns

module inverter_transistor_tb();
reg a_ip;
wire w_op;
inverter_transistor cut (w_op, a_ip);
initial begin
$dumpfile("trans.vcd");
$dumpvars(0, inverter_transistor_tb);
$monitor("at time: %t - > a = %b & w = %b", $time , a_ip, w_op);
a_ip = 0;
#3
a_ip = 1;
#1
$finish;
end
endmodule
