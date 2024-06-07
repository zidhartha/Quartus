module ALUControlUnit (
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [3:0] ALUControl
);
    always @(*) begin
        case (ALUOp)
            2'b00: // Load/Store
                ALUControl = 4'b0010; // ADD for LW and SW
            2'b01: // Branch
                ALUControl = 4'b0110; // SUB for BEQ and BNE
            2'b10: // R-type
                case (Funct)
                    6'b100000: ALUControl = 4'b0010; // ADD
                    6'b100001: ALUControl = 4'b0010; // ADDU
                    6'b100010: ALUControl = 4'b0110; // SUB
                    6'b100011: ALUControl = 4'b0110; // SUBU
                    6'b100100: ALUControl = 4'b0000; // AND
                    6'b100101: ALUControl = 4'b0001; // OR
                    6'b100110: ALUControl = 4'b0010; // XOR
                    6'b100111: ALUControl = 4'b1100; // NOR
                    6'b101010: ALUControl = 4'b0111; // SLT
                    6'b101011: ALUControl = 4'b0111; // SLTU
                    6'b000000: ALUControl = 4'b1000; // SLL
                    6'b000010: ALUControl = 4'b1001; // SRL
                    6'b000011: ALUControl = 4'b1010; // SRA
                    6'b000100: ALUControl = 4'b1011; // SLLV
                    6'b000110: ALUControl = 4'b1100; // SRLV
                    6'b000111: ALUControl = 4'b1101; // SRAV
                    6'b001000: ALUControl = 4'b1110; // JR
                    6'b001001: ALUControl = 4'b1111; // JALR
                    default: ALUControl = 4'b0000; // Default
                endcase 
					             2'b11: // Immediate-type (for ADDI, ANDI, etc.)
                case (Funct)
                    6'b001000: ALUControl = 4'b0010; // ADDI
                    6'b001001: ALUControl = 4'b0010; // ADDIU
                    6'b001010: ALUControl = 4'b0110; // SUBI
                    6'b001011: ALUControl = 4'b0110; // SUBIU
                    6'b001100: ALUControl = 4'b0000; // ANDI
                    6'b001101: ALUControl = 4'b0001; // ORI
                    6'b001110: ALUControl = 4'b0010; // XORI
                    6'b001111: ALUControl = 4'b1100; // LUI
                    default: ALUControl = 4'b0000; // Default
                endcase
            default: ALUControl = 4'b0000; // Default
        endcase
    end
endmodule 