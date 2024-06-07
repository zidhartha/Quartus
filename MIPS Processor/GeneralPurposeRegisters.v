module GeneralPurposeRegisters(
    input wire clk,
    input wire reset,
    input wire gp_we,
    input wire [4:0] read_addr1,
    input wire [4:0] read_addr2,
    input wire [4:0] write_addr,
    input wire [31:0] write_data,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);
    reg [31:0] registers [0:31];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize registers
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (gp_we) begin
            registers[write_addr] <= write_data;
        end
    end

    always @(*) begin
        read_data1 = registers[read_addr1];
        read_data2 = registers[read_addr2];
    end
endmodule 