module pc_tb;

  logic clk;
  logic rst;
  logic branch;
  logic jump;
  logic condition;
  logic jalr;
  logic [31:0] imm;
  logic [31:0] rs1;
  logic [31:0] pc;

  pc dut (.*);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, pc_tb);

    clk = 0;
    rst = 1;
    branch = 0;
    jump = 0;
    condition = 0;
    jalr = 0;
    imm = 0;
    rs1 = 0;

    #10;
    rst = 0;

    @(posedge clk);
    $display("After reset PC = %h", pc);

    jump = 1;
    jalr = 0;
    imm = 32'h00000010;

    @(posedge clk);
    $display("JAL PC = %h", pc);

    jalr = 1;
    rs1 = 32'h00000020;
    imm = 32'h00000004;

    @(posedge clk);
    $display("JALR PC = %h", pc);

    jump = 0;
    branch = 1;
    condition = 1;
    imm = 32'h00000008;

    @(posedge clk);
    $display("Branch taken PC = %h", pc);

    branch = 0;
    condition = 0;

    @(posedge clk);
    $display("Default PC = %h", pc);

    $finish;
  end

endmodule
