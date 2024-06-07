module InstructionMemory (
    input [31:0] Address,
    output reg [31:0] Instruction
);
    reg [31:0] memory [0:255];  // Define memory with 256 32-bit words
    initial begin
        memory[0] = 32'h8C220004; // LW
        memory[1] = 32'hAC220004; // SW
        memory[2] = 32'h20220004; // ADDI
        memory[3] = 32'h24220004; // ADDIU
        memory[4] = 32'h28220004; // SUBI
        memory[5] = 32'h2C220004; // SUBIU
        memory[6] = 32'h30220004; // ANDI
        memory[7] = 32'h34220004; // ORI
        memory[8] = 32'h38220004; // XORI
        memory[9] = 32'h3C220004; // LUI
        memory[10] = 32'h04220004; // BLTZ
        memory[11] = 32'h06220004; // BGEZ
        memory[12] = 32'h10220004; // BEQ
        memory[13] = 32'h14220004; // BNE
        memory[14] = 32'h18220004; // BLEZ
        memory[15] = 32'h1C220004; // BGTZ
        memory[16] = 32'h00224040; // SLL
        memory[17] = 32'h00224042; // SRL
        memory[18] = 32'h00224043; // SRA
        memory[19] = 32'h00224004; // SLLV
        memory[20] = 32'h00224006; // SRLV
        memory[21] = 32'h00224007; // SRAV
        memory[22] = 32'h00224020; // ADD
        memory[23] = 32'h00224021; // ADDU
        memory[24] = 32'h00224022; // SUB
        memory[25] = 32'h00224023; // SUBU
        memory[26] = 32'h00224024; // AND
        memory[27] = 32'h00224025; // OR
        memory[28] = 32'h00224026; // XOR
        memory[29] = 32'h00224027; // NOR
        memory[30] = 32'h0022402A; // SLT
        memory[31] = 32'h0022402B; // SLTU
        memory[32] = 32'h00224008; // JR
        memory[33] = 32'h00224009; // JALR
        memory[34] = 32'h08000009; // J
        memory[35] = 32'h0C000009; // JAL
    end 
	 
	     always @(*) begin
        Instruction = memory[Address[31:2]];  // word-aligned
    end
endmodule 