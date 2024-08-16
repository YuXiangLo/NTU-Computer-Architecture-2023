module branch_check
(
    Branch_i,
    branch_result_i,
    predict_i,
    Imm_i,
    PC_i,
    Flush_o,
    PC_o
);

    input Branch_i;
    input branch_result_i;
    input predict_i;
    input [31:0] Imm_i;
    input [31:0] PC_i;
    output reg Flush_o;
    output reg [31:0] PC_o;

    always @* begin
        Flush_o = 1'b0;
        PC_o = PC_i;

        if (Branch_i && (branch_result_i != predict_i)) begin
            Flush_o = 1'b1;
            PC_o = branch_result_i ? (PC_i + (Imm_i << 1)) : (PC_i + 4);
        end
    end

endmodule

