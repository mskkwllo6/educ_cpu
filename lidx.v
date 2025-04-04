`include "pu.vh"
module lidx(input [`WIDTH:0] i, input [`HALFWIDTH:0] iv, input [`LIDXS:0] op, output logic [`WIDTH:0] o);
//	`LIDXENUM
	parameter THU=0, IMM=1, LIL=2, LIH=3;
	always @*
		case(op)
		// synopsys full_case parallel_case
		THU:
			o = i;
		IMM:
			o = {8'h00,iv};
		LIL:
			o = {i[`WIDTH:`HALFWIDTH+1],iv};
		LIH:
			o = {iv,i[`HALFWIDTH:0]};
		endcase
endmodule
