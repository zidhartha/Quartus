module decoder(x,y,z); //2-4 decoder
		input x,y;
		output [0:3]z;
		assign z[0] = ~x&~y,
				 z[1] = ~x&y,
				 z[2] = x&~y,
				 z[3] = x&y;
endmodule

module decoder1; 
  reg a,b;
  wire [0:3]out;
  
  decoder decoder1(
  .x(a), .y(b), .z(out)
  );
  
  initial begin //testbenchi decoderistvis
  a = 1'b0;b = 1'b0; #20;
  a = 1'b0;b = 1'b1; #20;
  a = 1'b1;b = 1'b0; #20;
  a = 1'b1;b = 1'b1; #20;
  
  end
endmodule 