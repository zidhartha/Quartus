module incrementer_testbench();

reg clock = 0;
reg enable = 1;
reg reset = 1;
wire [29:0] count;

incrementer uut0(.clock(clock),.reset(reset),.enable(enable),.count(count));


always begin #1; clock = !clock; end

initial begin 


#20;

reset = 0; #20;

reset = 1; #20;

enable = 0; #20;


end

endmodule




