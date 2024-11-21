class om;
trans t;
mailbox m;
event e;
virtual interf in;

covergroup cv  @(posedge in.wclk  or negedge in.rclk or posedge in.rreset or posedge in.wreset);
cv_datain:coverpoint t.datain {bins cdatain={[29:102]};}
cv_dataout:coverpoint t.dataout {bins cdataout={[29:102]};}
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
t.we=in.we;
t.re=in.re;
t.dataout=in.dataout;
cv.sample();
t.display("outputmonitor");
m.put(t);
->e;
end
endtask

endclass
