module fullAdder1(input a,b,cin, output sum,cout);

assign sum = a^b^cin;
assign cout = (a&b)|(cin&(a^b));

endmodule


module EightBitAdder(
input [7:0] a,
input [7:0] b,
output [7:0] sum,
output [7:0] cout
);
fullAdder1 mg0(a[0], b[0], 1'b0, sum[0], cout[0]);
fullAdder1 mg1(a[1], b[1], cout[0], sum[1], cout[1]);
fullAdder1 mg2(a[2], b[2], cout[1], sum[2], cout[2]);
fullAdder1 mg3(a[3], b[3], cout[2], sum[3], cout[3]);
fullAdder1 mg4(a[4], b[4], cout[3], sum[4], cout[4]);
fullAdder1 mg5(a[5], b[5], cout[4], sum[5], cout[5]);
fullAdder1 mg6(a[6], b[6], cout[5], sum[6], cout[6]);
fullAdder1 mg7(a[7], b[7], cout[6], sum[7], cout[7]);
endmodule 

module adder8bit();
reg[7:0] a,b;
wire[7:0] sum,cout;
EightBitAdder y(
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );
initial begin 
 a = 8'b1011;
 b = 8'b0100;
 end 
 endmodule 