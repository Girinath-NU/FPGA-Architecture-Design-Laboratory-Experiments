module counter_tb;

    logic clk;
    logic rst_n;
    logic [3:0] count;

    // Instantiate DUT
    counter uut (
        .clk   (clk),
        .rst_n (rst_n),
        .count (count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize signals
        rst_n = 0;
        #12;            // hold reset for a bit over a cycle
        rst_n = 1;

        // Run for 20 more clocks
        repeat (20) @(posedge clk);
        $finish;
    end

    // Monitor the count
    initial begin
        $display("Time\tReset\tCount");
        $monitor("%0t\t%b\t%0d", $time, rst_n, count);
    end

endmodule
