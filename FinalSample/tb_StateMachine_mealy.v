module tb_StateMachine_mealy;
  reg clk = 0;        // Clock 
  reg reset;      // Reset signal
  reg in;         // Input 
  wire [1:0] state; // Current state
  wire out;       // Output 


  StateMachine_mealy uut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .state(state),
    .out(out)
  );

    
    always #5 clk = ~clk; 

  initial begin
    
    // Initialize inputs
    reset = 1; in = 0; #10;
    reset = 0; #10;
    
    // Test sequence
    in = 0; #10;  // next state: 00, out: 0
    in = 1; #10;  // next state: 01, out: 0
    in = 0; #10;  // next state: 00, out: 1
    in = 1; #10;  // next state: 01, out: 0
    in = 1; #10;  // next state: 11, out: 0
    in = 1; #10;  // next state: 10, out: 0
    in = 1; #10;  // next state: 10, out: 0
    in = 0; #10;  // next state: 00, out: 1
    in = 0; #10;  // next state: 00, out: 0

    $stop;
  end
endmodule