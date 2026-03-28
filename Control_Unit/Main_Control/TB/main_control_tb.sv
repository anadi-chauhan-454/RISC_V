module main_control_tb;

  logic [6:0] opcode;
  logic reg_write;
  logic alu_src;
  logic mem_write;
  logic branch;
  logic jump;
  logic [1:0] result_src;
  logic [1:0] alu_op;
  logic [2:0] imm_src;

  main_control dut (.*);

  task run_test(input logic [6:0] op);
    begin
      opcode = op;
      #1;

      $display("opcode=%b | reg=%b alu_src=%b mem_write=%b branch=%b jump=%b result_src=%b alu_op=%b imm_src=%b",
                opcode, reg_write, alu_src, mem_write, branch, jump, result_src, alu_op, imm_src);
    end
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, main_control_tb);

    // Test all instruction types
    run_test(7'b0110011); // R-type
    run_test(7'b0010011); // I-type
    run_test(7'b0000011); // LOAD
    run_test(7'b0100011); // STORE
    run_test(7'b1100011); // BRANCH
    run_test(7'b1101111); // JAL
    run_test(7'b1100111); // JALR
    run_test(7'b0110111); // LUI
    run_test(7'b0010111); // AUIPC

    $finish;
  end

endmodule
