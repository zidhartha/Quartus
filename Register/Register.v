module Register (
input clk , 
input EN , // enable write / read
input rst , 
input [4:0] selectW1 , // select for write
input [4:0] selectR1 , // select for reading
input [4:0] selectR2 , // select for reading
input read ,  // enabling read
input write , // // enabling write
input [31:0] addr , // input to store
output reg [31:0] outA , // output to read
output reg [31:0] outB   // output to read
);
reg [31:0] regfile [31:0];
integer i ;
always @ ( posedge clk or posedge rst ) begin
if ( rst == 1) begin
for ( i = 0; i < 32; i = i + 1) begin
regfile [ i ] = 32'b0 ;
end
end else if ( EN == 1) begin
case ({ read , write })
2'b01 : begin
if ( selectW1 != 0)
regfile [ selectW1 ] = addr ;
end
2'b10 : begin
outA = regfile [ selectR1 ];
outB = regfile [ selectR2 ];
end
2'b11 : begin
if ( selectW1 != 0)
regfile [ selectW1 ] = addr ;
outA = regfile [ selectR1 ];
outB = regfile [ selectR2 ];
end
endcase
end
end
endmodule 