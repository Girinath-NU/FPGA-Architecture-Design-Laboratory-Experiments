module shiftregister (
input logic clk,// Clock input
input logic reset n,// Active-low reset
input logic shift_en,// Shift enable
input logic data in, // Serial data input
output logic [3:0] data out // Parallel data output
);
always_ff @(posedge clk or negedge reset_n) begin
  if (!reset n) begin // Reset the register to all zeros
      data out <= 4'0000;
  end
end
  else if (shift en) begin // Shift operation: new bit enters from right, leftmost bit is discarded
      data out <= {data out [2:0), data_in);
  end
endmodule
