module FullAdder(sum, carry, a, b, c);
		input a,b,c;						
		output sum, carry;						
		assign sum = (a^b)^c;
		assign carry = (c&(a^b))|(a&b);
		
endmodule 

module FullAdder1;
  reg a, b, c;
  wire sum, carry;
  
  FullAdder fa(sum, carry, a, b, c);

  initial begin
    $display("a b c sum carry");
    $monitor(a," ",b," ",c," ",sum," ",carry);

    a = 0; b = 0; c = 0; #10;
    a = 0; b = 0; c = 1; #10;
    a = 0; b = 1; c = 0; #10;
    a = 0; b = 1; c = 1; #10;
    a = 1; b = 0; c = 0; #10;
    a = 1; b = 0; c = 1; #10;
    a = 1; b = 1; c = 0; #10;
    a = 1; b = 1; c = 1; #10;
	 
	 end
endmodule 