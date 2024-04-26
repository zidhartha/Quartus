module barrelshifter_4bit(input clock, input [1:0] SA, input left, input [3:0] in, output reg [3:0] out=0);

always @(posedge clock) begin
    if (left) begin
        out <= in << SA;
    end
    else begin
        out <= in >> SA;
    end
end

endmodule
