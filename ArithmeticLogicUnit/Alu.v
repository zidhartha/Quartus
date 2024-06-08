module Alu(
 input wire i,
 input wire [31:0] SrcA,
 input wire [31:0] SrcB,
 input wire [3:0] af,
 output reg [31:0] Alures,
 output reg Zero,
 output reg Neg,
 output reg ovfalu
);
 wire [31:0] imm_ext;
 assign imm_ext = { {16{SrcB[15]}}, SrcB[15:0] }; // sign-extend immediate
 wire [31:0] opB;
 assign opB = i ? imm_ext : SrcB;
 always @(*) begin
 case (af)
 4'b0000: Alures = SrcA + opB; // addi
 4'b0001: Alures = SrcA + opB; // addiu (no overflow detection)
 4'b0010: Alures = ($signed(SrcA) < $signed(opB)) ? 32'b1 : 32'b0; // slti
 4'b0011: Alures = (SrcA < opB) ? 32'b1 : 32'b0; // sltiu
 4'b0100: Alures = SrcA & opB; // andi
 4'b0101: Alures = SrcA | opB; // ori
 4'b0110: Alures = SrcA ^ opB; // xori
 4'b0111: Alures = { opB[15:0], 16'b0 }; // lui
 default: Alures = 32'b0;
 endcase
 // Flags
 Zero = (Alures == 32'b0) ? 1'b1 : 1'b0;
 Neg = (Alures[31] == 1'b1) ? 1'b1 : 1'b0;
 ovfalu = 1'b0;
 if (af == 4'b0000 || af == 4'b0010) begin // Only add and slt instructions can overflow
 if ((SrcA[31] == opB[31]) && (Alures[31] != SrcA[31])) begin
 ovfalu = 1'b1;
 end
 end
 end
endmodule 