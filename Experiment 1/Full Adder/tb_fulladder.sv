`timescale 1ns/1ps
module tb_fullAdder;
logic aft;
logic bft;
logic cft;
logic sumt;
logic carryt;

/*
module fullAdder(
input logic af,
input logic bf,
input logic cf,
output logic sum,
output logic carry
);
*/

fullAdder dut (
.af(aft),
.bf(bft),
.cf(cft),
.sum(sumt),
.carry(carryt)
);

initial begin
aft = 0; bft = 0; cft = 0; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 0; bft = 0; cft = 1; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 0; bft = 1; cft = 0; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 0; bft = 1; cft = 1; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 1; bft = 0; cft = 0; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 1; bft = 0; cft = 1; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 1; bft = 1; cft = 0; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);
aft = 1; bft = 1; cft = 1; #10;
$display("af = %0d, b= %0d,c = %0d, sum= %0d, carry= %0d",aft,bft,cft,sumt,carryt);

end 

endmodule
