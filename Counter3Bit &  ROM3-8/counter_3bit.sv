module counter_3bit (
    input clk,
    input reset,
    input set,
    input load,
    output reg [2:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 3'b000;
    else if (set)
        count <= 3'b111;
    else if (load)
        count <= count + 1;
end

endmodule