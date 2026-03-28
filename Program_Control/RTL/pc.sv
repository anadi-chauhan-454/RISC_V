module pc (
  input  logic        clk,
  input  logic        rst,
  input  logic        branch,
  input  logic        condition,
  input  logic        jump,
  input  logic        jalr,
  input  logic [31:0] rs1,
  input  logic [31:0] imm,

  output logic [31:0] pc
);

  logic [31:0] pc_next;
  logic [31:0] pc_plus_4;
  logic [31:0] pc_target;

  assign pc_plus_4 = pc + 4;
  assign pc_target = pc + imm;

  always_comb begin
    pc_next = pc_plus_4;

    if (jalr) begin
      pc_next = (rs1 + imm) & 32'hFFFFFFFE;
    end
    else if (jump) begin
      pc_next = pc_target;
    end
    else if (branch && condition) begin
      pc_next = pc_target;
    end
  end

  always_ff @(posedge clk) begin
    if (rst)
      pc <= 32'h00000000;
    else
      pc <= pc_next;
  end

endmodule
