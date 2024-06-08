module ALU(input wire i, input wire [31:0] SrcA, input wire [31:0] SrcB, input wire [3:0] af, output reg [31:0] Alures, output reg Zero, output reg Neg, output reg ovfalu);

  
  always @*
  begin
    case (af)
	 //I-type instructions
      4'b0000: Alures = (i == 1) ? SrcA + {{24{SrcB[31]}}, SrcB[31:0]} : SrcA + SrcB; // ADD
      4'b0001: Alures = (i == 1) ? SrcA - {{24{SrcB[31]}}, SrcB[31:0]} : SrcA - SrcB; // SUB
      4'b0010: Alures = (i == 1) ? SrcA & {{24{SrcB[31]}}, SrcB[31:0]} : SrcA & SrcB; // AND
      4'b0011: Alures = (i == 1) ? SrcA | {{24{SrcB[31]}}, SrcB[31:0]} : SrcA | SrcB; // OR
      4'b0100: Alures = (i == 1) ? SrcA ^ {{24{SrcB[31]}}, SrcB[31:0]} : SrcA ^ SrcB; // XOR
      4'b0101: Alures = (i == 1) ? SrcA << {{24{SrcB[31]}}, SrcB[31:0]} : SrcA << SrcB; // SLL
      4'b0110: Alures = (i == 1) ? SrcA >> {{24{SrcB[31]}}, SrcB[31:0]} : SrcA >> SrcB; // SRL
      4'b0111: Alures = (i == 1) ? SrcA << SrcB[4:0] : SrcA >> SrcB; // SRA

      // R-Type Instructions
      4'b1000: Alures = SrcA & SrcB; // AND
      4'b1001: Alures = SrcA | SrcB; // OR
      4'b1010: Alures = SrcA + SrcB; // ADD
      4'b1011: Alures = SrcA - SrcB; // SUB
      4'b1100: Alures = (SrcA < SrcB) ? 1 : 0; // SLT
      4'b1101: Alures = SrcA << SrcB[4:0]; // SLL
      4'b1110: Alures = SrcA >> SrcB[4:0]; // SRL
    endcase

    // Set flags
    Zero = (Alures == 0) ? 1'b1 : 1'b0;
    Neg = (Alures[31] == 1) ? 1'b1 : 1'b0;
    ovfalu = (Alures[31] != Alures[30]) ? 1'b1 : 1'b0;
  end
endmodule