module full_adder (
    input a, b, cin,
    output sum, cout
);
    // XOR gate for sum
    assign sum = a ^ b ^ cin;
    // AND and OR gates for carry out
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module Subtractor4bit (
    input [3:0] A, B,
    output [3:0] Diff,
    output Cout
);
    wire [3:0] B_comp; // Complement of B
    wire [3:0] Sum; // Sum of A and B's complement
    wire C1, C2, C3; // Carry wires

    // Inverting the bits of B (1's complement)
    assign B_comp = ~B;

    // Instantiate the full adders for the subtraction
    full_adder FA0 (.a(A[0]), .b(B_comp[0]), .cin(1'b1), .sum(Sum[0]), .cout(C1));
    full_adder FA1 (.a(A[1]), .b(B_comp[1]), .cin(C1), .sum(Sum[1]), .cout(C2));
    full_adder FA2 (.a(A[2]), .b(B_comp[2]), .cin(C2), .sum(Sum[2]), .cout(C3));
    full_adder FA3 (.a(A[3]), .b(B_comp[3]), .cin(C3), .sum(Sum[3]), .cout(Cout));

    // Assign the result
    assign Diff = Sum;

endmodule

module testbench;
    reg [3:0] A, B;
    wire [3:0] Diff;
    wire Cout;

    // Instantiate the subtractor
    Subtractor4bit test(
        .A(A),
        .B(B),
        .Diff(Diff),
        .Cout(Cout)
    );

    initial begin 

        // Test cases
        A = 4'b0101; B = 4'b0011; #10; // 5 - 3
        A = 4'b1001; B = 4'b0100; #10; // 9 - 4
        A = 4'b0110; B = 4'b0111; #10; // 6 - 7
        A = 4'b1111; B = 4'b0001; #10; // 15 - 1
        A = 4'b0000; B = 4'b0001; #10; // 0 - 1

    end
endmodule
