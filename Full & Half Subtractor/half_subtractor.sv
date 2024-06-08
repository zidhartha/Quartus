module half_subtractor(
    input A, input B, output difference, output borrow
	 );
	 
	assign difference = A^B;
	assign borrow = ~A&B;
	
	endmodule
	
	
	module halfSub_tb();
	reg A,B;
	wire difference,borrow;
	
	half_subtractor uut0(.A(A),.B(B),.difference(difference),.borrow(borrow));
	
	initial begin
        A = 0; B = 0;
        #10;
        A = 0; B = 1;
        #10;
        A = 1; B = 0;
        #10;
        A = 1; B = 1;
        #10;
    end
endmodule	
	 