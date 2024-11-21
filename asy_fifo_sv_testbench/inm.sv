class inm;
trans t;
mailbox m;
int wpr,rpr;
event e;
virtual interf in;
bit [7:0]ram1[7:0];

function new(mailbox m1,event e1,virtual interf in2);
m=m1;
e=e1;
in=in2;
endfunction

task inload();
t=new;
forever begin
@(in.datain,in.we,in.re,in.dataout);
t.we=in.we;
t.re=in.re;
t.datain=in.datain;
t.full=in.full;
t.empty=in.empty;
//bfm
	if(t.we&&!t.re&&!t.full) begin
			if(wpr<=7) begin
	        ram1[wpr]<=t.datain;
		    wpr<=wpr+1;
	         end
	 end

   else if(t.re&&!t.we&&!t.empty) begin
	      if(rpr<=7) begin
	        t.dataout<=ram1[rpr];
		     rpr<=rpr+1;
	         end
	 end

  t.display("inputmonitor");
  m.put(t);
->e;
end
endtask

endclass
