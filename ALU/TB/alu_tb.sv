`timescale 1ns/1ps

module alu_tb;

    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0]  alu_op;

    logic [31:0] result;
    logic        zero;

    alu dut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_op   (alu_op),
        .result   (result),
        .zero     (zero)
    );

    task run_test(
        input [31:0] a,
        input [31:0] b,
        input [3:0]  op
    );
    begin
        operand_a = a;
        operand_b = b;
        alu_op    = op;
        #1;

        $display("A=%0d B=%0d OP=%b RESULT=%0d ZERO=%b",
                  operand_a, operand_b, alu_op, result, zero);
    end
    endtask

    initial begin
      
        $display("===== ALU TEST START =====");

        run_test(10, 5, 4'b0000);
        run_test(10, 5, 4'b0001);
        run_test(5, 5, 4'b0001);  
        run_test(6, 3, 4'b0010);
        run_test(6, 3, 4'b0011);
        run_test(6, 3, 4'b0100);
        run_test(1, 2, 4'b0101);  
        run_test(8, 2, 4'b0110);   
        run_test(-8, 2, 4'b0111); 
        run_test(0, 0, 4'b0000);  
        run_test(32'hFFFFFFFF, 1, 4'b0000); 

        $display("===== ALU TEST END =====");
     

        $finish;
    end

endmodule
    
  
  
  
