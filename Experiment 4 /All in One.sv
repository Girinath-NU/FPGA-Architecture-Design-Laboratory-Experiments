module adder_counter_case (
 input logic clk,
 input logic rst_n,

 input logic [1:0] op, // 00: HA, 01: FA, 10: Counter
 input logic a,
 input logic b,
 input logic cin,

 output logic sum,
 output logic carry,
 output logic [3:0] count
 );

 // ---------------------------------
 // 1-second tick signal
 // ---------------------------------
 logic tick_1s;

 tick_1s #(
 .CLK_FREQ(50_000_000) // change if clock differs
 ) u_tick_1s (
 .clk (clk),
 .rst_n (rst_n),
 .tick_1s(tick_1s)
 );

 // ---------------------------------
 // FUNCTION: Half Adder
 // Returns 2-bit result: {carry, sum}
 // ---------------------------------
 function automatic logic [1:0] half_adder(input logic a, input logic b);
 logic s, c;
 s = a ^ b;
 c = a & b;
 return {c, s};
 endfunction

 // ---------------------------------
 // FUNCTION: Full Adder
 // Returns 2-bit result: {carry, sum}
 // ---------------------------------
 function automatic logic [1:0] full_adder(input logic a, input logic b, input

logic cin);

 logic s1, c1, c2, sum_out, carry_out;

 // Calculate logic directly or call half_adder function
 // FA Logic:
 {c1, s1} = half_adder(a, b);
 {c2, sum_out} = half_adder(s1, cin);
 carry_out = c1 | c2;

 return {carry_out, sum_out};
 endfunction

 // ---------------------------------
 // Operation select using CASE
 // ---------------------------------
 always_ff @(posedge clk or negedge rst_n) begin
 if (!rst_n) begin
 sum <= 1'b0;
 carry <= 1'b0;
 count <= 4'd0;
 end
 else begin
 case (op)
 // Half Adder
 2'b00: begin
 // Use non-blocking assignment <= with function result
 {carry, sum} <= half_adder(a, b);
 end

 // Full Adder

 2'b01: begin
 {carry, sum} <= full_adder(a, b, cin);
 end

 // Counter (increments every 1 second)
 2'b10: begin
 sum <= 1'b0;
 carry <= 1'b0;

 if (tick_1s) begin
 if (count == 4'd9)
 count <= 4'd0;
 else
 count <= count + 1'b1;
 end
 end

 default: begin
 sum <= 1'b0;
 carry <= 1'b0;
 end
 endcase
 end
 end

 endmodule

 // ---------------------------------
 // Tick Module (No changes needed, logic is correct)
 // ---------------------------------
 module tick_1s #(
 parameter int CLK_FREQ = 50_000_000 // 50 MHz default
 )(
 input logic clk,
 input logic rst_n,
 output logic tick_1s
 );

 localparam int COUNT_MAX = CLK_FREQ - 1;
 // $clog2 calculation is correct for determining bit width
 logic [$clog2(COUNT_MAX+1)-1:0] cnt;

 always_ff @(posedge clk or negedge rst_n) begin
 if (!rst_n) begin
 cnt <= '0;
 tick_1s <= 1'b0;
 end
 else if (cnt == COUNT_MAX) begin
 cnt <= '0;
 tick_1s <= 1'b1; // pulse for 1 clock
 end
 else begin
 cnt <= cnt + 1'b1;
 tick_1s <= 1'b0;
 end
 end

 endmodule
