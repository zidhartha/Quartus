module encoder(   //8-3 encoder
    input  [0:7] x,
    output reg [0:2] z
);

always @(*) begin
    case (x)
        8'b00000001: z = 3'b000; // input 1
        8'b00000010: z = 3'b001; // input 2
        8'b00000100: z = 3'b010; // input 3
        8'b00001000: z = 3'b011; // input 4
        8'b00010000: z = 3'b100; // input 5
        8'b00100000: z = 3'b101; // input 6
        8'b01000000: z = 3'b110; // input 7
        8'b10000000: z = 3'b111; // input 8
        default: z = 3'b000; // Default case, output all zeros
    endcase
end

endmodule

module test;
reg [0:7] a;
wire [0:2] out;
  
encoder encoder1(
    .x(a),
    .z(out)
);
  
initial begin
    a = 8'b00000000; #10; 
    a = 8'b00000001; #10;
    a = 8'b00000010; #10;
    a = 8'b00100000; #10;
    a = 8'b01000000; #10;
    a = 8'b10000000; #10;
end
endmodule