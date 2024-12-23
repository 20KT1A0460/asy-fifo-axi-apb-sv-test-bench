module ram8k16(addr,datain,clk,reset,wr,dataout);
parameter ls=10;
parameter dt1=8;
parameter dt2=16;

input [ls-1:0] addr;
input [dt2-1:0] datain;
input clk,reset,wr;
output reg [dt2-1:0] dataout;
reg [dt1-1:0]ram1[0:ls-1];
reg [dt1-1:0]ram2[0:ls-1];
integer i;
always@(posedge clk) begin
   if(!reset) begin
       dataout=0;
       for(i=0;i<ls;i=i+1)
             begin
              ram1[i]=0;
              ram2[i]=0;
             end
       end
     else begin
         if (wr) begin
               ram1[addr]=datain[dt1-1:0];
               ram2[addr]=datain[dt2-1:dt1];
         end
         else begin
            dataout[dt1-1:0]=ram1[addr];
            dataout[dt2-1:dt1]=ram2[addr];
          
             end
 end
 end
endmodule

