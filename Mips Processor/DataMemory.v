module DataMemory(
    input clk,
    input MemWrite, MemRead,
    input [31:0] Address, WriteData,
    output [31:0] ReadData
);
    reg [31:0] memory [0:255];
    always @(posedge clk) begin
        if (MemWrite) begin 
                memory[Address[31:2]] <= WriteData;
            end
     end
    assign ReadData = (MemRead) ? memory[Address[31:2]] : 32'bz;
endmodule 