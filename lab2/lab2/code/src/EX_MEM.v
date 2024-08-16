module EX_MEM
(
    clk_i,
    rst_i,
    RegWrite_i,
    MemtoReg_i,
    MemRead_i,
    MemWrite_i,
    ALU_result_i,
    RS2data_i,
    RDaddr_i, 
    RegWrite_o,
    MemtoReg_o,
    MemRead_o,
    MemWrite_o,
    ALU_result_o,
    RS2data_o,
    RDaddr_o, 
);

input   clk_i;
input   rst_i;
input   RegWrite_i;
input   MemtoReg_i;
input   MemRead_i;
input   MemWrite_i;
input   [31:0]  ALU_result_i;
input   [31:0]  RS2data_i;
input   [4:0]   RDaddr_i;

output  reg  RegWrite_o;
output  reg  MemtoReg_o;
output  reg  MemRead_o;
output  reg  MemWrite_o;
output  reg [31:0]  ALU_result_o;
output  reg [31:0]  RS2data_o;
output  reg [4:0]   RDaddr_o;

always@(posedge clk_i) begin
    if(!rst_i)begin
        RegWrite_o <= RegWrite_i;
        MemtoReg_o <= MemtoReg_i;
        MemRead_o <= MemRead_i;
        MemWrite_o <= MemWrite_i;
        ALU_result_o <= ALU_result_i;
        RS2data_o <= RS2data_i;
        RDaddr_o <= RDaddr_i;
    end
end

endmodule
