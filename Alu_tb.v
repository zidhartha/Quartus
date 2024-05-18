module Alu_tb();
  reg i;
  reg [31:0] SrcA, SrcB;
  reg [3:0] af;
  wire [31:0] Alures;
  wire Zero, Neg, ovfalu;

  ALU ALU(.i(i), .SrcA(SrcA), .SrcB(SrcB), .af(af), .Alures(Alures), .Zero(Zero), .Neg(Neg), .ovfalu(ovfalu));

  // Test input values
initial begin
    // Test case 1 - I-Type ADD operation with immediate
    i = 1;
    SrcA = 10;
    SrcB = 5;
    af = 4'b0000;
    #10;

    // Test case 2 - R-Type AND operation
    i = 0;
    SrcA = 12;
    SrcB = 8;
    af = 4'b1000;
    #10;

    // Test case 3 - I-Type SRL operation with immediate
    i = 1;
    SrcA = 20;
    SrcB = 2;
    af = 4'b0110;
    #10;
end
endmodule     
     