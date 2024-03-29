module mux8(
    input [7:0] D,
    input [2:0] S,
    output reg out
);

always @* begin
    case(S)
        3'b000: out = D[0];
        3'b001: out = D[1];
        3'b010: out = D[2];
        3'b011: out = D[3];
        3'b100: out = D[4];
        3'b101: out = D[5];
        3'b110: out = D[6];
        3'b111: out = D[7];
        default: out = 1'b0;
    endcase
end

endmodule

module mux8_tb();
reg [7:0] D;
reg [2:0] S;
wire out;

mux8 uut (
    .D(D),
    .S(S),
    .out(out)
);

initial begin
    D = 8'b00000001;
    S = 3'b000; 
    #10;

    D = 8'b00000010;
    S = 3'b001; 
    #10;

    D = 8'b00000100;
    S = 3'b010; 
    #10;

    D = 8'b00000011;
    S = 3'b011; 
    #10;

    D = 8'b00001000;
    S = 3'b100; 
    #10;

    D = 8'b00010000;
    S = 3'b101; 
    #10;

    D = 8'b00100000;
    S = 3'b110; 
    #10;

    D = 8'b01000000;
    S = 3'b111; 
    #10;
end

endmodule 