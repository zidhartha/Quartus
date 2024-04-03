module clockDivided (
    input clock,
    output reg resultClk = 0
);

reg [1:0] flipFlop = 2; 
always @(clock) begin
    if (flipFlop == 2'b10) begin
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

module clockDivided_tb;
    reg clock;
    wire resultClk;
    clockDivided uut0 (
        .clock(clock),
        .resultClk(resultClk)
    );

   
  
   
    initial
          clock = 1'b0;
     always
	  #10 clock = ~clock;
		 
endmodule 

