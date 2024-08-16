module ALU (
    input signed [31:0] data1_i,
    input signed [31:0] data2_i,
    input [2:0] ALUCtrl_i,
    output reg signed [31:0] data_o
);

	`define AND  3'b000
	`define XOR  3'b001
	`define SLL  3'b010
	`define ADD  3'b011
	`define SUB  3'b100
	`define MUL  3'b101
	`define ADDI 3'b110
	`define SRAI 3'b111

    always @(*) begin
        case(ALUCtrl_i)
            `AND:  data_o = data1_i & data2_i;   // and
            `XOR:  data_o = data1_i ^ data2_i;   // xor
            `SLL:  data_o = data1_i << data2_i;  // sll
			`ADD:  data_o = data1_i + data2_i;
            `ADDI: data_o = data1_i + data2_i;   // add or addi
            `SUB:  data_o = data1_i - data2_i;   // sub
            `MUL:  data_o = data1_i * data2_i;   // mul
            `SRAI: data_o = data1_i >>> data2_i[4:0]; // sra
            default: data_o = 32'b0;
        endcase
    end

endmodule

