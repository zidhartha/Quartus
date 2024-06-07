module InstructionDecoder (
    input [31:0] Instruction,
    output [5:0] Opcode,
    output [4:0] Rs, Rt, Rd, Shamt,
    output [5:0] Funct, output [15:0] Immediate, output [25:0] Address
);
    assign Opcode = Instruction[31:26];
    assign Rs = Instruction[25:21];
    assign Rt = Instruction[20:16];
    assign Rd = Instruction[15:11];
    assign Immediate = Instruction[15:0];
     assign Funct = Instruction[5:0];
     assign Shamt = Instruction[10:6];
     assign Address = Instruction[25:0];
endmodule 