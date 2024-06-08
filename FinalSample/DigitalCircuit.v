module DigitalCircuit(
    input wire clk,
    input wire reset,
    input wire X,
    output reg Z
);
    reg A, B;
    
    wire DA, DB;
    
    assign DA = X & ~B;
    assign DB = X & ~A;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 1'b0;
            B <= 1'b0;
        end else begin
            A <= DA;
            B <= DB;
        end
    end
    
    always @(*) begin
        Z = A | B;
    end
endmodule 

module testbech3;
    reg clk;
    reg reset;
    reg X;
    wire Z;
    
    // Instantiate the Unit Under Test (UUT)
    DigitalCircuit test(
        .clk(clk),
        .reset(reset),
        .X(X),
        .Z(Z)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10 time units
    end
    
    // Test stimulus
    initial begin
        // Initialize Inputs
        reset = 1;
        X = 0;
        #10;
        
        reset = 0;
        #10;
        
        // Apply test vectors
        X = 1;
        #20;
        
        X = 0;
        #20;
        
        X = 1;
        #20;
        
        reset = 1; // Reset the circuit
        #10;
        
        reset = 0;
        #20;
        
    end
endmodule 