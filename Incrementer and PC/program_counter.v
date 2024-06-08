module program_counter(input clock,input reset,input[31:0] PC_MAX,output reg [31:0] PC = 0);

always @ ( posedge clock  or  negedge reset) begin
if ( ! reset ) PC <= 0 ;
 else begin
 PC <= PC + 1 ;
 if ( PC == PC_MAX) PC <= 0 ;
 end
 end
 endmodule
 
