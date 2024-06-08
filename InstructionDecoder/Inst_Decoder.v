module Inst_Decoder(input [31:0] instruction, output reg [3:0] Af, output reg I, output reg ALU_MUX_SEL, output reg [4:0] Cad, output reg GP_WE,
	 output reg [1:0] GP_MUX_SEL, output reg [3:0] Bf, output reg DM_WE, output reg [2:0] Shift_type, output reg [1:0] PC_MUX_Select
);

    // Define the fields from the instruction
    wire [5:0] opc = instruction[31:26];
    wire [4:0] rs = instruction[25:21];
    wire [4:0] rt = instruction[20:16];
    wire [4:0] rd = instruction[15:11];
    wire [15:0] imm = instruction[15:0];
    wire [4:0] sa = instruction[10:6];
    wire [5:0] fun = instruction[5:0];
    wire [25:0] iindex = instruction[25:0];

    always @(*) begin
        // Default values
        Af = 4'b0000;
        I = 1'b0;
        ALU_MUX_SEL = 1'b0;
        Cad = 5'b00000;
        GP_WE = 1'b0;
        GP_MUX_SEL = 2'b00;
        Bf = 4'b0000;
        DM_WE = 1'b0;
        Shift_type = 3'b000;
        PC_MUX_Select = 2'b00;

        case (opc)
            // I-Type instructions
            6'b100011: begin // LW
                Af = 4'b0010; 
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b01; // From MEMORY
            end
            6'b101011: begin // SW
                Af = 4'b0010; 
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                DM_WE = 1'b1;
            end
            6'b001000: begin // ADDI
                Af = 4'b0000; 
                I = 1'b1;
                ALU_MUX_SEL = 1'b1;
                Cad = rt;
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b00; // From ALU
            end
            

            // R-Type instructions
            6'b000000: begin
                case (fun)
                    6'b100000: begin // ADD
                        Af = 4'b0000; 
                        ALU_MUX_SEL = 1'b0;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00; // From ALU
                    end
                    6'b100010: begin // SUB
                        Af = 4'b0001; 
                        ALU_MUX_SEL = 1'b0;
                        Cad = rd;
                        GP_WE = 1'b1;
                        GP_MUX_SEL = 2'b00; // From ALU
                    end
                endcase
            end

            // J-Type instructions
            6'b000010: begin // J
                PC_MUX_Select = 2'b10; 
            end
            6'b000011: begin // JAL
                PC_MUX_Select = 2'b10; // Based on currend PC and jump index
                GP_WE = 1'b1;
                GP_MUX_SEL = 2'b11; 
            end

            // Branch instructions
            6'b000100: begin // BEQ
                Bf = 4'b0001; 
                PC_MUX_Select = 2'b01; // Branching based on PC and branch distance
            end
        endcase
    end

endmodule 