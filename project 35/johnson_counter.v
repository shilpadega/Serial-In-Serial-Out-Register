`timescale 1ns/1ps

module johnson_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] q
);

    // 4-bit Johnson Counter
    // Inverted output of the last flip-flop
    // is fed back to the first flip-flop.

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], ~q[3]};
    end

endmodule
