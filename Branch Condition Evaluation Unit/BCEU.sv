module BCEU (input [31:0] a,input [31:0] b,
input [3:0] bf,output reg bcres);

always @(*) begin
case (bf)                                    
     4'b0010: bcres = (a[31] == 1);            // [a] < 0
     4'b0011: bcres = (a[31] == 0);            // [a] >= 0
     4'b0100: bcres = (a == b);                // a = b
     4'b0101: bcres = (a != b);                // a != b
     4'b0110: bcres = (a[31] == 1 || a == 0);  // [a] <= 0
     4'b0111: bcres = (a[31] == 0 && a != 0);  // [a] > 0
     default: bcres = 0;
endcase
end
endmodule

module BCEU_testbench();
reg [31:0] a;
reg [31:0] b;
reg [3:0] bf;
wire bcres;
BCEU test(.a(a),.b(b),.bf(bf),.bcres(bcres));
//initial begin
        //[a] < 0
        a = -1; bf = 4'b0010; #10;
//        //  [a] >= 0
        a = 1; bf = 4'b0011; #10;        
        // a = b
        a = 32'h12345678; b = 32'h12345678; bf = 4'b0100; #10;
        // a != b
        a = 32'h12345678; b = 32'h87654321; bf = 4'b0101; #10;        
        // [a] <= 0
        a = 0; bf = 4'b0110; #10;
        // [a] > 0
        a = 2; bf = 4'b0111; #10;
        
end
endmodule 
