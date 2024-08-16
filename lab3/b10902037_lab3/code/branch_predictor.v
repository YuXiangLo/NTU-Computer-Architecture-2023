module branch_predictor
(
    clk_i, 
    rst_i,
    Branch_i,

    update_i,
	result_i,
	predict_o
);
input clk_i, rst_i, update_i, result_i, Branch_i;
output predict_o;

reg [1:0] history;
reg   predict_o;

always @(*) begin
	predict_o = (history == 2'b11 || history == 2'b10) ? 1 : 0;
end

always@(posedge clk_i or negedge rst_i) begin
    if(~rst_i) begin
        history = 2'b11;
    end  
    else if(Branch_i)begin
        if(update_i == result_i)begin
            if (history == 2'b11 || history == 2'b10) begin
                history = 2'b11;
            end
            else if(history == 2'b01 || history == 2'b00)begin
                history = 2'b00;
            end
        end
        else begin
			case (history)
				2'b10: history = 2'b01;
				2'b11: history = 2'b10;
				2'b00: history = 2'b01;
				2'b01: history = 2'b10;
			endcase
		end
    end
end

endmodule

