module sync_fifo(
 clk,
 rstn,
 pop,
 push,
 empty,
 full,
 din,
 dout
    );

parameter PTR_WIDTH = 3;
parameter DATA_WIDTH = 8;
parameter DEPTH = 8;

input clk;
input rstn;
input pop;
input push;
input [DATA_WIDTH-1:0]din;

output [DATA_WIDTH-1:0]dout;
output empty;
output full;

reg [DATA_WIDTH-1:0]fifo[DEPTH-1:0];
reg [PTR_WIDTH-1:0]rdptr, next_rdptr;
reg [PTR_WIDTH-1:0]wrptr, next_wrptr;
reg [DATA_WIDTH-1:0]dout, next_dout;
reg empty, next_empty;
reg full, next_full;

assign fullchk = push && !(|(wrptr^(rdptr-1'b1)));
assign emptychk = pop && !(|(rdptr^(wrptr-1'b1)));

always @ (posedge clk) //Sequential block
begin
  if(!rstn)
  begin
    dout    <= 8'd0;
    empty   <= 1'b1;
    full    <= 1'b0;
    rdptr   <= 1'b0;
    wrptr   <= 1'b0;
  end
  else
  begin
    dout    <= next_dout;
    empty   <= next_empty;
    full    <= next_full; 
    rdptr   <= next_rdptr;
    wrptr   <= next_wrptr;
  end
end

always @ (*) //Combinational Block
begin
  next_dout    = dout;
  next_empty   = emptychk ? 1'b1 : push ? 1'b0 : empty;
  next_full    = fullchk ? 1'b1 : pop ? 1'b0 : full;
  next_rdptr   = rdptr;
  next_wrptr   = wrptr;
 
  if(push)  //write
  begin
  fifo[wrptr] = din;
  next_wrptr  = wrptr+1;
  end
  else if(pop)  //read
  begin
  next_dout    = fifo[rdptr];
  next_rdptr   = rdptr+1;
  end
  else
  begin
  next_dout  = dout;
  next_rdptr = rdptr;
  next_wrptr = wrptr;
  end 
end
endmodule