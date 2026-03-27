module register_file (
    input  logic clk,
    input  logic rst,
    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,
    input  logic [4:0]  rd,
    input  logic [31:0] wd,
    input  logic reg_write,
    output logic [31:0] rd1,
    output logic [31:0] rd2
);

    logic [31:0] regfile [31:0];

    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < 32; i++) begin
                regfile[i] <= 32'b0;
            end
        end
        else if (reg_write && (rd != 5'd0)) begin
            regfile[rd] <= wd;
        end
    end

    always_comb begin
        rd1 = 32'b0;
        rd2 = 32'b0;

        if (rs1 != 5'd0) begin
            if (reg_write && (rd == rs1) && (rd != 5'd0))
                rd1 = wd;
            else
                rd1 = regfile[rs1];
        end

        if (rs2 != 5'd0) begin
            if (reg_write && (rd == rs2) && (rd != 5'd0))
                rd2 = wd;
            else
                rd2 = regfile[rs2];
        end
    end

endmodule
