module Fifo_tb;
 // Inputs
 reg clk;
 reg rstn;
 reg pop;
 reg push;
 reg [7:0] din;

 // Outputs
 wire empty;
 wire full;
 wire [7:0] dout;

 // Instantiate the Unit Under Test (UUT)
 Fifo uut (
  .clk(clk), 
  .rstn(rstn), 
  .pop(pop), 
  .push(push), 
  .empty(empty), 
  .full(full), 
  .din(din), 
  .dout(dout)
 );

 always #5 clk = ~clk;
 
 task reset();
 begin
 clk = 1'b1;
 rstn = 1'b0;
 pop = 1'b0;
 push = 1'b0;
 din = 8'd0;
 #30; rstn = 1'b1;
 end
 endtask

 task read_fifo();
 begin
 pop = 1'b1;
 #10;
 pop = 1'b0;
 end
 endtask
   
 task write_fifo([7:0]din_tb);
 begin
 push = 1'b1;
 din = din_tb;
 #10 push = 1'b0;
 end
 endtask
 
 // Main code
 initial
 begin
 reset();
 #10;
 repeat(2)
 begin
 write_fifo(8'h11);
 #10;
 write_fifo(8'h22);
 #10;
 write_fifo(8'h33);
 #10;
 write_fifo(8'h44);
 #10;
 end
 #10;
 repeat(2)
 begin
 read_fifo();
 #10;
 end
 #10;
 $finish;
 end
      
endmodule