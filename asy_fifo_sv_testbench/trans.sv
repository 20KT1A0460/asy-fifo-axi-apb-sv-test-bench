class trans ;
bit wclk,rclk,wreset,rreset;
bit we,re;
randc bit [7:0] datain;
bit  full,empty;
bit [7:0] dataout;

function void display(string msg);
$display($time," datain=%d,dataout=%d,we=%b,re=%b,msg=%s",datain,dataout,we,re,msg);
endfunction

endclass
