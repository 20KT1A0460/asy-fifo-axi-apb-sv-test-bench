`include "trans.sv"
`include "gen.sv"
`include "drive.sv"
`include "inm.sv"
`include "om.sv"
`include "scrb.sv"
`include "env.sv"
`include "interf.sv"
`include "ram8k16.v"
`include "tb.sv"
`include "ass.sv"

module top;
bit clk;
bit reset;
always #5 clk=~clk;

initial begin 
clk=1;
reset=0;
#20;
reset=1;
end

interf i(.clk(clk),.reset(reset));
ram8k16 dut (.clk(i.clk),.reset(i.reset),.datain(i.datain),.wr(i.wr),.addr(i.addr),.dataout(i.dataout));
tb f(i);
ass s(i);
endmodule

