module main_control(
  input  logic [6:0] opcode,

  output logic       reg_write,
  output logic       alu_src,
  output logic       mem_write,
  output logic       branch,
  output logic       jump,
  output logic [1:0] result_src,
  output logic [1:0] alu_op,
  output logic [2:0] imm_src
);

  localparam R_TYPE  = 7'b0110011;
  localparam I_TYPE  = 7'b0010011;
  localparam LOAD    = 7'b0000011;
  localparam STORE   = 7'b0100011;
  localparam BRANCH  = 7'b1100011;
  localparam JAL     = 7'b1101111;
  localparam JALR    = 7'b1100111;
  localparam LUI     = 7'b0110111;
  localparam AUIPC   = 7'b0010111;

  always_comb begin
    reg_write  = 0;
    alu_src    = 0;
    mem_write  = 0;
    branch     = 0;
    jump       = 0;
    result_src = 2'b00;
    alu_op     = 2'b00;
    imm_src    = 3'b000;

    case(opcode)

      R_TYPE: begin
        reg_write = 1;
        alu_op    = 2'b10;
      end

      I_TYPE: begin
        reg_write = 1;
        alu_src   = 1;
        alu_op    = 2'b11;
      end

      LOAD: begin
        reg_write  = 1;
        alu_src    = 1;
        result_src = 2'b01;
        alu_op     = 2'b00;
      end

      STORE: begin
        alu_src   = 1;
        mem_write = 1;
        alu_op    = 2'b00;
        imm_src   = 3'b001;
      end

      BRANCH: begin
        branch  = 1;
        alu_op  = 2'b01;
        imm_src = 3'b010;
      end

      JAL: begin
        reg_write  = 1;
        jump       = 1;
        result_src = 2'b10;
        imm_src    = 3'b100;
      end

      JALR: begin
        reg_write  = 1;
        alu_src    = 1;
        jump       = 1;
        result_src = 2'b10;
      end

      LUI: begin
        reg_write = 1;
        alu_src   = 1; 
        imm_src   = 3'b011;
      end

      AUIPC: begin
        reg_write = 1;
        alu_src   = 1;
        alu_op    = 2'b00;
        imm_src   = 3'b011;
      end

    endcase
  end

endmodule
