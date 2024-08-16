module Adder(
	pc_i,
	imm_i,
	pc_o,
);

input [31:0] pc_i, imm_i;
output[31:0] pc_o;
assign pc_o = pc_i + imm_i;

endmodule
