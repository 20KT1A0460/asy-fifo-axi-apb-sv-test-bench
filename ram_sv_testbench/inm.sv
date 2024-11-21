class inm;
trans t;
mailbox m;
event e;
virtual interf in;
bit [7:0]ram1[9:0];
bit [7:0]ram2[9:0];

function new(mailbox m1,event e1,virtual interf in2);
m=m1;
e=e1;
in=in2;
endfunction

task inload();
t=new;
forever begin
@(in.addr,in.datain,in.wr);
t.addr=in.addr;
t.wr=in.wr;
t.datain=in.datain;
t.wr=in.wr;
if(t.wr==1)begin
   $display($time,"write operation");
   ram1[t.addr]=t.datain[7:0];
   ram2[t.addr]=t.datain[15:8];
   end
 else begin
    $display($time,"read operation");
    t. dataout[7:0]=ram1[t.addr];
    t. dataout[15:8]=ram2[t.addr];
  end
  t.display("inputmonitor");
  m.put(t);
->e;
end
endtask

endclass
