module MIPS_tb;
    reg clk;
    reg reset;
    reg init;
    reg [7:0] init_addr;
    reg [31:0] init_data;
    wire [31:0] aluresultout;
    wire [31:0] shiftresultout;
    wire [31:0] GP_DATA_INout;

    // Instantiate the processor
   MIPS uut (
        .clk(clk),
        .reset(reset),
        .init(init),
        .init_addr(init_addr),
        .init_data(init_data),
        .aluresultout(aluresultout),
        .shiftresultout(shiftresultout),
        .GP_DATA_INout(GP_DATA_INout)
    );

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        init = 0;
        #10;
        reset = 0;

        // Initialize instruction memory
        init = 1;
        init_addr = 0; init_data = 32'b10001100000000010000000000000100; // lw 
        #10;
        init_addr = 1; init_data = 32'b10101100000000010000000000001000; // sw 
        #10;
        init_addr = 2; init_data = 32'b00100000000000100000000000001010; // addi 
        #10;
        init_addr = 3; init_data = 32'b00100100000000100000000000001010; // addiu 
        #10;
        init_addr = 4; init_data = 32'b00101000000000100000000000001010; // subi 
        #10;
        init_addr = 5; init_data = 32'b00101100000000100000000000001010; // subiu 
        #10;
        init_addr = 6; init_data = 32'b00110000001000100000000000000100; // andi 
        #10;
        init_addr = 7; init_data = 32'b00110100001000100000000000000101; // ori 
        #10;
        init_addr = 8; init_data = 32'b00111000001000100000000000000110; // xori 
        #10;
        init_addr = 9; init_data = 32'b00111100000000100000000000000110; // lui 
        #10;
        init_addr = 10; init_data = 32'b00000100000000100000000000001000; // bltz
        #10;
        init_addr = 11; init_data = 32'b00000100001000100000000000001000; // bgez 
        #10;
        init_addr = 12; init_data = 32'b00010000001000100000000000000010; // beq 
        #10;
        init_addr = 13; init_data = 32'b00010100001000100000000000000010; // bne 
        #10;
        init_addr = 14; init_data = 32'b00011000001000100000000000000010; // blez 
        #10;
        init_addr = 15; init_data = 32'b00011100001000100000000000000010; // bgtz 
        #10;
        init_addr = 16; init_data = 32'b00000000001000100001100000000000; // sll 
        #10;
        init_addr = 17; init_data = 32'b00000000001000100001100000000010; // srl 
        #10;
        init_addr = 18; init_data = 32'b00000000001000100001100000000011; // sra
        #10;
        init_addr = 19; init_data = 32'b00000000001000100001100000000100; // sllv 
        #10;
        init_addr = 20; init_data = 32'b00000000001000100001100000000110; // srlv 
        #10;
        init_addr = 21; init_data = 32'b00000000001000100001100000000111; // srav 
        #10;
        init_addr = 22; init_data = 32'b00000000001000100001100000100000; // add 
        #10;
        init_addr = 23; init_data = 32'b00000000001000100001100000100001; // addu 
        #10;
        init_addr = 24; init_data = 32'b00000000001000100001100000100010; // sub 
        #10;
        init_addr = 25; init_data = 32'b00000000001000100001100000100011; // subu 
        #10;
        init_addr = 26; init_data = 32'b00000000001000100001100000100100; // and 
        #10;
        init_addr = 27; init_data = 32'b00000000001000100001100000100101; // or 
        #10;
        init_addr = 28; init_data = 32'b00000000001000100001100000100110; // xor 
        #10;
        init_addr = 29; init_data = 32'b00000000001000100001100000100111; // nor 
        #10;
        init_addr = 30; init_data = 32'b00000000001000100001100000101010; // slt 
        #10;
        init_addr = 31; init_data = 32'b00000000001000100001100000101011; // sltu 
        #10;
        init_addr = 32; init_data = 32'b00000000000000000000000000001000; // jr 
        #10;
        init_addr = 33; init_data = 32'b00000000000000000000000000001001; // jalr 
        #10;
        init_addr = 34; init_data = 32'b00001000000000000000000000000001; // j 
        #10;
        init_addr = 35; init_data = 32'b00001100000000000000000000000001; // jal 
        #10;
        init_addr = 36; init_data = 32'b00000000000000000000000000111111; // data (example)
        #10;

        init = 0;

        // Simulate for a sufficient amount of time
        #1000;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk;
endmodule
