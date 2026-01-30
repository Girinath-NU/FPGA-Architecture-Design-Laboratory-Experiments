`timescale 1ns/1ps

module counter (
    input  logic clk_50mhz,   // 50 MHz input clock
    input  logic rst_n,       // active-low reset
    output logic [3:0] count  // 4-bit counter output
);

    // Divider signals
    logic [25:0] div_count;   // enough bits to count up to 50,000,000
    logic clk_1hz;

    // Clock divider: generate 1 Hz clock from 50 MHz
    always_ff @(posedge clk_50mhz or negedge rst_n) begin
        if (!rst_n) begin
            div_count <= 0;
            clk_1hz   <= 0;
        end else begin
            if (div_count == 49_999_999) begin
                div_count <= 0;
                clk_1hz   <= ~clk_1hz; // toggle output clock
            end else begin
                div_count <= div_count + 1;
            end
        end
    end

    // 4-bit counter driven by 1 Hz clock
    always_ff @(posedge clk_1hz or negedge rst_n) begin
        if (!rst_n)
            count <= 0;
        else
            count <= count + 1;
    end

endmodule
