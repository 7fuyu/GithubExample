`timescale 1ns / 1ps
module Ex3_tb;
reg reset;
reg clk; 
wire [7:0]q;

Ex3 UUT(
       .q(q),
       .clk(clk),
	   .reset(reset)
	   );

initial
clk = 1'b0;
always
#5 clk = ~clk;
initial
begin
reset = 1'b1;
#15 reset = 1'b0;
#180 reset = 1'b1;
#10 reset = 1'b0;
#1500 $finish;
end

initial
$monitor($time," Output q = %d",q);
endmodule