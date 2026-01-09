module halfAdder(
input logic a,
input logic b,
output logic s,
output logic c
);

always_comb begin 
	s=a^b;
	c=a&b;
end 

endmodule
