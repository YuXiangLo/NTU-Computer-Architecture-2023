module ALU_Control(
	ALUCtrl_i,
	ALUOp_i,
	ALUCtrl_o
);

input [9:0] ALUCtrl_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;

assign ALUCtrl_o = (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0000000111) ? 3'b000 :  //and
                   (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0000000100) ? 3'b001 :  //xor
                   (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0000000001) ? 3'b010 :  //sll
                   (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0000000000) ? 3'b011 :  //add
                   (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0100000000) ? 3'b100 :  //sub
                   (ALUOp_i == 2'b10 && ALUCtrl_i 		== 10'b0000001000) ? 3'b101 :  //mul
                   (ALUOp_i == 2'b00 && ALUCtrl_i [2:0] 	== 3'b000)    	   ? 3'b110 :  //addi
                   (ALUOp_i == 2'b00 && ALUCtrl_i 		== 10'b0100000101) ? 3'b111 :  //srai
					3'b000;
endmodule
