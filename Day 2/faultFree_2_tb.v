`timescale 1ns/1ns

module faultFree_2_tb();
  
  reg A,B,C,D,  G0,E0,J1;
  wire K;
 
  reg G0_fault = 0, E0_fault = 0, J1_fault = 1;
  reg G0_ff = 1, E0_ff = 1, J1_ff = 0;
  
  reg [3:0] word;
 
 faultFree_2 ff (K, A,B,C,D,  G0,E0,J1);
 
 
initial begin
    //fault free simulation  ----------------	
	G0 = G0_ff;
	E0 = E0_ff;
	J1 = J1_ff;
	{A,B,C,D} = {1'b1,1'b1,1'b1,1'b0};
    #1;
	word[3] = K; #1;
	$display("word = %4b", word);
	
	//"E" stuck at "0"
	G0 = G0_ff;
	E0 = E0_fault;
	J1 = J1_ff;
	{A,B,C,D} = {1'b1,1'b1,1'b1,1'b0};
    #1;
	word[2] = K; #1;
	$display("word = %4b", word);
	
	//"G" stuck at "0"
	G0 = G0_fault;
	E0 = E0_ff;
	J1 = J1_ff;
	{A,B,C,D} = {1'b1,1'b1,1'b1,1'b0};
    #1;
	word[1] = K; #1;
	$display("word = %4b", word);
	
	//"J" stuck at "1"
	G0 = G0_ff;
	E0 = E0_ff;
	J1 = J1_fault;
	{A,B,C,D} = {1'b1,1'b1,1'b1,1'b0};
    #1;
	word[0] = K; #1;
	
	$display("word = %4b", word);
	
	if(word[3] != word[2])
	$display(" <-- E --> stuck at ->0<- is detected using input test vector {1110}");
	else
	$display(" <-- E --> stuck at ->0<- NOT detected using input test vector {1110}");
	
	if(word[3] != word[1])
	$display(" <-- G --> stuck at ->0<- is detected using input test vector {1110}");
	else
	$display(" <-- G --> stuck at ->0<- NOT detected using input test vector {1110}");
	
	if(word[3] != word[0])
	$display(" <-- J --> stuck at ->1<- is detected using input test vector {1110}");
	else
	$display(" <-- J --> stuck at ->1<- NOT detected using input test vector {1110}");
	
	
	
   #2 $finish;
end

endmodule