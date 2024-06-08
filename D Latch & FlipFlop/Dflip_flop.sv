module Dflip_flop(
    input wire D,
	 input wire clk,
	 output reg Q
	 );
	 
	 always @(posedge clk)
	    Q <= D;
		 
		 
		 endmodule 
