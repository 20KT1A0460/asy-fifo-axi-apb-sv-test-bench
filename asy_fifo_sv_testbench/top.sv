`include "trans.sv"
`include "gen.sv"
`include "drive.sv"
`include "inm.sv"
`include "om.sv"
`include "scrb.sv"
`include "env.sv"
`include "interf.sv"
`include "rtl.v"
`include "tb.sv"
`include "ass.sv"

module top;
bit wclk,rclk;
bit we,re;
bit wreset,rreset;
always #10 wclk=~wclk;
always #5 rclk=~rclk;

initial begin 
wclk=0;
rclk=0;
wreset=1;
rreset=1;
#20;
wreset=0;
rreset=0;
we=1;
re=0;
#200;
we=0;
re=1;
end

interf i(.wclk(wclk),.wreset(wreset),.rclk(rclk),.rreset(rreset),.we(we),.re(re));
asyfifo dut (.wclk(i.wclk),.rclk(i.rclk),.wreset(i.wreset),.rreset(i.rreset),.datain(i.datain),.we(i.we),.re(i.re),.dataout(i.dataout),.full(i.full),.empty(i.empty));
tb f(i);
ass s(i);
endmodule


