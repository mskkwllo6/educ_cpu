`include "pu.vh"
module alu(
	input [`WIDTH:0] a, b,
	input [`OPS:0] op,
	output logic [`WIDTH:0] rr,
	input dstb,
	output logic ze,ca,sg,
	input clk,rst);

	parameter ADD=0, SUB=1, THB=2, ASL=3, RSL=4, RSR=5, NAD=6, XOR=7;
	logic [`WIDTH+1:0] r;
	assign rr = r[`WIDTH:0];
	always @* begin
		case(op)
		// synopsys full_case parallel_case
		ADD: r = a+b;	
		SUB: r = a-b;
		THB: r = b;
		ASL: r = a>>>b;
		RSL: r = a>>b;
		RSR: r = a<<b;
		NAD: r = ~(a&b);
		XOR: r = a^b;
		endcase
	end

	//SR
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			ze<=0;
			ca<=0;
			sg<=0;
		end else begin
			//SRへの書き込みを阻害できる
			if(dstb==0) begin
				if(rr==0) ze<=1;
				else ze<=0;
				if(rr[`WIDTH+1]==1) ca<=1;
				else ca<=0;
				if(r[`WIDTH]==1) sg<=1;
				else sg<=0;
			end
		end
	end
endmodule