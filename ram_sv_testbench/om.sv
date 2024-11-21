class om;
trans t;
mailbox m;
event e;
virtual interf in;

covergroup cv  @(posedge in.clk  or negedge in.clk or posedge in.reset);
cv_addr:coverpoint t.addr {bins caddr={[0:9]};}
cv_datain:coverpoint t.datain {bins cdatain={[4160:60350]};}
cv_dataout:coverpoint t.datain {bins cdataout={[4160:60350]};}
cv_clk:coverpoint t.clk { bins cclkdiss= (0=>1);  }
cv_reset:coverpoint t.reset {bins rass=(0=>1);}
endgroup


function new(mailbox m1,event e1,virtual interf in2);
m=m1;
e=e1;
in=in2;
cv=new;
endfunction


task outload();
t=new;
forever begin
@(in.dataout);
t.datain=in.datain;
t.addr=in.addr;
t.wr=in.wr;
t.clk=in.clk;
t.reset=in.reset;
t.dataout=in.dataout;
cv.sample();
t.display("outputmonitor");
m.put(t);
->e;
end
endtask

endclass
