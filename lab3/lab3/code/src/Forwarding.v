module Forwarding
(
    input   [4:0]   EX_RS1addr_i,
    input   [4:0]   EX_RS2addr_i,
    input           MEM_RegWrite_i,
    input   [4:0]   MEM_RDaddr_i,
    input           WB_RegWrite_i,
    input   [4:0]   WB_RDaddr_i,
    output reg [1:0]   ForwardA_o,
    output reg [1:0]   ForwardB_o
);

// Evaluate forwarding for EX stage
always @(*) begin
    // Initialize outputs to default
    ForwardA_o = 2'b00;
    ForwardB_o = 2'b00;

    // Check for EX hazard
    if (MEM_RegWrite_i && (MEM_RDaddr_i != 0)) begin
        if (MEM_RDaddr_i == EX_RS1addr_i) ForwardA_o = 2'b10;
        if (MEM_RDaddr_i == EX_RS2addr_i) ForwardB_o = 2'b10;
    end

    // Check for MEM hazard
    if (WB_RegWrite_i && (WB_RDaddr_i != 0)) begin
        // Avoiding overwrite if EX hazard already detected
        if (!MEM_RegWrite_i || (MEM_RDaddr_i != EX_RS1addr_i)) begin
            if (WB_RDaddr_i == EX_RS1addr_i) ForwardA_o = 2'b01;
        end
        if (!MEM_RegWrite_i || (MEM_RDaddr_i != EX_RS2addr_i)) begin
            if (WB_RDaddr_i == EX_RS2addr_i) ForwardB_o = 2'b01;
        end
    end
end

endmodule


