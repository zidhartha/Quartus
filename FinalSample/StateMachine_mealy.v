module StateMachine_mealy (

  input wire clk,       // Clock 
  input wire reset,     // Reset signal
  input wire in,        // Input 
  output reg [1:0] state, // Current state
  output reg out        // Output signal
);

  // State encoding
  parameter S00 = 2'b00, S01 = 2'b01, S10 = 2'b10, S11 = 2'b11;
  
  // Initial state
  initial begin
    state = S00;
    out = 0;
  end

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= S00;
      out <= 0;
    end else begin
      case (state)
        S00: begin
          if (in) begin
            state <= S01;
            out <= 0;
          end else begin
            state <= S00;
            out <= 0;
          end
        end
        S01: begin
          if (in) begin
            state <= S11;
            out <= 0;
          end else begin
            state <= S00;
            out <= 1;
          end
        end
        S10: begin
          if (in) begin
            state <= S10;
            out <= 0;
          end else begin
            state <= S00;
            out <= 1;
          end
        end
        S11: begin
          if (in) begin
            state <= S10;
            out <= 0;
          end else begin
            state <= S00;
            out <= 1;
          end
        end
        default: begin
          state <= S00;
          out <= 0;
        end
      endcase
    end
  end
endmodule