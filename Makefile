all:
	iverilog -g2012 pu.v alu.v pc.v imem.v rega.v lidx.v dec.v dmem.v sel.v test.v
	vvp a.out 
	open pu.vcd

clean:
	rm pu.vcd a.out gate.v

yo:
	yosys pu.ys

gate:
	iverilog -gspecify -T typ gate.v test.v ./osu018_stdcells/osu018_stdcells.v
	vvp a.out