`define  AND 3'b000
`define  XOR 3'b001
`define  SLL 3'b010
`define  ADD 3'b011
`define  SUB 3'b100
`define  MUL 3'b101
`define  ADDI 3'b110
`define  SRAI 3'b111

module ALU(data1_i, data2_i, ALUCtrl_i, data_o, Zero_o);
    input signed [31:0] data1_i, data2_i;
    input [2:0] ALUCtrl_i;
    output unsigned [31:0] data_o;
    output Zero_o;

    reg [31:0] result;

    always @(*) begin
        case (ALUCtrl_i)
            `AND:  result = data1_i & data2_i;
            `XOR:  result = data1_i ^ data2_i;
            `SLL:  result = data1_i << data2_i;
            `ADD:  result = data1_i + data2_i;
            `SUB:  result = data1_i - data2_i;
            `MUL:  result = data1_i * data2_i;
            `ADDI: result = data1_i + data2_i;
            `SRAI: result = data1_i >>> data2_i[4:0];
            default: result = 32'b0;
        endcase
    end

    assign data_o = result;
    assign Zero_o = (result == 0);

endmodule


