module RegisterFile (
    input clk,
    input [4:0] ReadReg1, ReadReg2, WriteReg,
    input [31:0] WriteData,
    input RegWrite,
    output [31:0] ReadData1, ReadData2
);
    reg [31:0] Regs[31:0];
    
    always @(posedge clk ) begin
            if (RegWrite) begin
                Regs[WriteReg] <= WriteData;
            end
        end
        
        assign ReadData1 = Regs[ReadReg1];
        assign ReadData2 = Regs[ReadReg2];
endmodule 