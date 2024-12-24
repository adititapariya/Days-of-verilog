module tb;
    reg clk, rst_n;
    reg j, k;
    wire q, q_bar;

    JK_flipflop dff(clk, rst_n, j, k, q, q_bar);

    always #2 clk = ~clk;
    initial begin
    clk = 0; rst_n = 0;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);
    #3 rst_n = 1;
    $display("Reset=%b --> q=%b, q_bar=%b", rst_n, q, q_bar);

    drive(2'b00);
    drive(2'b01);
    drive(2'b10);
    drive(2'b11); // Toggles previous output
    drive(2'b11); // Toggles previous output
    #5;
    $finish;
    end

    task drive(bit [1:0] ip);
    @(posedge clk);
    {j,k} = ip;
    #1 $display("j=%b, k=%b --> q=%b, q_bar=%b",j, k, q, q_bar);
    endtask

    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    end
endmodule