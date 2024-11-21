class gen;
trans t;
mailbox m;
int c,n;
event e;
function new(mailbox m1,event e2,int k);
m=m1;
c=k;
n=k;
e=e2;
endfunction

task wrt();
if(t.wr)begin
  t.addr.rand_mode(1);
  t.datain.rand_mode(1);
end
else begin
t.addr.rand_mode(1);
t.datain.rand_mode(0);    
 end
endtask


task writeaddr();
t=new;
 t.wr=1;
repeat(c)begin
#10;
wrt();
 void'(t.randomize());
 m.put(t);
 t.display("genwaddr");
#10;
end
#10;
t.wr=0;
repeat(n)begin
#10;
wrt();
 void'(t.randomize());
 m.put(t);
 t.display("genaaddr");
#10;
end
#20;
->e;
endtask


endclass
