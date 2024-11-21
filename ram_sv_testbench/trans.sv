class trans ;
randc bit [9:0] addr;
randc bit [15:0] datain;
bit [15:0] dataout;
bit wr;
bit clk;
bit reset;
constraint addr_con{addr inside{[0:9]};}
function void display(string msg);
$display($time," addr=%d,datain=%d,dataout=%d,wr=%b,msg=%s",addr,datain,dataout,wr,msg);
endfunction

endclass
