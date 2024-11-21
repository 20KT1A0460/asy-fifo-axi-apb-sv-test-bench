class scrb;
trans t,t1;
mailbox m,m1;
event e;
int s;
int k;
virtual interf in;
function new(mailbox m2,m3,event e1,virtual interf in2);
m=m2;
m1=m3;
e=e1;
in=in2;
endfunction

task compar();
t=new;
t1=new;
forever begin
m.get(t);
m1.get(t1);
t.display("scrb1");
t1.display("scrb2");
wait(in.re);
if(t.dataout==t1.dataout)begin
   $display($time,"<<<<<<<<<<<<<<<<<<<<<<<test pass t.datout=%d,t1.dataout=%d>>>>>>>>>>>>>>>>>>>>",t.dataout,t1.dataout);
   s=s+1;
   end
 else begin
 $display($time,"<<<<<<<<<<<<<<<<<<<<<<test fail t.datout=%d,t1.dataout=%d>>>>>>>>>>>>>>>>>>>>>>>>>>",t.dataout,t1.dataout);
 k=k+1;
 end
 ->e;
end
endtask

endclass
