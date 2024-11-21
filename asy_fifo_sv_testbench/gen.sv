class gen;
trans t;
mailbox m;
int c;
event e;
function new(mailbox m1,event e2,int k);
m=m1;
c=k;
e=e2;
endfunction


task writeaddr();
t=new;
#10;
repeat(c)begin
#10;
 void'(t.randomize());
 m.put(t);
 t.display("genwaddr");
#10;
end
#350;
->e;
endtask


endclass

