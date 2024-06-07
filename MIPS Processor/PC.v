module PC(
    input wire clk,
    input wire reset,
    output reg [31:0] next_pc,
    output reg [31:0] pc_plus_4,
    output reg [31:0] branch_target,
    output reg [31:0] jump_target,
    input wire [1:0] pc_mux_sel
);
    reg [31:0] pc;

    always @(posedge clk or posedge reset) begin
        if (reset) 
            pc <= 32'b0;  // Initialize PC to 0 on reset
        else
            // Logic to update the PC
            pc <= next_pc;
    end

    always @(*) begin
        pc_plus_4 = pc + 4;
        // Calculate branch_target and jump_target here
        // Select next_pc based on pc_mux_sel
        next_pc = pc_plus_4; // Simple assignment for now
    end
endmodule 