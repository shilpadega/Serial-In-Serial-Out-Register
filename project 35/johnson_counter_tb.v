`timescale 1ns/1ps

module johnson_counter_tb;

    reg clk;
    reg reset;

    wire [3:0] q;

    integer errors;

    // Instantiate DUT
    johnson_counter dut (
        .clk   (clk),
        .reset (reset),
        .q     (q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("dump.vcd");
        $dumpvars(0, johnson_counter_tb);

        errors = 0;

        clk   = 1'b0;
        reset = 1'b1;

        $display("======================================");
        $display("     4-BIT JOHNSON COUNTER TEST");
        $display("======================================");
        $display("Time\tReset\tQ");
        $display("--------------------------------------");

        // Reset
        #10;

        if (q !== 4'b0000) begin
            $display("ERROR: Reset state = %b", q);
            errors = errors + 1;
        end
        else begin
            $display("%0t\t%b\t%b\tRESET PASS",
                     $time, reset, q);
        end

        // Release reset
        reset = 1'b0;

        // Check 8 Johnson counter states
        @(posedge clk);
        #1;
        if (q !== 4'b0001) begin
            $display("ERROR: Expected 0001, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b0011) begin
            $display("ERROR: Expected 0011, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b0111) begin
            $display("ERROR: Expected 0111, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b1111) begin
            $display("ERROR: Expected 1111, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b1110) begin
            $display("ERROR: Expected 1110, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b1100) begin
            $display("ERROR: Expected 1100, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b1000) begin
            $display("ERROR: Expected 1000, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        @(posedge clk);
        #1;
        if (q !== 4'b0000) begin
            $display("ERROR: Expected 0000, Got %b", q);
            errors = errors + 1;
        end
        else
            $display("%0t\t%b\t%b\tPASS", $time, reset, q);

        // Final result
        $display("--------------------------------------");

        if (errors == 0)
            $display("TEST RESULT: PASS");
        else
            $display("TEST RESULT: FAIL - %0d errors", errors);

        $display("======================================");

        #10;
        $finish;

    end

endmodule
