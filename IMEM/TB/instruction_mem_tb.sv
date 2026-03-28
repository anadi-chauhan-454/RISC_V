module instruction_mem_tb;

  logic rst;
  logic [31:0] address;
  logic [31:0] instruction;

  instruction_mem dut (.*);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, instruction_mem_tb);

    rst = 1;
    address = 0;
    #5 rst = 0;

    address = 32'h00000000;
    #1;
    $display("addr=0 instr=%h", instruction);

    address = 32'h00000004;
    #1;
    $display("addr=4 instr=%h", instruction);

    address = 32'h00000008;
    #1;
    $display("addr=8 instr=%h", instruction);

    $finish;
  end

endmodule
