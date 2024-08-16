module MUX32
(
    rs2_data_i,
    imm_i,
    ALUSrc_i,
    ALUData_o
);

input   [31:0] rs2_data_i, imm_i;
input   ALUSrc_i;
output  [31:0] ALUData_o;

assign ALUData_o = ALUSrc_i ? imm_i: rs2_data_i;


endmodule

