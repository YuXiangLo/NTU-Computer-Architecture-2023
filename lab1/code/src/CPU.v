module CPU
(
    clk_i, 
    rst_i,
);

// Ports
input               clk_i;
input               rst_i;

// PC wire
wire [31:0] pc_i;
wire [31:0] pc_o;
wire [31:0] add_PC_o;
Adder Add_PC(
	.pc_i (pc_o),
	.imm_i (32'd4),
	.pc_o (pc_i)
);

PC PC(
	.clk_i (clk_i),
	.rst_i (rst_i),
	.pc_i (pc_i),
	.pc_o(pc_o)
);

// Inst wire
wire     [31:0]     instr_o;
Instruction_Memory Instruction_Memory(
	.addr_i (pc_o),
	.instr_o (instr_o)
);


// Register wire input
wire     [6:0]      opcode;
wire     [4:0]      rs1_addr_i;
wire     [4:0]      rs2_addr_i;
wire     [4:0]      rd_addr_i;
wire     [31:0]     rd_data_i;

// Register wire output
wire     [31:0]     rs1_data_o;
wire     [31:0]     rs2_data_o;

// Sign Extend in & out
wire     [11:0]     imm_i;
wire     [31:0]     imm_o;

// ALU Control in & out
wire [9:0] ALUCtrl_i;
wire [2:0] ALUCtrl_o;


assign opcode 		= instr_o [6:0];
assign rs1_addr_i 	= instr_o [19:15];
assign rs2_addr_i 	= instr_o [24:20];
assign rd_addr_i 	= instr_o [11:7];
assign imm_i 		= instr_o[31:20];
assign ALUCtrl_i = {instr_o [31:25], instr_o [14:12]};

// Control wire
wire     [1:0]      ALUOp_o;
wire                ALUSrc_o;
wire                RegWrite_o;

Control Control(
	.Op_i       (opcode),
	.ALUOp_o    (ALUOp_o),
	.ALUSrc_o   (ALUSrc_o),
	.RegWrite_o (RegWrite_o)
);

Registers Registers(
	.rst_i     		(rst_i),
    .clk_i     		(clk_i),
    .RS1addr_i  	(rs1_addr_i),
    .RS2addr_i  	(rs2_addr_i),
    .RDaddr_i   	(rd_addr_i), 
    .RDdata_i   	(rd_data_i),
    .RegWrite_i		(RegWrite_o), 
    .RS1data_o     	(rs1_data_o), 
    .RS2data_o   	(rs2_data_o)
);

Sign_Extend Sign_Extend(
	.imm_i (imm_i),
	.imm_o (imm_o)
);

wire [31:0] ALUData_i;
MUX32 MUX_ALUSrc(
	.rs2_data_i (rs2_data_o),
	.imm_i (imm_o),
	.ALUSrc_i (ALUSrc_o),
	.ALUData_o  (ALUData_i)
);

ALU_Control ALU_Control(
	.ALUCtrl_i (ALUCtrl_i),
	.ALUOp_i (ALUOp_o),
	.ALUCtrl_o (ALUCtrl_o)
);

ALU ALU(
	.data1_i (rs1_data_o),
	.data2_i (ALUData_i),
	.ALUCtrl_i (ALUCtrl_o),
	.data_o (rd_data_i)
);

endmodule

