module ImmediateExtension(
    input wire [15:0] instruction,
    output reg [31:0] sign_ext_imm,
    output reg [31:0] zero_ext_imm,
    output reg [31:0] extended_imm
);
    always @(*) begin
        sign_ext_imm = { {16{instruction[15]}}, instruction };
        zero_ext_imm = { 16'b0, instruction };
        // Use appropriate extension based on control signals if needed
        extended_imm = sign_ext_imm;  // Example assignment
    end
endmodule 