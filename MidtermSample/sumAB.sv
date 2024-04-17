module sumAB(input clk,input [3:0] a,x,b, output reg [3:0] y);
   always@(posedge clk)
	begin 
	y= a*x;
	y=y+b;
	end
	endmodule
	
	
	module sumA();
	reg clk_in;
	reg [3:0] a,x,b;
	wire [3:0] y;
	always 
	#10
	clk_in = ~clk_in;
	sumAB m(clk_in,a,x,b,y);
	initial begin
	clk_in = 0;
	a= 4'b0001;
	b= 4'b0001;
	x = 4'b0011;
	end
	endmodule
	