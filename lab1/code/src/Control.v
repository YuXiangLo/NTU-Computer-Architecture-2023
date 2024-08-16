`define Rtype   7'b0110011
`define Itype   7'b0010011
`define lw  7'b0000011
`define sw  7'b0100011
`define beq 7'b1100011

module Control
(
    Op_i,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o,
);

input   [6:0]       Op_i;

output  [1:0]       ALUOp_o;
output              ALUSrc_o;
output              RegWrite_o;

assign ALUOp_o =    (Op_i == `Rtype) ? 2'b10: // R-type
                    (Op_i == `Itype) ? 2'b00: // I-type
                    (Op_i == `lw) ? 2'b00: // lw
                    (Op_i == `sw) ? 2'b00: // sw
                    (Op_i == `beq) ? 2'b11: // beq
                    2'b0;
assign ALUSrc_o =   (Op_i == `Rtype) ? 1'b0: // R-type
                    (Op_i == `Itype) ? 1'b1: // I-type
                    (Op_i == `lw) ? 1'b1: // lw
                    (Op_i == `sw) ? 1'b1: // sw
                    (Op_i == `beq) ? 1'b0: // beq
                    1'b0;

assign RegWrite_o = (Op_i == `Rtype) ? 1'b1: // R-type
                    (Op_i == `Itype) ? 1'b1: // I-type
                    (Op_i == `lw) ? 1'b1: // lw
                    (Op_i == `sw) ? 1'b0: // sw
                    (Op_i == `beq) ? 1'b0: // beq
                    1'b0;

endmodule

