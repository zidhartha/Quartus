module encoder1(x,y,z); //this is the 2-4 encoder
		input x,y;
		output [0:3]z;
		assign z[0] = ~x&~y,
				 z[1] = ~x&y,
				 z[2] = x&~y,
				 z[3] = x&y;
endmodule

module encoder1;
  reg a,b;
  wire [0:3]out;
  
  encoder1 encoder(
  .x(a), .y(b), .z(out)
  );
  
  initial begin
  a = 1'b0;b = 1'b0; #10;
  a = 1'b0;b = 1'b1; #10;
  a = 1'b1;b = 1'b0; #10;
  a = 1'b1;b = 1'b1; #10;
  
  end
endmodule