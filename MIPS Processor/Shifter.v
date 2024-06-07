module Shifter(
    input wire [31:0] data,
    input wire [4:0] shift_amount,
    output reg [31:0] shift_result
);
    always @(*) begin
        // Define shifting operations
        shift_result = data << shift_amount;
    end
endmodule 