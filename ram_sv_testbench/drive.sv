class drive;
trans t;
mailbox m;
event e;
virtual interf in;
function new(mailbox m1,event e1,virtual interf in2);
m=m1;
e=e1;
in=in2;
endfunction

task read();
t=new;
forever begin
m.get(t);
t.display("driver");
in.addr=t.addr;
in.wr=t.wr;
in.datain=t.datain;
->e;
end
endtask

endclass
