module regfile_tb;
    logic clk, rst;
    logic [4:0] rs1, rs2, rd;
    logic [31:0] wd;
    logic reg_write;
    logic [31:0] rd1, rd2;

    // DUT
    register_file dut (.*);

    // clock
    always #5 clk = ~clk;

    initial begin
        // ? Initialize EVERYTHING
        clk = 0;
        rst = 1;
        reg_write = 0;
        rs1 = 0;
        rs2 = 0;
        rd  = 0;
        wd  = 0;

        #10 rst = 0;

        // Write x5 = 100
        @(posedge clk);
        rd = 5;
        wd = 100;
        reg_write = 1;

        @(posedge clk);
        reg_write = 0;

        // Read x5
        rs1 = 5;
        rs2 = 0;
        #1;
        $display("x5 = %0d", rd1);

        // Read x0
        rs1 = 0;
        #1;
        $display("x0 = %0d (should be 0)", rd1);

        $finish;
    end
endmodule
