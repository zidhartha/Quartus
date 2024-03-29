module clockDivided (
    input clock,
    output reg resultClk
);

reg [1:0] flipFlop; 
always @(posedge clock) begin
    if (flipFlop == 2'b11) begin
        resultClk <= ~resultClk; 
        flipFlop <= 2'b00;        
    end else begin
        flipFlop <= flipFlop + 1; 
    end
end

initial begin
    flipFlop <= 2'b00; 
   resultClk <= 1'b0;  
end

endmodule


