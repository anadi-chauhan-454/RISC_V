module alu_control_tb;

  logic [1:0] alu_op;
  logic [2:0] funct3;
  logic [6:0] funct7;
  logic [3:0] alu_contr;

  alu_control dut (.*);

  task run_test(
    input logic [1:0] op,
    input logic [2:0] f3,
    input logic [6:0] f7
  );
    begin
      alu_op = op;
      funct3 = f3;
      funct7 = f7;
      #1;

      $display("alu_op=%b funct3=%b funct7=%b ? alu_contr=%b",
                alu_op, funct3, funct7, alu_contr);
    end
  endtask

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, alu_control_tb);


    run_test(2'b00, 3'b000, 7'b0000000);

    run_test(2'b01, 3'b000, 7'b0000000);

    run_test(2'b10, 3'b000, 7'b0000000); 
    run_test(2'b10, 3'b000, 7'b0100000); 
    run_test(2'b10, 3'b111, 7'b0000000); 
    run_test(2'b10, 3'b110, 7'b0000000); 
    run_test(2'b10, 3'b100, 7'b0000000); 
    run_test(2'b10, 3'b001, 7'b0000000); 
    run_test(2'b10, 3'b101, 7'b0000000); 
    run_test(2'b10, 3'b101, 7'b0100000); 
    run_test(2'b11, 3'b000, 7'b0000000); 
    run_test(2'b11, 3'b111, 7'b0000000);
    run_test(2'b11, 3'b110, 7'b0000000);
    run_test(2'b11, 3'b100, 7'b0000000); 
    run_test(2'b11, 3'b001, 7'b0000000); 
    run_test(2'b11, 3'b101, 7'b0000000); 
    run_test(2'b11, 3'b101, 7'b0100000);

    $finish;
  end

endmodule
