module alu_control(
  input  logic [1:0] alu_op,
  input  logic [2:0] funct3,
  input  logic [6:0] funct7,
  output logic [3:0] alu_contr
);

  always_comb begin
    alu_contr = 4'b1111; 

    case (alu_op)

      2'b00: alu_contr = 4'b0000;

      2'b01: alu_contr = 4'b0001; 

      2'b10, 2'b11: begin
        case (funct3)

          3'b000: begin
            if (alu_op == 2'b10 && funct7[5])
              alu_contr = 4'b0001; 
            else
              alu_contr = 4'b0000; 
          end

          3'b111: alu_contr = 4'b0010;
          3'b110: alu_contr = 4'b0011;
          3'b100: alu_contr = 4'b0100;
          3'b001: alu_contr = 4'b0101;

          3'b101: begin
            if (funct7[5])
              alu_contr = 4'b0111; 
            else
              alu_contr = 4'b0110; 
          end

        endcase
      end

    endcase
  end

endmodule
