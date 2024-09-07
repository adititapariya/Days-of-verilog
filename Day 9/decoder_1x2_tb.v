`timescale 1ns/1ps

module decoder_1x2_tb;

    //inputs
    reg sel;

    //outputs
    wire y0;
    wire y1;

    //instantiate the unit under test (UUT)

    decoder_1x2 uut (
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        //initialize inputs
        sel=0;

        $dumpfile("decoder_1x2_tb.vcd");
        $dumpvars(0, decoder_1x2_tb);

        //applying test vectors
        #10 sel = 0;
        #10 sel = 1;
        #10 $finish; //end simulation
    end

    initial begin
        //monitor the inputs and outputs
        $monitor("time =%t \t sel= %d \t y0= %d \t y1= %d", $time, sel, y0, y1);
    end
    endmodule