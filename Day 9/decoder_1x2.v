module decoder_1x2 (
    input wire sel,
    output wire y0,
    output wire y1
);
assign y0=~sel;
assign y1=sel;

endmodule