`timescale 1ns / 1ps
module Ex3(q,clk,reset);
output [7:0]q;
input clk,reset;
T_FF tff0(q[0],clk,reset);
T_FF tff1(q[1],q[0],reset);
T_FF tff2(q[2],q[1],reset);
T_FF tff3(q[3],q[2],reset);
T_FF tff4(q[4],q[3],reset);
T_FF tff5(q[5],q[4],reset);
T_FF tff6(q[6],q[5],reset);
T_FF tff7(q[7],q[6],reset);
endmodule
module T_FF(q,clk,reset);
output q;
input clk,reset;
wire d;
D_FF dff0(q,d,clk,reset);
not n1(d,q);
endmodule
module D_FF(q,d,clk,reset);
output q;
input d,clk,reset;
reg q;
always @(posedge reset or negedge clk)
if(reset)
q<= 1'b0;
else
q<= d;
endmodule