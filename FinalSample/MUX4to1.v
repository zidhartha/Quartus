module MUX4to1 (
    input [3:0] I,       // 4-bit input
    input [1:0] S,       // 2-bit select input
    output Y             // Output
);
    wire nS0, nS1;       // Complement of select inputs
    wire and0, and1, and2, and3; // Outputs of AND gates

    // Generate complement of select inputs
    not (nS0, S[0]);
    not (nS1, S[1]);

    // AND gates for each input line
    and (and0, I[0], nS1, nS0);
    and (and1, I[1], nS1, S[0]);
    and (and2, I[2], S[1], nS0);
    and (and3, I[3], S[1], S[0]);

    // OR gate to combine all AND gate outputs
    or (Y, and0, and1, and2, and3);

endmodule

module testbech0;
    reg [3:0] I;         // 4-bit input
    reg [1:0] S;         // 2-bit select input
    wire Y;              // Output

    // Instantiate the MUX
    MUX4to1 test(
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin
        // Test cases
        I = 4'b0001; S = 2'b00; #10;
        I = 4'b0010; S = 2'b01; #10;
        I = 4'b0100; S = 2'b10; #10;
        I = 4'b1000; S = 2'b11; #10;

        // Additional test cases
        I = 4'b1111; S = 2'b00; #10;
        I = 4'b1111; S = 2'b01; #10;
        I = 4'b1111; S = 2'b10; #10;
        I = 4'b1111; S = 2'b11; #10;

    end
endmodule
