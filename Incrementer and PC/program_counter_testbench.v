module program_counter_testbench();


reg clock = 0;
reg reset = 1;
reg [31:0] PC_MAX = 15;
wire [31:0] PC;

program_counter uut0(.clock(clock),.reset(reset),.PC_MAX(PC_MAX),.PC(PC));

always begin #1; clock = !clock; end

initial begin

#40;

reset = 0 ; #5;
reset = 1 ; #5;
end
 endmodule


