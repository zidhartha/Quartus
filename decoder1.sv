module decoder1(input[1:0] a,output [3:0] data);
always @(*)
begin
   case(a)
	      2'b00 : data = 4'b0001;
			2'b01 : data = 4'b0010;
			2'b10 : data = 4'b0100;
			2'b11 : data = 4'b1000;
			endcase
		end
	endmodule
	
