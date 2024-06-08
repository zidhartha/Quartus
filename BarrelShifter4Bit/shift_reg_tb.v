module shift_reg_tb();

reg clock = 0;
reg signal = 1;
reg reset = 1;
wire [3:0] out;

shiftReg_4bit uut0(clock, signal,reset,out);

always begin #1; clock = ~clock;

end
initial begin 
#10;

signal = 0; #10;

reset = 1; #10;

end

endmodule
