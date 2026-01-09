module fullAdder(
input logic af,
input logic bf,
input logic cf,
output logic sum,
output logic carry
);

logic s1,c1,c2;

/*
module halfAdder(
input logic a,
input logic b,
output logic s,
output logic c
);
*/

halfAdder h1(.a(af),.b(bf),.s(s1),.c(c1));
halfAdder h2(.a(s1),.b(cf),.s(sum),.c(c2));

assign carry = c1|c2;


endmodule
