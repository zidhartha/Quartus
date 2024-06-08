module Alu_tb;
 reg i;
 reg [31:0] SrcA;
 reg [31:0] SrcB;
 reg [3:0] af;
 wire [31:0] Alures;
 wire Zero;
 wire Neg;
 wire ovfalu;
 Alu uut (
 .i(i),
 .SrcA(SrcA),
 .SrcB(SrcB),
 .af(af),
 .Alures(Alures),
 .Zero(Zero),
 .Neg(Neg),
 .ovfalu(ovfalu)
 );
 initial begin
 // Initialize inputs
 i = 0; SrcA = 0; SrcB = 0; af = 0;
 #10;
 // Test addi
 i = 1; SrcA = 32'd10; SrcB = 32'd20; af = 4'b0000;
 #10;
 // Test addiu
 i = 1; SrcA = 32'd30; SrcB = 32'd20; af = 4'b0001;
 #10;
 // Test slti
 i = 1; SrcA = 32'd5; SrcB = 32'd10; af = 4'b0010;
 #10;
 // Test sltiu
 i = 1; SrcA = 32'd5; SrcB = 32'd10; af = 4'b0011;
 #10;
 // Test andi
 i = 1; SrcA = 32'd15; SrcB = 32'd1; af = 4'b0100;
 #10;
 // Test ori
 i = 1; SrcA = 32'd8; SrcB = 32'd2; af = 4'b0101;
 #10;
 // Test xori
 i = 1; SrcA = 32'd15; SrcB = 32'd1; af = 4'b0110;
 #10;
 // Test lui
 i = 1; SrcA = 32'd0; SrcB = 32'h0000FFFF; af = 4'b0111;
 #10;
 end

endmodule 