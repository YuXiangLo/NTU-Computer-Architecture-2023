module Sign_Extend(
    imm_i,
    imm_o
);

input   [11:0]  imm_i;
output  [31:0]  imm_o;


assign  imm_o = {{20{imm_i[11]}},imm_i};


endmodule

