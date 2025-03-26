`include "pu.vh"
module test;
	reg clk, rst;
	wire we;
	wire [`WIDTH:0] wd;
	pu pu(we, wd, clk, rst);
	always #5 clk =~ clk;
initial begin
$dumpfile("pu.vcd");
$dumpvars(0, test);
rst = 1;
clk = 0;
#20
rst = 0;
#3000
$finish;
end
endmodule
