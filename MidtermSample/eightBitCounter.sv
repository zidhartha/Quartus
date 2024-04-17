module eightBitCounter(input clk,reset,output reg [7:0] state);
 always @(posedge clk)
 begin 
 if(reset)
 state = 8'b0;
 else
 state <= state +1;
 end 
 endmodule
 
 
 module eightBitCounter_tb();
 reg clk;
 reg reset;
 wire [7:0] state;
 
 eightBitCounter counter(
 .clk(clk),.reset(reset),.state(state));
 initial clk = 1;
 always #5 clk = ~clk;
 
 initial begin
 reset = 1;
 #10;
 reset = 0;
 
 end 
 endmodule
 
  