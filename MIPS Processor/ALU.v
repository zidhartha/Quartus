module ALU(
    input wire [31:0] operand1,
    input wire [31:0] operand2,
    input wire [3:0] alu_control,
    output reg [31:0] result
);
    always @(*) begin
        case (alu_control)
            // Define ALU operations here
            4'b0000: result = operand1 & operand2; // AND
            4'b0001: result = operand1 | operand2; // OR
            4'b0010: result = operand1 + operand2; // ADD
            4'b0110: result = operand1 - operand2; // SUB
            4'b0111: result = (operand1 < operand2) ? 1 : 0; // SLT
            4'b1100: result = ~(operand1 | operand2); // NOR
            default: result = 32'b0;
        endcase
    end
endmodule 