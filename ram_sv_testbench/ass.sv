module ass(interf in);
realtime clk_pr=10;
realtime pretime;

always @(posedge in.clk) begin
    if (in.reset) begin
      pretime <= $realtime;
    end
  end
  
property p1;
@(posedge in.clk ) disable iff(!in.reset ) in.wr |-> in.datain;
endproperty

property p2;
@(posedge in.clk ) disable iff(!in.reset ) !in.wr |=> in.dataout  [*10] ;
endproperty

property p3;
@(posedge in.clk ) disable iff(!in.reset ) in.wr |-> in.datain  [*10] ;
endproperty
property p4;
@(posedge in.clk ) disable iff(!in.reset ) in.wr |-> (in.addr inside {[0:9]});
endproperty

property p5;
@(posedge in.clk ) disable iff(!in.reset ) !in.wr |-> (in.addr inside {[0:9]});
endproperty
property p6;
@(posedge in.clk ) disable iff(!in.reset ) 
( pretime ) |=> 
        ((clk_pr >= ($realtime-( pretime +10)) && (clk_pr <= $realtime-( pretime -10))));
endproperty
as1: assert property(p1);
as3: assert property(p3);
as4: assert property(p4);
as5: assert property(p5);
as6:assert property(p6) else
$error("Clock period out of expected range: expected %0t +/- 10 units, but measured difference was %0t", clk_pr, $realtime - pretime);
   

endmodule

/*realtime clk_period = 2000ps;
property check_freq( realtime period)
realtime pre_time;
@(posedge clk) disable iff(!rst)
(`1 ,  pre_time = $realtime) |=> ((period >= ($realtime-( pre_time +10ps)) && (period <= $realtime-( pre_time -10ps)))
endproperty*/
