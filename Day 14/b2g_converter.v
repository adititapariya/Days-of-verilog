module b2g_converter #(parameter WIDTH=4) (input [WIDTH-1:0] binary, output [WIDTH-1:0] gray);
  genvar i;    
  generate
    for(i=0;i<WIDTH-1;i++) begin
      assign gray[i] = binary[i] ^ binary[i+1];
    end
  endgenerate
  
  assign gray[WIDTH-1] = binary[WIDTH-1];
endmodule


//alternate
// module b2g_converter #(parameter WIDTH=4) (input [WIDTH-1:0] binary, output [WIDTH-1:0] gray);
//   assign gray = binary ^ (binary >> 1);
// endmodule