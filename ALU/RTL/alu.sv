typedef enum logic [3:0] {
  ALU_ADD  = 4'b0000,
  ALU_SUB  = 4'b0001,
  ALU_AND  = 4'b0010,
  ALU_OR   = 4'b0011,
  ALU_XOR  = 4'b0100,
  ALU_SLL  = 4'b0101,
  ALU_SRL  = 4'b0110,
  ALU_SRA  = 4'b0111,
} alu_op_t;

module alu (
  input  logic [31:0] operand_a,
  input  logic [31:0] operand_b,
  input  alu_op_t alu_op,
  output logic [31:0] result,
  output logic zero
);

  always_comb begin
    result = 32'b0;

    case (alu_op)
      ALU_ADD  : result = operand_a + operand_b;
      ALU_SUB  : result = operand_a - operand_b;
      ALU_AND  : result = operand_a & operand_b;
      ALU_OR   : result = operand_a | operand_b;
      ALU_XOR  : result = operand_a ^ operand_b;
      ALU_SLL  : result = operand_a << operand_b[4:0];
      ALU_SRL  : result = operand_a >> operand_b[4:0];
      ALU_SRA  : result = $signed(operand_a) >>> operand_b[4:0];
    endcase

    zero = (result == 32'b0);
  end

endmodule
