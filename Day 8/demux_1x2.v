module demux_1x2 (
    input wire y,
    input wire S,
    output reg a,
    output reg b
);

always @(*) begin
    //default values
    a = 0;
    b = 0;

    //decode the select line
    case (S)
        1'b0 : a=y;
        1'b1 : b=y;
    endcase
       
end
endmodule