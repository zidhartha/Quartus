module HalfAdder(sum,carry,x,y);

input x,y;
output sum,carry;

xor(sum,x,y);
and(carry,x,y);

endmodule


module HalfAdder1;
reg x,y;
wire sum,carry;
HalfAdder ha(sum,carry,x,y);

initial begin
$display("x y sum carry");
$monitor(x," ",y," ",sum," ",carry);

      x=0; y=0;
#10;  x=0; y=1;
#10;	x=1; y=0;
#10;	x=1; y=1;
#10;
end
endmodule