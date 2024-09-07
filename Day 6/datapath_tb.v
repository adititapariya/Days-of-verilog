`timescale 1ns/1ns
module datapath_tb();
reg [3:0] ABus ;
reg SelB, LoadAC, AddAlu, clock;
wire [3:0] OutBus;
datapath dp (OutBus, ABus, SelB, LoadAC, AddAlu, clock);
initial clock = 0;
always #4 clock = ~clock;
initial begin
$dumpfile("Dpath.vcd");
$dumpvars(0, datapath_tb);
$monitor("at time:%t -> ABus = %b, SelB = %b AC_w = %b | AC = %b & OutBus = %b | BBus = %b", $time , ABus, SelB, dp.AC_w, dp.AC, OutBus, dp.BBus);
LoadAC = 1;
AddAlu = 1;
ABus = 4'hf; SelB = 0;
#5
SelB = 1;
ABus = 4'h6;
#8
$finish;
end
endmodule