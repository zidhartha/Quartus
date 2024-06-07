module MIPS (input clk, reset);
    wire [31:0] PC, NextPC, Instruction, ReadData1, ReadData2, SignExtImm, ALUResult, MemData;
    wire [4:0] WriteReg;
    wire [3:0] ALUControl;
    wire [1:0] ALUOp;
    wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Zero;
    // pc
    reg [31:0] PC_reg;
    always @(posedge clk or posedge reset ) begin
            if (reset) PC_reg <= 0;
            else PC_reg <= NextPC;
    end
    assign PC=PC_reg;
    // instruction memory
    InstructionMemory imem(.Address(PC), .Instruction(Instruction));
    // instruction deocoder
    wire [5:0] Opcode, Funct;
    wire [4:0] Rs, Rt, Rd, Shamt;
    wire [15:0] Immediate;
    InstructionDecoder idec(
        .Instruction(Instruction),
        .Opcode(Opcode), .Rs(Rs), .Rt(Rt),
        .Rd(Rd), .Shamt(Shamt), .Funct(Funct),
        .Immediate(Immediate)
    );
    //control unit
    ControlUnit cu(
        .Opcode(Opcode),
        .RegDst(RegDst), .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg), .MemWrite(MemWrite),
        .Branch(Branch), .ALUOp(ALUOp)
    );
    // register file
     RegisterFile rf (
            .clk(clk), .ReadReg1(Rs), . ReadReg2(Rt), .WriteReg(WriteReg),
            .WriteData(MemtoReg ? MemData : ALUResult), .RegWrite(RegWrite),
            .ReadData1(ReadData1), .ReadData2(ReadData2)
     );
     // sign extend immediate
     assign SignExtImm = {{16{Immediate[15]}}, Immediate};
     // alu control unit
     ALUControlUnit alucontrol (
            .ALUOp(ALUOp), .Funct(Funct), . ALUControl(ALUControl));
     // alu
     ALU alu (
        .A(ReadData1), .B(ALUSrc ? SignExtImm : ReadData2),
        .ALUControl(ALUControl), .Result(ALUResult), .Zero(Zero));// data memory
            DataMemory dmem (
            .clk(clk), .Address(ALUResult), .WriteData(ReadData2),
            .MemWrite(MemWrite), .MemRead(MemRead), .ReadData(MemData)
     );
     
     // write register
     assign WriteReg = (RegDst) ? Rd : Rt;
     
     // next pc logic
     assign NextPC = (Branch & Zero) ? (PC + 4 + (SignExtImm << 2)) : (PC + 4);
     
endmodule 