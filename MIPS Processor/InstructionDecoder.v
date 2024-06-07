module InstructionDecoder(
    input wire [31:0] instruction,
    output reg [3:0] alu_control,
    output reg alu_src,
    output reg [1:0] pc_mux_sel,
    output reg [1:0] gp_mux_sel,
    output reg branch,
    output reg jump,
    output reg mem_to_reg,
    output reg reg_dst,
    output reg gp_we
);
    // Add the logic for the instruction decoder here
    always @(*) begin
        // Decode instruction here
        alu_control = 4'b0000;
        alu_src = 0;
        pc_mux_sel = 2'b00;
        gp_mux_sel = 2'b00;
        branch = 0;
        jump = 0;
        mem_to_reg = 0;
        reg_dst = 0;
        gp_we = 0;
    end
endmodule