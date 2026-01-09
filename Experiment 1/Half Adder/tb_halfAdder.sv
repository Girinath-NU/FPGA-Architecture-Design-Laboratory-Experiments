`timescale 1ns/1ps
module tb_halfAdder;
logic at;
logic bt;
logic st;
logic ct;

/*
module halfAdder(
input logic a,
input logic b,
output logic s,
output logic c
);
*/

halfAdder dut (
.a(at),
.b(bt),
.s(st),
.c(ct)
);

initial begin
at = 0; bt = 0; #10;
$display("a = %0d, b= %0d,s= %0d,c= %0d",at,bt,st,ct);
at = 0; bt = 1; #10;
$display("a = %0d, b= %0d,s= %0d,c= %0d",at,bt,st,ct);
at = 1; bt = 0; #10;
$display("a = %0d, b= %0d,s= %0d,c= %0d",at,bt,st,ct);
at = 1; bt = 1; #10;
$display("a = %0d, b= %0d,s= %0d,c= %0d",at,bt,st,ct);

end 

endmodule
