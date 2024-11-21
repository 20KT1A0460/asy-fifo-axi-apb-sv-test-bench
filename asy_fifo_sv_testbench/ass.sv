module ass(interf in);

property p1;
@(posedge in.wclk ) disable iff(in.wreset ) in.we |-> (in.datain inside {[29:102]});
endproperty


property p3;
@(posedge in.wclk ) disable iff(in.wreset ) in.we |-> in.datain  [*10] ;
endproperty


property p5;
@(posedge in.rclk ) disable iff(in.rreset ) in.re |=> in.dataout  [*10] ;
endproperty

property p6;
@(posedge in.rclk ) disable iff(in.rreset ) in.re |-> (in.dataout inside {[29:102]}) ;
endproperty


as1: assert property(p1);
as2: assert property(p3);
as3: assert property(p5);
as4: assert property(p6);

endmodule
