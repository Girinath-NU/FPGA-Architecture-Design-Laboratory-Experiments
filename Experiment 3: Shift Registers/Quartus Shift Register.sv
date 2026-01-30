module Shift (
    input  logic        clk,        // 50 MHz clock input
    input  logic        reset_n,    // Active-low reset
    input  logic        shift_en,   // Shift enable
    input  logic        data_in,    // Serial data input
    output logic [3:0]  data_out    // Parallel data output
);

    // -------------------------------------------------
    // 50 MHz to 1 Hz clock divider
    // -------------------------------------------------
    logic        clk_1hz;
    logic [25:0] count;   // 26 bits is enough for 50,000,000

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count   <= 26'd0;
            clk_1hz <= 1'b0;
        end else if (count == 26'd49_999_999) begin
            count   <= 26'd0;
            clk_1hz <= ~clk_1hz;   // toggle every 1 second
        end else begin
            count <= count + 1'b1;
        end
    end

    // -------------------------------------------------
    // Shift register driven by 1 Hz clock
    // -------------------------------------------------
    always_ff @(posedge clk_1hz or negedge reset_n) begin
        if (!reset_n) begin
            data_out <= 4'b0000;
        end else if (shift_en) begin
            // Shift left, new bit enters from LSB
            data_out <= {data_out[2:0], data_in};
        end
    end

endmodule
