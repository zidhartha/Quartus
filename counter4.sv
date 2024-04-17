module counter4(input clk, reset,output reg [3:0] out);  
 
always @ (posedge clk ) begin
	if(! reset)  
		out <= 0;
	else			
		out <= out + 1;
end
 
endmodule
module count_4_bit_test();
 
reg clk;

reg reset;

wire [3:0] out;
 
counter4 uut0(

.clk(clk),

.reset(reset),

.out(out)

);
 
 
always #5 clk = ~clk; // change the value of clock every 5 ns
 
initial begin 

clk <= 0;

reset <= 0;

#20;

reset <=1;

#20;

reset <= 0;

#20;

reset <=1;

end

endmodule
