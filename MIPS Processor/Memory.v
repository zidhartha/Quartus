module Memory(
    input wire clk,
    input wire [31:0] address,
    input wire [31:0] write_data,
    input wire mem_to_reg,
    output reg [31:0] read_data
);
    reg [31:0] memory [0:255];  // Example memory size

    always @(posedge clk) begin
        if (mem_to_reg) begin
            read_data <= memory[address[7:0]];
        end else begin
            memory[address[7:0]] <= write_data;
        end
    end
endmodule 