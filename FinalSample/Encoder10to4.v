module Encoder10to4 (
    input [9:0] In,     // 10-bit input
    input En,           // Enable input
    output reg [3:0] Out // 4-bit output
);
    always @(*) begin
        if (En) begin
            case (1'b1) // Priority encoder
                In[9]: Out = 4'd9;
                In[8]: Out = 4'd8;
                In[7]: Out = 4'd7;
                In[6]: Out = 4'd6;
                In[5]: Out = 4'd5;
                In[4]: Out = 4'd4;
                In[3]: Out = 4'd3;
                In[2]: Out = 4'd2;
                In[1]: Out = 4'd1;
                In[0]: Out = 4'd0;
                default: Out = 4'd0;
            endcase
        end else begin
            Out = 4'd0; // If enable is not active, output is 0
        end
    end
endmodule

module testbech1;
    reg [9:0] In;      // 10-bit input
    reg En;            // Enable input
    wire [3:0] Out;    // 4-bit output

    // Instantiate the encoder
    Encoder10to4 test(
        .In(In),
        .En(En),
        .Out(Out)
    );

    initial begin
        // Test cases
        En = 1; In = 10'b0000000001; #10; // Input 0
        En = 1; In = 10'b0000000010; #10; // Input 1
        En = 1; In = 10'b0000000100; #10; // Input 2
        En = 1; In = 10'b0000001000; #10; // Input 3
        En = 1; In = 10'b0000010000; #10; // Input 4
        En = 1; In = 10'b0000100000; #10; // Input 5
        En = 1; In = 10'b0001000000; #10; // Input 6
        En = 1; In = 10'b0010000000; #10; // Input 7
        En = 1; In = 10'b0100000000; #10; // Input 8
        En = 1; In = 10'b1000000000; #10; // Input 9

        // Test with enable off
        En = 0; In = 10'b0000000001; #10; // Input 0 with enable off
        En = 0; In = 10'b0000000010; #10; // Input 1 with enable off
    end
endmodule

