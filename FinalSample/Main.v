module Main (
    input clk,          // Clock signal
    input reset,        // Reset signal
    input in,           // Input signal
    output reg out      // Output signal
);
	 parameter S00 = 2'b00;//we can use localparam instead of parameters too
    parameter S01 = 2'b01;
    parameter S10 = 2'b10;
    parameter S11 = 2'b11;

    reg [1:0] current_state, next_state;

    // State transition and output logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S00; // Reset to initial state S00
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S00: begin
                if (in)
                    next_state = S10;
                else
                    next_state = S00;
                out = 0;
            end
            S01: begin
                if (in)
                    next_state = S11;
                else
                    next_state = S00;
                out = 1;
            end
            S10: begin
                if (in)
                    next_state = S00;
                else
                    next_state = S11;
                out = 0;
            end
            S11: begin
                if (in)
                    next_state = S01;
                else
                    next_state = S10;
                out = 0;
            end
            default: begin
                next_state = S00;
                out = 0;
            end
        endcase
    end
endmodule

module testbech2;
    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the FSM
    Main test(
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Apply test vectors
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;

    end
endmodule
