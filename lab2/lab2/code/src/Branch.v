module  Branch
(
    RS1data_i,
    RS2data_i,
    Branch_i,
    Imm_i,
    PC_i,
    Flush_o,
    PC_o
);

input   [31:0]  RS1data_i;
input   [31:0]  RS2data_i;
input           Branch_i;
input   [31:0]  Imm_i;
input   [31:0]  PC_i;
output reg      Flush_o;
output  [31:0]  PC_o;

assign PC_o = PC_i + (Imm_i << 1);

always @(RS1data_i or RS2data_i or Branch_i or Imm_i or PC_i) begin
	Flush_o = (RS1data_i == RS2data_i && Branch_i) ? 1'b1 : 1'b0;
end

endmodule
