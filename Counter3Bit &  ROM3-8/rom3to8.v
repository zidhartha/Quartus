module rom3to8(
    input [2:0] address,
    input sel,
    output reg [7:0] data
);

always @(sel or address) begin
    if (~sel) begin
        data = 8'd0;
    end
    else begin
        case(address)
            3'b000: data = 8'd01;
            3'b001: data = 8'd02;
            3'b010: data = 8'd03;
            3'b011: data = 8'd04;
            3'b100: data = 8'd05;
            3'b101: data = 8'd06;
            3'b110: data = 8'd07;
            3'b111: data = 8'd08;
            default: data = 8'd0;
        endcase
    end
end

endmodule 